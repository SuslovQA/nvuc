# Развёртывание NVUC на боевом сервере

Инструкция для администратора сервера. Подготовлена 24 сентября 2026 года для текущего проекта NVUC на Spring Boot 3.4.3 и Java 17. Пример окружения: Ubuntu 24.04 LTS, PostgreSQL 16, systemd, Nginx и HTTPS. Команды Linux выполняются на сервере, команды PowerShell — на компьютере сборки. Для другой ОС и внешней БД адаптируйте установку пакетов и пути.

Вместо journal.example.org, SERVER_IP и deploy подставьте домен, IP и имя SSH-пользователя. До публикации сайта необходимо запустить миграции, установить личный пароль администратора, загрузить реальные данные и проверить страницы. Источник реальных данных — предоставленный дамп nvuc_2026-09-06_12-03-06.dump. Миграция V4 заполняет пустую таблицу 42 журналами за 2011–2026 годы. Демонстрационные записи не создаются. Сам дамп и пароли из него в репозиторий не добавляются.

## 1 Что добавлено в проект

scripts/db/create-database.sql создаёт роль nvuc и базу nvuc, если их нет. Скрипт выполняется через psql с административными правами вне транзакции. Повторный последовательный запуск сохраняет существующие пароли, владельцев и данные. Не запускайте несколько экземпляров одновременно. Создание самой базы невозможно выполнить обычной миграцией Flyway: приложению сначала требуется подключиться к существующей базе.

src/main/resources/db/migration/V2__add_admin.sql — существующая миграция таблицы admin_users и исходной учётной записи admin. Файл не изменён: изменение применённой миграции вызывает ошибку контрольной суммы Flyway.

src/main/resources/db/migration/V3__create_journals.sql — новая миграция таблицы journals. Столбцы соответствуют сущности Journal: id, year, issue, title, title_en, contents, contents_en, description, description_en, cover, pdf. Описания хранятся как TEXT: в исходных данных есть тексты длиннее 5000 символов. Существующая таблица и её строки сохраняются. Если существующая структура несовместима с JPA, приложение остановится на validate; для исправления нужна отдельная согласованная миграция, а не ddl-auto=update.

src/main/resources/db/migration/V4__seed_real_journals.sql содержит реальный снимок 42 журналов с исходными id и именами файлов. При непустой таблице journals импорт пропускается целиком; существующие выпуски не меняются. После импорта последовательность id устанавливается на 44, следующий id будет 45.

scripts/db/initialize-admin.sql запрашивает BCrypt-хеш и заменяет только исходный хеш admin из V2. Если пароль уже изменён, он сохраняется. Скрипт также создаёт admin, если такая запись отсутствует. Это первоначальная настройка, а не механизм повторной смены пароля. Неверный формат хеша прекращает транзакцию без изменения данных.

## 2 Подготовка и резервная копия

Для нового сервера сначала настройте DNS A/AAAA. Если используется AAAA, IPv6 должен действительно вести на сервер. Разрешите входящие подключения к SSH на используемом порту, HTTP 80 и HTTPS 443. Порты приложения 8080 и PostgreSQL 5432 не открывайте наружу. Перед включением firewall сначала разрешите текущий SSH-порт, чтобы не потерять доступ.

При обновлении работающего сервера сначала выполните резервное копирование по разделу 11. Сохраните базу, хранилище файлов, старый JAR и конфигурацию одной согласованной версии. Проверьте восстановление в отдельном окружении. Убедитесь, что хватает диска для базы, резервной копии, файлов и логов.

Установите необходимые пакеты на новом сервере:

```bash
sudo apt update
sudo apt install openjdk-17-jre-headless postgresql postgresql-client nginx curl ca-certificates certbot python3-certbot-nginx python3-bcrypt
java -version
sudo systemctl enable --now postgresql
```

Создайте системного пользователя и каталоги. Команда useradd нужна только при отсутствии пользователя nvuc:

```bash
id nvuc || sudo useradd --system --user-group --home-dir /opt/nvuc --shell /usr/sbin/nologin nvuc
sudo install -d -o root -g nvuc -m 0750 /opt/nvuc /opt/nvuc/app
sudo install -d -o nvuc -g nvuc -m 0750 /opt/nvuc/storage
sudo install -d -o nvuc -g nvuc -m 0750 /opt/nvuc/storage/pdf /opt/nvuc/storage/covers /opt/nvuc/storage/documents /opt/nvuc/logs
sudo install -d -o root -g root -m 0700 /opt/nvuc/backups
sudo install -d -o root -g root -m 0750 /etc/nvuc
```

## 3 Создание базы и роли

Скопируйте каталог scripts/db из этой версии проекта на сервер, например в /tmp/nvuc-db. Для нового окружения выполните:

```bash
sudo -u postgres psql -X -d postgres -v ON_ERROR_STOP=1 -f /tmp/nvuc-db/create-database.sql
sudo -u postgres psql -X -d postgres
```

В открывшейся консоли psql установите отдельный надёжный пароль роли приложения:

```sql
\password nvuc
\q
```

Пароль вводится интерактивно и не попадает в командную строку. Пароль БД и пароль входа на сайт — разные секреты. Для другой базы и роли передайте -v db_name=ИМЯ -v db_user=РОЛЬ; дальше замените их во всех командах. Скрипт не меняет владельца уже существующей базы: проверьте выведенное имя owner. Для существующей роли проверьте LOGIN и минимально необходимые права, не назначайте ей SUPERUSER.

Проверьте подключение именно по TCP, как делает приложение:

```bash
psql -X -h 127.0.0.1 -U nvuc -d nvuc -W -c 'SELECT current_database(), current_user;'
```

Если доступ отклонён, проверьте pg_hba.conf для 127.0.0.1 и способ аутентификации scram-sha-256, а также listen_addresses. Не включайте trust для production. Для внешнего PostgreSQL используйте его адрес, сетевой доступ только с сервера приложения и TLS с проверкой сертификата.

## 4 Сборка и перенос приложения

На компьютере разработчика из корня проекта выполните PowerShell-команды. Для сборки требуется JDK 17, на сервере достаточно JRE 17:

```powershell
.\mvnw.cmd clean "-Dtest=AdminJournalServiceTests,FileStorageServiceTests,JournalWebTests" test
.\mvnw.cmd -DskipTests package
Get-FileHash .\target\nvuc-app.jar -Algorithm SHA256
scp .\target\nvuc-app.jar deploy@SERVER_IP:/home/deploy/nvuc-app.jar.upload
scp -r .\scripts\db deploy@SERVER_IP:/tmp/nvuc-db
```

Проверяйте код завершения каждой команды. Второй шаг пропускает повторное выполнение тестов только после успешного первого. Полный test включает contextLoads и требует отдельной PostgreSQL-базы, переменных подключения и каталога файлов. Не используйте боевую БД для тестов. Для Linux замените mvnw.cmd на ./mvnw.

На сервере сравните SHA256 с полученным локально и установите JAR. Для обновления сначала остановите сервис и сделайте резервную копию по разделу 11:

```bash
sha256sum /home/deploy/nvuc-app.jar.upload
sudo install -o root -g nvuc -m 0640 /home/deploy/nvuc-app.jar.upload /opt/nvuc/app/nvuc-app.jar.next
sudo mv /opt/nvuc/app/nvuc-app.jar.next /opt/nvuc/app/nvuc-app.jar
```

## 5 Переменные окружения

Создайте файл через sudoedit /etc/nvuc/nvuc.env. Укажите реальные значения и сохраните с доступом только root:

```ini
DB_url=jdbc:postgresql://127.0.0.1:5432/nvuc
DB_USERNAME=nvuc
DB_PASSWORD='ЗАМЕНИТЬ_НА_ПАРОЛЬ_БД'
PDF_STORAGE_PATH=/opt/nvuc/storage
LOG_DIR=/opt/nvuc/logs
SERVER_ADDRESS=127.0.0.1
SERVER_PORT=8080
SERVER_SERVLET_SESSION_COOKIE_HTTP_ONLY=true
SERVER_SERVLET_SESSION_COOKIE_SECURE=true
SERVER_SERVLET_SESSION_COOKIE_SAME_SITE=lax
```

```bash
sudo chown root:root /etc/nvuc/nvuc.env
sudo chmod 0600 /etc/nvuc/nvuc.env
```

Имя DB_url регистрозависимо. Не используйте export в EnvironmentFile и не подключайте этот файл как shell-скрипт. Учитывайте правила кавычек systemd, если пароль содержит кавычки или обратные слеши. Не добавляйте файл в Git, не печатайте секреты в журналы. Профиль dev на боевом сервере не включается. Secure-cookie требует HTTPS для входа через браузер; локальный HTTP используется только для проверки доступности.

## 6 Сервис systemd и первый запуск

Создайте /etc/systemd/system/nvuc.service со следующим содержимым:

```ini
[Unit]
Description=NVUC journal website
Wants=network-online.target
After=network-online.target postgresql.service
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
User=nvuc
Group=nvuc
WorkingDirectory=/opt/nvuc/app
EnvironmentFile=/etc/nvuc/nvuc.env
ExecStart=/usr/bin/java -Xms128m -Xmx512m -jar /opt/nvuc/app/nvuc-app.jar
Restart=on-failure
RestartSec=10
TimeoutStopSec=60
UMask=0027
NoNewPrivileges=true
PrivateTmp=true
ProtectHome=true
ProtectSystem=strict
ReadWritePaths=/opt/nvuc/storage /opt/nvuc/logs
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

512 MB — пример лимита Java heap, а не всего процесса. Оставьте память для JVM вне heap, PostgreSQL, Nginx и ОС; настройте лимит по фактической нагрузке. Для удалённой БД зависимость postgresql.service не нужна.

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now nvuc
sudo systemctl status nvuc --no-pager
sudo journalctl -u nvuc -n 150 --no-pager
curl --fail --show-error http://127.0.0.1:8080/
sudo ss -ltnp
```

На пустой базе Flyway автоматически применит V2, затем V3 и V4; Hibernate проверит структуру. Отдельно выполнять SQL миграций через psql не нужно: иначе история Flyway будет расходиться со схемой. Проверить результат можно следующей командой:

```bash
psql -X -h 127.0.0.1 -U nvuc -d nvuc -W -c 'SELECT version, description, success FROM flyway_schema_history ORDER BY installed_rank;'
```

В базе должны существовать journals, admin_users и flyway_schema_history. До изменения исходного пароля admin и наполнения реальными данными не включайте публичный Nginx-прокси.

## 7 Существующая база без истории Flyway

Если таблицы есть, но flyway_schema_history отсутствует, автоматический migrate завершится ошибкой непустой схемы. Это защитное поведение. Сначала снимите резервную копию, сравните фактическую структуру с сущностями и проверьте процедуру на копии базы.

Только после такой проверки допустим однократный baseline версии 1: существующая схема принимается как исходная, затем запускаются V2, V3 и V4. Для одноразового запуска через systemd временно добавьте в nvuc.env следующие строки, запустите приложение и проверьте историю:

```ini
SPRING_FLYWAY_BASELINE_ON_MIGRATE=true
SPRING_FLYWAY_BASELINE_VERSION=1
```

После успешного запуска немедленно удалите обе строки и перезапустите сервис. Не оставляйте baseline-on-migrate включённым: он может скрыть ошибочное подключение к чужой базе. Не выбирайте baselineVersion=3, иначе создание таблиц будет пропущено. Если история Flyway уже есть, baseline не нужен. Не делайте repair при ошибке checksum без выяснения причин; верните исходную применённую миграцию из соответствующего релиза.

## 8 Настройка администратора

V2 содержит исходную учётную запись. До публикации необходимо заменить её пароль. На сервере с python3-bcrypt сформируйте хеш интерактивно; пароль не передаётся параметром процесса:

```bash
python3 - <<'PY'
import bcrypt, getpass
p = getpass.getpass('New administrator password: ')
assert p == getpass.getpass('Repeat password: '), 'Passwords differ'
b = p.encode('utf-8')
assert 12 <= len(p) and len(b) <= 72, 'Use at least 12 characters and at most 72 UTF-8 bytes'
print(bcrypt.hashpw(b, bcrypt.gensalt(rounds=12, prefix=b'2a')).decode())
PY
psql -X -h 127.0.0.1 -U nvuc -d nvuc -W -f /tmp/nvuc-db/initialize-admin.sql
```

Скопируйте полученный хеш в приглашение BCrypt hash for admin. Скрипт должен показать password_customized=true. Повторный запуск с другим хешем не меняет уже установленный пароль. Если перенесённая база уже содержит личный пароль admin, используйте его; этот скрипт его не сбросит. Хеш тоже следует хранить конфиденциально.

## 9 Наполнение реальными данными

Использован файл D:\1\nvuc_2026-09-06_12-03-06.dump. Архив создан PostgreSQL 16.15 6 сентября 2026 года, содержит 42 журнала, одну учётную запись администратора и историю Flyway с baseline 1 и V2. SHA256 источника: 89fbe1208d58503ecee12c77057dec08530553ed0b93afccb00bf3a3720fbd30.

Выберите один из двух способов. Не восстанавливайте полный дамп поверх базы, уже заполненной миграциями.

Способ А — новая установка из миграций. Создайте пустую базу по разделу 3 и запустите приложение. V2 создаст администратора, V3 создаст journals, V4 загрузит реальные 42 записи. Это основной путь, если нужно развернуть сайт из текущего кода без переноса прежнего пароля. Установите новый личный пароль по разделу 8. В V4 нет хеша администратора из предоставленного дампа.

Способ Б — полный перенос базы со старой учётной записью. Создайте пустую целевую базу и до первого запуска приложения восстановите доверенный дамп. В отличие от способа А переносится также старый пароль администратора и история Flyway. Используйте pg_restore версии не ниже 16; сначала проверьте оглавление:

```bash
pg_restore --list /path/to/nvuc_2026-09-06_12-03-06.dump
pg_restore --exit-on-error --single-transaction --no-owner --no-privileges -h 127.0.0.1 -U nvuc -d nvuc -W /path/to/nvuc_2026-09-06_12-03-06.dump
```

Затем запустите приложение: оно проверит V2, выполнит V3 без пересоздания таблицы, а V4 пропустит наполнение непустой journals. Baseline для этого дампа не нужен: история уже есть. Используйте прежний личный пароль admin; initialize-admin.sql не сбрасывает его. Если pg_restore завершился ошибкой, не запускайте приложение до выяснения причины.

При обновлении заполненной production-базы ничего импортировать из старого дампа не нужно: более свежие данные являются основными. V4 не объединяет снимок с существующими строками и не восстанавливает отдельно удалённые выпуски. Если нужна такая операция, сначала определите правила конфликтов и проверьте отдельный импорт на копии базы.

Снимок хранит оригинальные текстовые поля без обрезки. Наибольшее описание RU имеет 5956 символов, EN — 6538. Форма редактирования по-прежнему ограничена 5000 символами: редактирование длинного унаследованного описания потребует сокращения текста либо отдельного изменения правил формы. Лимиты формы в этой задаче не менялись.

Дамп PostgreSQL не содержит сами PDF и изображения, только их имена. Каталог исходных файлов нужно перенести отдельно. В 30 записях задано имя PDF; отсутствие PDF в остальных строках соответствует источнику. Перенесите файлы в /opt/nvuc/storage/pdf, covers и documents, сохраняя имена из базы. Для статических документов используются charter.pdf, design_requirements.pdf, copyright_agreement.pdf и procedure_for_reviewing.pdf, а также версии с суффиксом _en.

```bash
sudo chown -R nvuc:nvuc /opt/nvuc/storage
sudo find /opt/nvuc/storage -type d -exec chmod 0750 {} \;
sudo find /opt/nvuc/storage -type f -exec chmod 0640 {} \;
psql -X -h 127.0.0.1 -U nvuc -d nvuc -W -c 'SELECT count(*), min(year), max(year), max(id) FROM journals;'
```

Для чистой установки ожидается count=42, min=2011, max=2026, max(id)=44. Сравните несколько записей на обоих языках и проверьте доступность всех связанных файлов. Отсутствующие PDF и изображения не могут быть восстановлены из этого дампа.

## 10 Nginx и HTTPS

После успешного локального запуска, настройки администратора и проверки данных создайте /etc/nginx/sites-available/nvuc. Пример рассчитан на один внешний Nginx перед приложением:

```nginx
server {
    listen 80;
    server_name journal.example.org;
    client_max_body_size 60m;
    access_log /var/log/nginx/nvuc.access.log;
    error_log /var/log/nginx/nvuc.error.log;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Port $server_port;
        proxy_set_header Forwarded "";
        proxy_connect_timeout 5s;
        proxy_read_timeout 120s;
        proxy_send_timeout 120s;
        proxy_cache off;
    }
}
```

Предел файла в приложении 50 MB, всего multipart-запроса — 60 MB. Если перед Nginx есть CDN или ещё один прокси, отдельно настройте доверенные адреса и обработку реального IP. Не доверяйте произвольным forwarded-заголовкам от клиента.

```bash
sudo ln -s /etc/nginx/sites-available/nvuc /etc/nginx/sites-enabled/nvuc
sudo nginx -t
sudo systemctl reload nginx
sudo certbot --nginx -d journal.example.org --redirect
sudo certbot renew --dry-run
systemctl list-timers --all | grep certbot
curl --fail --show-error -I https://journal.example.org/
```

Создавайте символьную ссылку только если её ещё нет. Выполняйте reload только при успешном nginx -t. Для выпуска сертификата домен должен вести на сервер, а порт 80 быть доступен извне. Проверьте, что запрос по HTTP перенаправляется на HTTPS.

В текущем приложении языковой вариант документов выбирается по cookie, а файлы получают длительный Cache-Control. Для /files/documents/ отключите кеширование отдельным location ^~ /files/documents/: скопируйте настройки proxy из location / и дополнительно добавьте proxy_hide_header Cache-Control; proxy_hide_header Expires; add_header Cache-Control "private, no-store" always;. Проверьте переключение RU/EN и замену PDF. Уже сохранённые браузером старые ответы могут потребовать очистки кеша или нового URL файла.

## 11 Обновление и резервное копирование

Планируйте короткое окно обслуживания: остановка приложения предотвращает рассогласование записей и загруженных файлов при копировании. При наличии других писателей остановите и их. Команды ниже выполняются в root-shell sudo -i. Имя БД и пути заменяются, если отличаются от примера:

```bash
set -euo pipefail
stamp=$(date +%Y%m%d-%H%M%S)
backup=/opt/nvuc/backups/$stamp
install -d -m 0700 "$backup"
systemctl stop nvuc
cp /opt/nvuc/app/nvuc-app.jar "$backup/nvuc-app.jar"
runuser -u postgres -- pg_dump -Fc nvuc > "$backup/nvuc.dump"
tar -C /opt/nvuc -czf "$backup/storage.tar.gz" storage
cp /etc/nvuc/nvuc.env "$backup/nvuc.env"
cp /etc/systemd/system/nvuc.service "$backup/nvuc.service"
cp /etc/nginx/sites-available/nvuc "$backup/nginx.conf"
pg_restore --list "$backup/nvuc.dump" > "$backup/dump-list.txt"
tar -tzf "$backup/storage.tar.gz" > "$backup/files-list.txt"
```

При ошибке остановитесь, выясните причину и запустите старый сервис; не продолжайте замену JAR. Проверка списка подтверждает читаемость архива, но не заменяет пробное восстановление. Храните зашифрованную резервную копию вне сервера и регулярно проверяйте восстановление. Дамп содержит учётные записи и хеши паролей; каталог backups должен быть закрыт.

Затем установите проверенный JAR через временный файл в том же каталоге и выполните systemctl start nvuc. V3 сохраняет существующую таблицу. V4 заполняет только пустую journals; при наличии хотя бы одной записи снимок пропускается целиком. Flyway фиксирует факт выполнения V4 и не запускает её повторно при обычном рестарте. Для дополнительного импорта после этого нужна новая операция, а не изменение V4.

Пример ожидания готовности после запуска:

```bash
ready=0
for attempt in $(seq 1 60); do
  if curl --fail --silent --show-error --connect-timeout 2 --max-time 5 http://127.0.0.1:8080/ >/dev/null; then
    ready=1
    break
  fi
  sleep 2
done
if [ "$ready" -ne 1 ]; then
  journalctl -u nvuc -n 150 --no-pager
  exit 1
fi
curl --fail --show-error --max-time 15 https://journal.example.org/ >/dev/null
```

systemctl is-active недостаточно: процесс может существовать, но ещё не принимать HTTP. В проекте нет Actuator, поэтому /actuator/health использовать как готовый endpoint нельзя.

## 12 Проверки после развёртывания

Проверьте главную страницу, архив, открытие каждого перенесённого журнала, RU/EN, обложки и ссылки PDF. Сравните число записей с выбранным способом переноса: чистая установка со снимком должна содержать 42 журнала. Существующая заполненная база сохраняет своё число записей.

Проверьте вход администратора с личным паролем, выход, запрет доступа к административным действиям без входа и правильный возврат ошибок формы. На тестовом окружении выполните создание, редактирование и удаление журнала с PDF и обложкой. На боевом используйте согласованную временную запись, чтобы не менять реальные выпуски случайно. Проверьте отказ для неверного типа файла и слишком большого запроса, мобильную вёрстку, корректность ссылок и отсутствие ошибок в консоли браузера.

Убедитесь, что порт 8080 слушает только 127.0.0.1, сертификат действителен, HTTP перенаправляет на HTTPS, cookie сессии имеет Secure и HttpOnly. После согласованного рестарта сервера приложение и PostgreSQL должны стартовать автоматически. Проверьте свободный диск, ротацию логов и процедуру резервного копирования.

## 13 Диагностика ошибки 502

502 означает, что Nginx не получил корректный ответ от приложения. Сначала проверьте backend напрямую, затем журнал приложения, затем Nginx:

```bash
curl -v --max-time 10 http://127.0.0.1:8080/
sudo systemctl status nvuc --no-pager
sudo journalctl -u nvuc -n 200 --no-pager
sudo tail -n 100 /opt/nvuc/logs/nvuc.log
sudo tail -n 100 /var/log/nginx/nvuc.error.log
sudo ss -ltnp
```

Connection refused: Java не запущена, ещё стартует либо слушает другой порт. Сверьте server.address/port и proxy_pass. Ошибка отсутствующей journals: проверьте, что JAR содержит V3 и Flyway включён. Ошибка checksum: применённый SQL не совпадает с текущим, не маскируйте её автоматическим repair.

Ошибка подключения к PostgreSQL: проверьте JDBC URL, DB_url, пользователя, пароль и pg_hba.conf. Permission denied: проверьте права каталогов storage и logs для пользователя nvuc. Address already in use: порт занят другим процессом, установите его владельца до остановки. upstream timed out: исследуйте зависание и медленные запросы; увеличение таймаута без диагностики проблему не устраняет. OOM или killed: проверьте память и журнал ядра, например journalctl -k.

Если локальный backend отвечает успешно, а домен возвращает 502, проверьте выбранный server-блок Nginx, адрес upstream, DNS и промежуточный CDN. Анализируйте логи именно боевого сервера за время ошибки: локальный nvuc.log с тестовыми запусками не объясняет production-сбой.

## 14 Откат

Сначала остановите сервис. Если схема совместима со старым приложением, установите JAR из выбранной резервной копии через .next и mv, затем запустите сервис и повторите HTTP-проверки. V3 и V4 не удаляют столбцы или данные, но совместимость конкретного старого JAR всё равно нужно проверить заранее.

Для возврата базы к прежнему состоянию безопаснее восстановить резервную копию в отдельную базу, проверить её и переключить JDBC URL при остановленном приложении. Восстановите согласованную копию хранилища. Не выполняйте DROP DATABASE или pg_restore --clean на production без отдельного плана: это может уничтожить новые записи и загрузки после резервной копии. Не удаляйте строки flyway_schema_history для принудительного повторения миграций.

## 15 Автоматизация деплоя

В проекте есть GitHub Actions workflow с SSH-деплоем. Перед использованием с приведёнными root-owned путями адаптируйте его: загружайте JAR во временный каталог SSH-пользователя, затем устанавливайте через ограниченный серверный скрипт. Запись напрямую в /opt/nvuc/app обычному deploy-пользователю недоступна.

Добавьте запуск тестов, проверенный SSH host key, запрет параллельных деплоев, резервное копирование до обновления и HTTP-проверку после запуска. Не ограничивайтесь systemctl is-active. Права sudo выдавайте только на необходимые команды или root-owned скрипт; не используйте NOPASSWD ALL. Secrets SERVER_HOST, SERVER_USER и SERVER_SSH_KEY хранятся в настройках репозитория. Изменение pipeline в рамках этой инструкции не выполнялось.

## 16 Справочные источники

PostgreSQL psql и метакоманды: https://www.postgresql.org/docs/16/app-psql.html

PostgreSQL резервное копирование: https://www.postgresql.org/docs/16/backup-dump.html

Flyway baseline: https://documentation.red-gate.com/flyway/reference/commands/baseline

Spring Boot установка сервиса: https://docs.spring.io/spring-boot/3.4/how-to/deployment/installing.html

Nginx proxy: https://nginx.org/en/docs/http/ngx_http_proxy_module.html

Certbot: https://certbot.eff.org/instructions
