[![Build and Deploy NVUC](https://github.com/SuslovQA/nvuc/actions/workflows/deploy.yml/badge.svg)](https://github.com/SuslovQA/nvuc/actions/workflows/deploy.yml)

## Настройки запуска

- `DB_url`, `DB_USERNAME`, `DB_PASSWORD` — подключение к PostgreSQL.
- `PDF_STORAGE_PATH` — каталог файлов журнала.
- `LOG_DIR` — каталог логов (по умолчанию `./logs`). Для прежнего расположения на сервере задайте `LOG_DIR=/opt/nvuc/logs`.
- `SPRING_PROFILES_ACTIVE=dev` — отключает кеш шаблонов и включает SQL/Security DEBUG для разработки.

В обычном режиме кеш шаблонов включён, SQL не выводится. Логи записываются в UTF-8, ротируются ежедневно и при достижении 20 MB; история ограничена 30 днями и 1 GB.

## Проверки

Регрессионные тесты контроллеров, валидации и файловых операций не требуют PostgreSQL:

```shell
./mvnw -Dtest=AdminJournalServiceTests,FileStorageServiceTests,JournalWebTests test
```

На Windows используйте `mvnw.cmd`. Полный `test`, включая `contextLoads`, требует настроенной БД и каталога файлов.

Старые файлы удаляются после успешной транзакции БД; при откате удаляются новые загрузки. Если очистка не удалась, имя файла записывается в ERROR для повторного удаления оператором. Автоматической очереди повторов нет; аварийное завершение процесса между файловой операцией и завершением транзакции может оставить неиспользуемые файлы.

Проверка загрузок сопоставляет MIME-тип с сигнатурой PDF/JPEG/PNG/WebP; она не является полной проверкой структуры документа. Поле выпуска остаётся строковым, существующая сортировка сохранена.

## База данных и развёртывание

Подробная инструкция: [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md).

- `scripts/db/create-database.sql` создаёт PostgreSQL-базу и роль через psql; пароль задаётся отдельно.
- Flyway применяет неизменённую V2, новую V3 с таблицей journals и V4 с 42 реальными журналами из дампа от 06.09.2026. V4 наполняет только пустую таблицу; существующие записи сохраняются.
- `scripts/db/initialize-admin.sql` устанавливает личный BCrypt-хеш только вместо исходного пароля admin. Уже изменённый пароль сохраняется.
- Сам дамп, пароль администратора из него и файлы PDF/обложек не включаются в миграции. Файловое хранилище переносится отдельно.

Интеграционные тесты миграций работают только с явно заданной тестовой PostgreSQL-базой. Они создают и удаляют собственные случайные схемы; не указывайте production:

```powershell
$env:NVUC_MIGRATION_TEST_URL='jdbc:postgresql://127.0.0.1:5432/nvuc_test'
$env:NVUC_MIGRATION_TEST_USER='nvuc_test'
$env:NVUC_MIGRATION_TEST_PASSWORD='test-password'
.\mvnw.cmd "-Dtest=DatabaseMigrationTests" test
```

Без `NVUC_MIGRATION_TEST_URL` эти два интеграционных теста пропускаются.
