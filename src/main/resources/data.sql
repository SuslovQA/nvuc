DROP TABLE IF EXISTS journals CASCADE;

CREATE TABLE journals
(
    id             BIGSERIAL PRIMARY KEY,
    title          VARCHAR(255),
    title_en       VARCHAR(255),
    description    TEXT,
    description_en TEXT,
    issue          INTEGER NOT NULL,
    year           INTEGER NOT NULL,
    contents       TEXT,
    contents_en    TEXT,
    cover          VARCHAR(255),
    pdf            VARCHAR(255)
);

INSERT INTO journals (year, issue, title, title_en, description, description_en, contents, contents_en, cover, pdf)
VALUES (2019,
        16,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 16',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 16',
        '<p><strong>Актуальные проблемы языка и культуры:</strong></p>
        <p><strong>Труды Второй межвузовской научно-практической конференции со всероссийским участием (Екатеринбург, 31 октября 2018 года)</strong></p><br>
        <p style="text-align: justify;"><em>Основу настоящего (16-го) выпуска Научного вестника Уральской консерватории составляют материалы Второй межвузовской научно-практической конференции со всероссийским участием «Актуальные проблемы языка и культуры», организованной кафедрой общих гуманитарных дисциплин и состоявшейся в УГК имени М. П. Мусоргского 31 октября 2018 года. В конференции приняли участие как маститые учёные, так и молодые исследователи из разных музыкальных вузов и других научных центров Екатеринбурга, а также Москвы, Санкт-Петербурга, Перми, Ханты-Мансийска. Издание содержит результаты новейших изысканий российских учёных по актуальным вопросам русской и зарубежной философии, эстетики и куль-турологии, музыкознания, теории и практики языка и межкультурных коммуникаций, методики преподавания предметов общегуманитарного цикла. Для специалистов и всех интересующихся проблемами современных гуманитарных наук.
        </em></p><br>
        <p><em>Отв. ред:</em>&nbsp;Д.С. Бирюков, Д.И. Макаров, Л.А. Серебрякова</p>
        <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2019</p>
        <p><em>Количество страниц:</em>&nbsp;220 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><strong>Current Issues in Language and Culture:</strong></p>
        <p><strong>Proceedings of the Second Interuniversity Research and Practical Conference with All-Russian Participation (Yekaterinburg, October 31, 2018)</strong></p><br>
        <p style="text-align: justify;"><em>
        The present (16th) issue of the Scientific Bulletin of the Ural Conservatory is based on materials from the Second Interuniversity Research and Practical Conference with All-Russian Participation, “Current Issues in Language and Culture,” organized by the Department of General Humanities and held at the M.P. Mussorgsky Ural State Conservatory on October 31, 2018. The conference brought together both distinguished scholars and young researchers from various music universities and other research centers in Yekaterinburg, as well as from Moscow, St. Petersburg, Perm, and Khanty-Mansiysk. The publication presents the results of the latest research by Russian scholars on topical issues in Russian and foreign philosophy, aesthetics and cultural studies, musicology, language theory and practice, intercultural communication, and methods of teaching subjects within the humanities. The publication is intended for specialists and anyone interested in contemporary humanities.
        </em></p><br>
        <p><em>Editors-in-Chief: D.S. Biryukov, D.I. Makarov, L.A. Serebryakova</p>
        <p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2019</p>
        <p><em>Number of pages:</em>&nbsp;220 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p>I. ФИЛОСОФИЯ, ИСТОРИЯ<br>
        <em>Лобовиков В.О.</em> Лингвистический принцип композициональности значений в формально-аксиологической семантике естественного языка (Формально-аксиологические значения бинарных связок «… с …», «… без …», «… в …»)<br>
        <em>Азаренко С.А.</em> Социально-топологическая методология и топологемы культурного бытия<br>
        <em>Коробова Н.И.</em> Параметры и специфика проявлений современной художественной культуры<br>
        <em>Холодов Е.В.</em> Концепция четырёх главных добродетелей в среднем платонизме<br>
        <em>Болтрушевич С.А.</em> Язык платоновского «Тимея» и Книги Бытия в трактате Филона Александрийского «О сотворении мира согласно Моисею»<br>
        <em>Пернбаум А.Г.</em> Гомилия Псевдо-Василия Кесарийского как образец византийского торжественного красноречия V века<br>
        <em>Щукин Т.А.</em> Иерархия в терминах: различие между «сущностью» и «природой» в сочинениях Михаила Пселла<br>
        <em>Макаров Д.И.</em> «Слово об образованности» византийского гуманиста XIV века Феодора Метохита: манифест традиционализма (главы 7–9)<br>
        <em>Бирюков Д.С.</em> Линии развития монадологических идей от античной к раннехристианской мысли<br>
        <em>Бирюков Д.С.</em> К вопросу о структуре универсума в паламитской доктрине: возникновение и развитие учения об энергиях-началах сущего<br>
        <em>Возчиков Д.В.</em> Два капитана, три тирана и четыре короля: образ империи Виджаянагар 1560-х годов в сообщении венецианского купца<br>
        <br>
        II. МУЗЫКОЗНАНИЕ, ФИЛОЛОГИЯ<br>
        <em>Петухова С.А.</em> Дистанционная научная полемика в отечественном музыковедении: опыт постановки проблемы<br>
        <em>Мурзин О.И.</em> Лексическая лакунарность в аспекте межкультурной коммуникации русских и немцев<br>
        <em>Горяев С.О., Солнцева И.И.</em> Ассоциативный фон православного музыкального эргонима<br><br>
        III. ВОПРОСЫ МЕТОДИКИ<br>
        <em>Кручинина Л.И.</em> Роль иностранных языков в профессиональном становлении музыканта<br>
        <em>Ситникова Ж.Ю.</em> Компьютерная семиотика и интерфейс нотных редакторов<br>
        <em>Баева Ю.М.</em> Использование дыхательной гимнастики А.Н. Стрельниковой в качестве оздоровительной методики<br><br>IV. ОПЫТЫ МОЛОДЫХ<br>
        <em>Мерзлов А.Н.</em> К вопросу о творческих параллелях между С.В. Рахманиновым и М.А. Врубелем<br>
        <em>Басова Е.С.</em> Отражение наследия ирландской и шотландской культуры в творчестве композиторов-классиков</p>',
        '<p>I. PHILOSOPHY, HISTORY<br>
         <em>V.O. Lobovikov</em> The Linguistic Principle of Compositionality of Meanings in the Formal-Axiological Semantics of Natural Language (Formal-Axiological Meanings of the Binary Connectives “… with …,” “… without …,” “… in …”)<br>
         <em>S.A. Azarenko</em> Socio-Topological Methodology and Topologemes of Cultural Being<br>
         <em>N.I. Korobova</em> Parameters and Specific Features of Contemporary Artistic Culture<br>
         <em>E.V. Kholodov</em> The Concept of the Four Cardinal Virtues in Middle Platonism<br>
         <em>S.A. Boltrushevich</em> The Language of Plato’s “Timaeus” and the Book of Genesis in Philo of Alexandria’s Treatise “On the Creation of the World According to Moses”<br>
         <em>A.G. Pernbaum</em> The Homily of Pseudo-Basil of Caesarea as an Example of Byzantine Ceremonial Oratory of the Fifth Century<br>
         <em>T.A. Shchukin</em> Hierarchy in Terms: The Distinction between “Essence” and “Nature” in the Works of Michael Psellos<br>
         <em>D.I. Makarov</em> “The Discourse on Education” by the Fourteenth-Century Byzantine Humanist Theodore Metochites: A Manifesto of Traditionalism (Chapters 7–9)<br>
         <em>D.S. Biryukov</em> Lines of Development of Monadic Ideas from Ancient to Early Christian Thought<br>
         <em>D.S. Biryukov</em> On the Structure of the Universe in the Palamite Doctrine: The Emergence and Development of the Teaching on the Energies-Principles of Being<br>
         <em>D.V. Vozchikov</em> Two Captains, Three Tyrants, and Four Kings: The Image of the Vijayanagara Empire in the 1560s in the Account of a Venetian Merchant<br>
         <br>
         II. MUSICOLOGY, PHILOLOGY<br>
         <em>S.A. Petukhova</em> Remote Scholarly Debate in Russian Musicology: An Approach to Formulating the Problem<br>
         <em>O.I. Murzin</em> Lexical Lacunarity in the Context of Intercultural Communication between Russians and Germans<br>
         <em>S.O. Goryaev, I.I. Solntseva</em> The Associative Background of an Orthodox Musical Ergonym<br><br>
         III. TEACHING METHODOLOGY<br>
         <em>L.I. Kruchinina</em> The Role of Foreign Languages in the Professional Development of a Musician<br>
         <em>Z.Yu. Sitnikova</em> Computer Semiotics and the Interface of Music Notation Software<br>
         <em>Yu.M. Baeva</em> The Use of A.N. Strelnikova’s Breathing Exercises as a Health-Improving Method<br><br>
         IV. YOUNG RESEARCHERS’ STUDIES<br>
         <em>A.N. Merzlov</em> On Creative Parallels between S.V. Rachmaninoff and M.A. Vrubel<br>
         <em>E.S. Basova</em> Reflections of Irish and Scottish Cultural Heritage in the Works of Classical Composers</p>',
        'cover16.jpg',
        '2019_16.pdf'),

       (2019,
        17,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 17',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 17',
        '<p><strong>Императорское Русское музыкальное общество: на переломах истории</strong></p>
         <p><strong>Материалы Международной научно-практической конференции</strong></p>
         <p>&nbsp;</p>
         <p><em>Редакторы:</em>&nbsp;Е.Е. Полоцкая (отв. ред.), М.В. Городилова, А.Г. Коробова</p>
         <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2019</p>
         <p><em>Количество страниц:</em>&nbsp;250 с.</p>
         <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
        '<p><strong>The Imperial Russian Musical Society: At the Turning Points of History</strong></p>
         <p><strong>Proceedings of the International Research and Practical Conference</strong></p>
         <p>&nbsp;</p>
         <p><em>Editors:</em>&nbsp;E.E. Polotskaya (Executive Editor), M.V. Gorodilova, A.G. Korobova</p>
         <p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2019</p>
         <p><em>Number of pages:</em>&nbsp;250 pp.</p>
         <p><em>Circulation:</em>&nbsp;100 copies.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
        '<p>РУССКОЕ МУЗЫКАЛЬНОЕ ОБЩЕСТВО КАК СОЦИОКУЛЬТУРНОЕ ЯВЛЕНИЕ&nbsp;/p>
         <p><em>Полоцкая Е.&nbsp;</em>Русское музыкальное общество: предыстория, организационное устройство, сферы деятельности&nbsp;</p>
         <p><em>Ефимова Н.</em>&nbsp;Императорское Русское музыкальное общество: прошлое и настоящее</p>
         <p><em>Моисеев Г.&nbsp;</em>Русское музыкальное общество под августейшим покровительством</p>
         <p><em>Шелудякова О.&nbsp;</em>Музыкальные страницы архивов святых Царственных страстотерпцев</p>
         <p><em>Коларова-Гидишка Э.</em>&nbsp;Роль Императорского Русского музыкального общества в становлении болгарской музыкальной школы конца ХІХ – начала ХХ века: к истории интеркультурного диалога</p>
         <p><em>Кркотич К., Ефимова Н.&nbsp;Сербско-русское сотрудничество в зеркале международных контактов Русского музыкального общества</p>
         <p><em>Щапова Е.</em>&nbsp;Отражение деятельности Императорского Русского музыкального общества в немецкоязычной музыкальной критике начала XX века</p>
         <p><em>Шабшаевич Е.</em>&nbsp;Московское отделение Императорского Русского музыкального общества и зарубежные концертные агентства (к постановке проблемы)</p>
         <p><em>Гармаш О.</em>&nbsp;Императорское Русское музыкальное общество в деле учреждения Вспомогательной кассы для музыкальных художников (социальный аспект)<br><br></p>
         <p>РУССКОЕ МУЗЫКАЛЬНОЕ ОБЩЕСТВО В РУССКОЙ МУЗЫКАЛЬНОЙ КУЛЬТУРЕ</p>
         <p><em>Дабаева И.</em>&nbsp;Роль Императорского Русского музыкального общества в развитии хоровой культуры в XIX–XX веках</p>
         <p><em>Шарма Е.&nbsp;</em>Императорское Русское музыкальное общество в деле становления отечественного вокального образования</p>
         <p><em>Полоцкая Е.&nbsp;</em>Пётр Ильич Чайковский и Русское музыкальное общество: социокультурный аспект взаимодействия</p>
         <p><em>Комаров А.&nbsp;</em>Пётр Ильич Чайковский и Русское музыкальное общество. Творческий аспект взаимодействия</p>
         <p><em>Жеурова В., Шарма Е.</em>&nbsp;Династия певцов Лодий в истории Императорского Русского музыкального общества</p>
         <p><em>Валькова В.&nbsp;</em>Провинциальные конфликты: к проблеме «центр – периферия» в деятельности ИРМО<br><br></p>
         <p>ОТДЕЛЕНИЯ РУССКОГО МУЗЫКАЛЬНОГО ОБЩЕСТВА В РОССИЙСКОЙ ИМПЕРИИ&nbsp;</p>
         <p><em>Глушкова О.&nbsp;</em>Об учебно-педагогической работе Московской консерватории Русского музыкального общества</p>
         <p><em>Зинькевич Е.&nbsp;</em>«Человек-оркестр» – Александр Николаевич Виноградский (1855–1912)&nbsp;</p>
         <p><em>Порфирьева Е.</em>&nbsp;Казанское отделение Императорского Русского музыкального общества и его роль в развитии музыкальной культуры Волжско-Камского региона</p>
         <p><em>Полозова И.&nbsp;</em>История становления и развития Саратовского отделения Императорского Русского музыкального общества</p>
         <p><em>Сиднева Т., Куклев А.&nbsp;От регионального отделения ИРМО к консерватории: становление профессионального музыкального образования в Нижнем Новгороде</p>
         <p><em>Пыльнева Л.</em>&nbsp;Императорское Русское музыкальное общество в городах Сибири конца XIX – начала XX столетия: проблемы и достижения</p>
         <p><em>Кузённая О.</em>&nbsp;Отчёты Тобольского отделения Императорского Русского музыкального общества как исторический источник</p>
         <p><em>Каплун Т.</em>&nbsp;Исторические пути Одесского отделения Императорского Русского музыкального общества</p>
         <p><em>Крылова А.</em>&nbsp;Практическое музицирование в контексте образовательного процесса музыкальных классов Императорского Русского музыкального общества Ростова и Новочеркасска&nbsp;</p>
         <p><em>Дубровская М.</em>&nbsp;К изучению деятельности Императорского Русского музыкального общества в Крыму</p>
         <p><em>Фиденко Ю.&nbsp;</em>Музыкальная жизнь Владивостока и деятельность местного отделения Императорского русского музыкального общества (1909–1920 гг.)</p>
         <p><em>Смагина Е.&nbsp;</em>Царицынское отделение Императорского Русского музыкального общества: к вопросу о «культурной революции» в дореволюционном Царицыне</p>
         <p><em>>Шабалина Л.&nbsp;Екатеринбургское отделение Императорского Русского музыкального общества / Русского музыкального общества в годы революций и гражданской войны (1917–1919)<br><br></p>
         <p>РУССКОЕ МУЗЫКАЛЬНОЕ ОБЩЕСТВО: АЛЬТЕРНАТИВЫ В КУЛЬТУРЕ ХХ ВЕКА. НОВЕЙШАЯ ИСТОРИЯ РМО</p>
         <p><em>Адищев В.</em>&nbsp;«...Передаются в ведение Наркомпроса…»: к столетию «Декрета о Московской и Петроградской консерваториях»</p>
         <p><em>Ефимова Н.</em>&nbsp;Русское музыкальное общество / Императорское Русское музыкальное общество: инновации второй половины XIX века в проекции диалога власти и музыкального сообщества<br><br><br>&nbsp;&nbsp;</p>',
        '<p>RUSSIAN MUSICAL SOCIETY AS A SOCIOCULTURAL PHENOMENON&nbsp;</p>
         <p><em>Polotskaya E.</em>&nbsp;The Russian Musical Society: Prehistory, Organizational Structure, Spheres of Activity&nbsp;</p>
         <p><em>Efimova N.</em>&nbsp;The Imperial Russian Musical Society: Past and Present</p>
         <p><em>Moiseev G.</em>&nbsp;The Russian Musical Society under the August Patronage</p>
         <p><em>Sheludyakova O.</em>&nbsp;Musical Pages from the Archives of the Holy Royal Passion-Bearers</p>
         <p><em>Kolarova-Gidishka E.</em>&nbsp;The Role of the Imperial Russian Musical Society in the Formation of the Bulgarian Music School of the Late 19th – Early 20th Century: Towards the History of Intercultural Dialogue</p>
         <p><em>Krkotich K., Efimova N.</em>&nbsp;Serbian-Russian Cooperation in the Mirror of International Contacts of the Russian Musical Society</p>
         <p><em>Shchapova E.</em>&nbsp;The Reflection of the Activities of the Imperial Russian Musical Society in German-Language Music Criticism of the Early 20th Century</p>
         <p><em>Shabshaevich E.</em>&nbsp;The Moscow Branch of the Imperial Russian Musical Society and Foreign Concert Agencies (Towards the Formulation of the Problem)</p>
         <p><em>Garmash O.</em>&nbsp;The Imperial Russian Musical Society in the Establishment of the Auxiliary Fund for Musical Artists (Social Aspect)<br><br></p><p>THE RUSSIAN MUSICAL SOCIETY IN RUSSIAN MUSICAL CULTURE</p>
         <p><em>Dabaeva I.</em>&nbsp;The Role of the Imperial Russian Musical Society in the Development of Choral Culture in the 19th–20th Centuries</p>
         <p><em>Sharma E.</em>&nbsp;The Imperial Russian Musical Society in the Formation of National Vocal Education</p>
         <p><em>Polotskaya E.</em>&nbsp;Pyotr Ilyich Tchaikovsky and the Russian Musical Society: The Sociocultural Aspect of Interaction</p>
         <p><em>Komarov A.</em>&nbsp;Pyotr Ilyich Tchaikovsky and the Russian Musical Society. The Creative Aspect of Interaction</p>
         <p><em>Zheurova V., Sharma E.</em>&nbsp;The Lodi Dynasty of Singers in the History of the Imperial Russian Musical Society</p>
         <p><em>Valkova V.</em>&nbsp;Provincial Conflicts: On the Problem of "Center – Periphery" in the Activities of the IRMS<br><br></p><p>BRANCHES OF THE RUSSIAN MUSICAL SOCIETY IN THE RUSSIAN EMPIRE&nbsp;</p>
         <p><em>Glushkova O.</em>&nbsp;On the Educational and Pedagogical Work of the Moscow Conservatory of the Russian Musical Society</p>
         <p><em>Zinkevich E.</em>&nbsp;"One-Man Orchestra" – Alexander Nikolayevich Vinogradsky (1855–1912)&nbsp;</p>
         <p><em>Porfiryeva E.</em>&nbsp;The Kazan Branch of the Imperial Russian Musical Society and Its Role in the Development of the Musical Culture of the Volga-Kama Region</p>
         <p><em>Polozova I.</em>&nbsp;The History of the Formation and Development of the Saratov Branch of the Imperial Russian Musical Society</p>
         <p><em>Sidneva T., Kuklev A.</em>&nbsp;From the Regional Branch of the IRMS to the Conservatory: The Formation of Professional Music Education in Nizhny Novgorod</p>
         <p><em>Pylneva L.</em>&nbsp;The Imperial Russian Musical Society in the Cities of Siberia in the Late 19th – Early 20th Centuries: Problems and Achievements</p>
         <p><em>Kuzyonnaya O.</em>&nbsp;Reports of the Tobolsk Branch of the Imperial Russian Musical Society as a Historical Source</p>
         <p><em>Kaplun T.</em>&nbsp;Historical Paths of the Odessa Branch of the Imperial Russian Musical Society</p>
         <p><em>Krylova A.</em>&nbsp;Practical Music-Making in the Context of the Educational Process of the Music Classes of the Imperial Russian Musical Society in Rostov and Novocherkassk&nbsp;</p>
         <p><em>Dubrovskaya M.</em>&nbsp;On the Study of the Activities of the Imperial Russian Musical Society in Crimea</p>
         <p><em>Fidenko Yu.</em>&nbsp;Musical Life of Vladivostok and the Activities of the Local Branch of the Imperial Russian Musical Society (1909–1920)</p>
         <p><em>Smagina E.</em>&nbsp;The Tsaritsyn Branch of the Imperial Russian Musical Society: On the Question of the "Cultural Revolution" in Pre-Revolutionary Tsaritsyn</p>
         <p><em>Shabalina L.</em>&nbsp;The Yekaterinburg Branch of the Imperial Russian Musical Society / Russian Musical Society During the Years of Revolutions and Civil War (1917–1919)<br><br></p>
         <p>THE RUSSIAN MUSICAL SOCIETY: ALTERNATIVES IN THE CULTURE OF THE 20TH CENTURY. THE CONTEMPORARY HISTORY OF THE RMS</p>
         <p><em>Adishchev V.</em>&nbsp;"...Transferred to the Jurisdiction of the People''s Commissariat for Education...": On the Centenary of the "Decree on the Moscow and Petrograd Conservatories"</p>
         <p><em>Efimova N.</em>&nbsp;The Russian Musical Society / Imperial Russian Musical Society: Innovations of the Second Half of the 19th Century in the Projection of Dialogue between the Authorities and the Musical Community<br><br><br>&nbsp;&nbsp;</p>',
        'cover17.jpg',
        '2019_17.pdf'),

        (2019,
        18,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 18',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 18',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2019</p>
        <p><em>Количество страниц:</em>&nbsp;152 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2019</p>
        <p><em>Number of pages:</em>&nbsp;152 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">К ЮБИЛЕЮ УРАЛЬСКОЙ ГОСУДАРСТВЕННОЙ КОНСЕРВАТОРИИ ИМЕНИ М. П. МУСОРГСКОГО<br>
        <em>Шабалина Л. К.</em> 80 лет с именем М. П. Мусоргского<br><br>
        ТЕОРИЯ МУЗЫКИ<br>
        <em>Курленя К. М.</em> К уточнению смысла термина «интонация»: о логических основаниях теорий Б. Яворского, Б. Асафьева и К. Закса<br><br>
        СОВРЕМЕННАЯ МУЗЫКА<br>
        <em>Купровская Е. О.</em> Вариации для фортепиано Эдисона Денисова как пример серийной техники в раннем творчестве композитора<br>
        <em>Шабшаевич Е. М.</em> Лейтмотивная система в анимации: метод Шнитке<br>
        <em>Окунева Е. Г.</em> Вопросы развития серийной техники в теоретических взглядах и музыкальной практике Эрнста Кшенека<br>
        <em>Алексеева А. Ю.</em> Комбинаторные приёмы в музыке британского постминимализма<br>
        <em>Чупова А. Г.</em> «VANITAS VANITATUM»: композиторские стратегии смыслообразования в «Vanitas» С. Шаррино<br><br>
        МУЗЫКАЛЬНАЯ КУЛЬТУРА УРАЛА<br>
        <em>Базилевич М. В.</em> «Музыка для исполнения» и «Музыка для слушания» в инструментальных сочинениях В. Г. Трапезникова для детей<br><br>
        ДУХОВНАЯ МУЗЫКА<br>
        <em>Шелудякова О. Е.</em> Русские православные роспевщики XX столетия<br><br>
        МУЗЫКАЛЬНОЕ ИСПОЛНИТЕЛЬСТВО И ОБРАЗОВАНИЕ<br>
        <em>Бородин Б. Б.</em> Cвобода творчества музыканта-исполнителя: в перекрёстке мнений<br>
        <em>Адищев В. И.</em> «Школа должна дать учащимся умение сознательно слушать и понимать музыку…» (к истории создания программы по музыке для единой трудовой школы)<br><br>
        МЕЖДИСЦИПЛИНАРНЫЕ ИССЛЕДОВАНИЯ<br>
        <em>Рубин Л. С.</em> Звук и музыки (о закономерностях восприятия музыкальной информации)</p>',
        '<p>TO THE ANNIVERSARY OF THE URAL STATE CONSERVATORY NAMED AFTER M. P. MUSSORGSKY<br>
        <em>Shabalina L. K.</em> 80 Years with the Name of M. P. Mussorgsky<br><br>
        MUSIC THEORY<br>
        <em>Kurlenya K. M.</em> Towards Clarifying the Meaning of the Term "Intonation": On the Logical Foundations of the Theories of B. Yavorsky, B. Asafiev and K. Sachs<br><br>
        CONTEMPORARY MUSIC<br>
        <em>Kuprovskaya E. O.</em> Edison Denisov''s Piano Variations as an Example of Serial Technique in the Composer''s Early Work<br>
        <em>Shabshaevich E. M.</em> Leitmotif System in Animation: Schnittke''s Method<br>
        <em>Okuneva E. G.</em> Issues of the Development of Serial Technique in the Theoretical Views and Musical Practice of Ernst Krenek<br>
        <em>Alekseeva A. Yu.</em> Combinatorial Techniques in British Postminimalist Music<br>
        <em>Chupova A. G.</em> "VANITAS VANITATUM": Composer''s Strategies of Meaning Formation in S. Sciarrino''s "Vanitas"<br><br>
        MUSICAL CULTURE OF THE URALS<br>
        <em>Basilevich M. V.</em> "Music for Performance" and "Music for Listening" in V. G. Trapeznikov''s Instrumental Works for Children<br><br>
        SACRED MUSIC<br>
        <em>Sheludyakova O. E.</em> Russian Orthodox Chant Composers of the 20th Century<br><br>
        MUSICAL PERFORMANCE AND EDUCATION<br>
        <em>Borodin B. B.</em> Freedom of Creative Work of a Performing Musician: At the Crossroads of Opinions<br>
        <em>Adishchev V. I.</em> "The School Should Give Students the Ability to Consciously Listen to and Understand Music..." (On the History of the Creation of the Music Curriculum for the Unified Labour School)<br><br>
        INTERDISCIPLINARY RESEARCH<br>
        <em>Rubin L. S.</em> Sound and Music (On the Patterns of Perception of Musical Information)</p>',
        'cover18.jpg',
        '2019_18.pdf'),

        (2019,
        19,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 19',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 19',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2019</p>
        <p><em>Количество страниц:</em>&nbsp;60 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2019</p>
        <p><em>Number of pages:</em>&nbsp;60 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ МУЗЫКАЛЬНОЙ ЭСТЕТИКИ<br>
        <em>Бородин Б. Б.</em> Многоликий романтизм<br>
        <em>Консон Г. Р.</em> О сущности трагических ораторий Г. Ф. Генделя<br><br>
        ИЗ АРХИВОВ УРАЛЬСКОЙ КОНСЕРВАТОРИИ<br>
        <em>Григорьев В. Ю.</em> [О природе исполнительских движений]<br><br>
        СОВЕТЫ МАСТЕРОВ<br>
        <em>Рацер Д. Е.</em> Игра на рояле: как всегда быть в наилучшей форме<br><br>
        К ИЗУЧЕНИЮ ИСПОЛНИТЕЛЬСКОГО РЕПЕРТУАРА ПИАНИСТА<br>
        <em>Гаврилова М. В.</em> Исполнительские задачи пианиста в контексте интерпретации цикла М. П. Мусоргского «Картинки с выставки»<br><br>
        СТРАНИЦЫ ИСТОРИИ УРАЛЬСКОЙ КОНСЕРВАТОРИИ<br>
        <em>Надельсон А. С.</em> О студенческом ансамбле старинной музыки УГК<br>
        <em>Надельсон А. С.</em> Вспоминая друга</p>',
        '<p>ISSUES OF MUSICAL AESTHETICS<br>
        <em>Borodin B. B.</em> Multifaceted Romanticism<br>
        <em>Konson G. R.</em> On the Essence of G. F. Handel''s Tragic Oratorios<br><br>
        FROM THE ARCHIVES OF THE URAL CONSERVATORY<br>
        <em>Grigoriev V. Yu.</em> [On the Nature of Performing Movements]<br><br>
        ADVICE FROM MASTERS<br>
        <em>Ratser D. E.</em> Piano Playing: How to Always Be in Top Form<br><br>
        TO THE STUDY OF PIANIST PERFORMANCE REPERTOIRE<br>
        <em>Gavrilova M. V.</em> Pianist''s Performance Tasks in the Context of Interpretation of M. P. Mussorgsky''s Cycle "Pictures at an Exhibition"<br><br>
        PAGES OF THE HISTORY OF THE URAL CONSERVATORY<br>
        <em>Nadelson A. S.</em> On the Student Ensemble of Early Music at USMC<br>
        <em>Nadelson A. S.</em> Remembering a Friend</p>',
        'cover19.jpg',
        '2019_19.pdf'),

        (2020,
        20,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 20',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 20',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2020</p>
        <p><em>Количество страниц:</em>&nbsp;100 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2020</p>
        <p><em>Number of pages:</em>&nbsp;100 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ МУЗЫКАЛЬНОЙ ЭСТЕТИКИ<br>
        <em>Субботина Н. М.</em> В.-Г. Вакенродер о сущности музыки<br><br>
        ТЕОРЕТИЧЕСКИЕ АСПЕКТЫ ИЗУЧЕНИЯ ИСПОЛНИТЕЛЬСКОГО ИСКУССТВА<br>
        <em>Бородин Б. Б.</em> Фортепианная фактура романтизма как формообразующий фактор<br>
        <em>Заитов Г. С.</em> Применение компьютерных программ в анализе и формировании вокальной резонансной стратегии<br><br>
        ПЕДАГОГИКА МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ<br>
        <em>Лукьянова Е. П., Ивакина В. А.</em> Роль исполнительской практики в системе профессиональной подготовки студентов консерватории<br>
        <em>Овчинников В. П.</em> Исполнительские мастер-классы в практике современного музыкального образования (заметки педагога)<br><br>
        К ИЗУЧЕНИЮ ИСПОЛНИТЕЛЬСКОГО РЕПЕРТУАРА ПИАНИСТА<br>
        <em>Панкова Н. Г.</em> Тридцать два шага за грозовой перевал: заметки о цикле Бетховена «Тридцать две вариации для фортепиано на собственную тему» (WoO 8о, c-moll)<br>
        <em>Приложение: Меркулов А. М.</em> Бетховен в исполнении Н. Г. Панковой<br><br>
        СТРАНИЦЫ ИСТОРИИ УРАЛЬСКОЙ КОНСЕРВАТОРИИ<br>
        <em>Басок М. А.</em> Г. Н. Рождественский: несколько мимолётных встреч...<br>
        <em>Басок М. А.</em> О друзьях...<br>
        <em>Бородин А. Б.</em> О времени и о себе: интервью с Вольфом Усминским</p>',
        '<p>ISSUES OF MUSICAL AESTHETICS<br>
        <em>Subbotina N. M.</em> W.-H. Wackenroder on the Essence of Music<br><br>
        THEORETICAL ASPECTS OF THE STUDY OF PERFORMING ARTS<br>
        <em>Borodin B. B.</em> Romantic Piano Texture as a Form-Shaping Factor<br>
        <em>Zaitov G. S.</em> Application of Computer Programs in the Analysis and Formation of Vocal Resonance Strategy<br><br>
        PEDAGOGY OF MUSIC EDUCATION<br>
        <em>Lukyanova E. P., Ivakina V. A.</em> The Role of Performance Practice in the System of Professional Training of Conservatory Students<br>
        <em>Ovchinnikov V. P.</em> Performance Master Classes in the Practice of Contemporary Music Education (Notes of a Teacher)<br><br>
        TO THE STUDY OF PIANIST PERFORMANCE REPERTOIRE<br>
        <em>Pankova N. G.</em> Thirty-Two Steps Beyond the Stormy Pass: Notes on Beethoven''s Cycle "Thirty-Two Variations for Piano on an Original Theme" (WoO 80, C minor)<br>
        <em>Appendix: Merkulov A. M.</em> Beethoven Performed by N. G. Pankova<br><br>
        PAGES OF THE HISTORY OF THE URAL CONSERVATORY<br>
        <em>Basok M. A.</em> G. N. Rozhdestvensky: A Few Fleeting Encounters...<br>
        <em>Basok M. A.</em> About Friends...<br>
        <em>Borodin A. B.</em> On Time and About Myself: An Interview with Wolf Usminsky</p>',
        'cover20.jpg',
        '2020_20.pdf'),

        (2020,
        21,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 21',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 21',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2020</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2020</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ПРОКОФЬЕВ И РУССКАЯ КУЛЬТУРА НАЧАЛА ХХ ВЕКА<br>
        <em>Серебрякова Л. А., Кордюкова Л. В.</em> С. Прокофьев и русский авангард 1910-х годов. Халдейское заклинание «Семеро их»<br>
        <em>Милованова О. Э.</em> Н. Мясковский и С. Прокофьев в зеркале музыкальной критики начала ХХ века (по материалам российской прессы)<br>
        <em>Серебрякова Л. А., Москалёва Л. В.</em> Балет «Сказка про шута» в стилевом контексте раннего творчества С. Прокофьева и Русского Балета С. Дягилева<br>
        <em>Суриц Е. Я.</em> Зарубежная критика о первом балете Прокофьева «Шут» в труппе Русский Балет Сергея Дягилева<br><br>
        ЖИЗНЬ ЗА РУБЕЖОМ<br>
        <em>Рахманова М. П.</em> Грогий – секретарь Прокофьева<br><br>
        ПОСЛЕ ВОЗВРАЩЕНИЯ<br>
        <em>Соломонова О. Б.</em> Самая «советская» советская музыка (преодоление соцреалистического канона в кантатах С. Прокофьева «Славься, наш могучий край» и «Здравица»)</p>',
        '<p>PROKOFIEV AND RUSSIAN CULTURE OF THE EARLY 20TH CENTURY<br>
        <em>Serebryakova L. A., Kordyukova L. V.</em> S. Prokofiev and the Russian Avant-Garde of the 1910s. The Chaldean Incantation "The Seven of Them"<br>
        <em>Milovanova O. E.</em> N. Myaskovsky and S. Prokofiev in the Mirror of Musical Criticism of the Early 20th Century (Based on Materials from the Russian Press)<br>
        <em>Serebryakova L. A., Moskaleva L. V.</em> Ballet "The Tale of the Buffoon" in the Stylistic Context of S. Prokofiev''s Early Works and S. Diaghilev''s Russian Ballet<br>
        <em>Surits E. Ya.</em> Foreign Criticism on Prokofiev''s First Ballet "The Buffoon" in Serge Diaghilev''s Russian Ballet Company<br><br>
        LIFE ABROAD<br>
        <em>Rakhmanova M. P.</em> Grogiy – Prokofiev''s Secretary<br><br>
        AFTER THE RETURN<br>
        <em>Solomonova O. B.</em> The Most "Soviet" Soviet Music (Overcoming the Socialist Realist Canon in S. Prokofiev''s Cantatas "Glory to Our Mighty Land" and "Zdravitsa")</p>',
        'cover21.jpg',
        '2020_21.pdf'),

        (2020,
        22,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 22',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 22',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2020</p>
        <p><em>Количество страниц:</em>&nbsp;100 с.</p>
        <p><em>Тираж:</em>&nbsp;66 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2020</p>
        <p><em>Number of pages:</em>&nbsp;100 pp.</p>
        <p><em>Circulation:</em>&nbsp;66 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ОСОБЕННОСТИ ТВОРЧЕСКОГО ПРОЦЕССА<br>
        <em>Петухова С. А.</em> Семантика повторений и возвращений в творчестве С. Прокофьева<br><br>
        МУЗЫКА ДЛЯ ТЕАТРА И КИНО<br>
        <em>Поршнев И. Д.</em> Музыка С. Прокофьева к драме А. Пушкина «Борис Годунов» в постановке В. Мейерхольда<br><br>
        ПРОКОФЬЕВ И УРАЛ<br>
        <em>Фефелова А. Г.</em> Сергей Прокофьев в Перми (к истории создания «Золушки»)<br>
        <em>Синецкая Т. М.</em> Музыка С. Прокофьева в театральной и концертной жизни Челябинска 1935–2016 годов<br><br>
        ИЗ ОПЫТА ПРЕПОДАВАНИЯ<br>
        <em>Ситникова Ж. Ю.</em> Применение компьютерных средств к анализу музыки С. Прокофьева</p>',
        '<p>PECULIARITIES OF THE CREATIVE PROCESS<br>
        <em>Petukhova S. A.</em> Semantics of Repetitions and Returns in the Works of S. Prokofiev<br><br>
        MUSIC FOR THEATRE AND CINEMA<br>
        <em>Porshnev I. D.</em> S. Prokofiev''s Music for A. Pushkin''s Drama "Boris Godunov" in V. Meyerhold''s Production<br><br>
        PROKOFIEV AND THE URALS<br>
        <em>Fefelova A. G.</em> Sergei Prokofiev in Perm (On the History of the Creation of "Cinderella")<br>
        <em>Sinetskaya T. M.</em> S. Prokofiev''s Music in Theatrical and Concert Life of Chelyabinsk from 1935 to 2016<br><br>
        FROM TEACHING EXPERIENCE<br>
        <em>Sitnikova Zh. Yu.</em> Application of Computer Tools to the Analysis of S. Prokofiev''s Music</p>',
        'cover22.jpg',
        '2020_22.pdf'),

        (2020,
        23,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 23',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 23',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2020</p>
        <p><em>Количество страниц:</em>&nbsp;120 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2020</p>
        <p><em>Number of pages:</em>&nbsp;120 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Зенкин К. В.</em> У истоков русского музыковедения: А. Н. Серов (к 200-летию со дня рождения)<br>
        <em>Захарьина Н. Б., Герасимова И. В.</em> Источники по изучению церковно-певческой культуры Пскова XIV–XVII веков<br>
        <em>Мельникова Е. В.</em> Проблема «слово и музыка» в современном музыкальном искусстве и музыковедении (к 25-летию со дня смерти А. В. Михайлова)<br>
        <em>Гагарина О. А., Иванов Ю. Н.</em> Тромбон в творчестве Н. А. Римского-Корсакова: к вопросу о расширении технических и выразительных возможностей тромбона в XIX веке<br><br>
        К ЮБИЛЕЯМ БЕТХОВЕНА И ЧАЙКОВСКОГО<br>
        <em>Моховикова М. В.</em> Симфонические сочинения Людвига ван Бетховена в собраниях Московского отделения Императорского Русского музыкального общества<br>
        <em>Поспелова Р. Л., Говердовская М. А.</em> Тонально-интонационная фабула в Большой сонате для фортепиано ор. 37 G-dur П. И. Чайковского<br><br>
        ЗНАМЕНАТЕЛЬНЫЕ ДАТЫ ГОДА<br>
        <em>Купровская Е. О.</em> Опера Эдисона Денисова «Пена дней»: создание, постановка, критика (к 35-летию со дня премьеры)<br>
        <em>Гаврилова М. В., Лопатникова А. Н.</em> Роль авторских ремарок в формировании исполнительской интерпретации Сонаты op. 1 Альбана Берга (к 135-летию со дня рождения и 85-летию со дня смерти композитора)<br>
        <em>Егорова М. А.</em> Идея Кармен: от Пушкина к Бизе<br><br>
        МУЗЫКАЛЬНАЯ ЖИЗНЬ РОССИЙСКИХ РЕГИОНОВ<br>
        <em>Екименко Т. С.</em> Союз композиторов Республики Карелия и его председатель Гельмер Синисало (к 100-летию со дня рождения)<br>
        <em>Куприна Е. Ю.</em> Музыкальное образование Тольятти: ретроспектива и перспектива (65-летию художественного образования Ставрополя-на-Волге–Тольятти посвящается)<br><br>
        AD MEMORIAM<br>
        <em>Хайбуллина Д. Н., Недоспасова А. П.</em> Мери Лебензон – личность, музыкант, педагог<br>
        <em>Басок М. А.</em> Н. М. Пузей как представитель старшего поколения уральских композиторов</p>',
        '<p>MUSICOLOGY AND PERFORMANCE<br>
        <em>Zenkin K. V.</em> At the Origins of Russian Musicology: A. N. Serov (On the 200th Anniversary of His Birth)<br>
        <em>Zakharyina N. B., Gerasimova I. V.</em> Sources for the Study of Church Singing Culture of Pskov in the 14th–17th Centuries<br>
        <em>Melnikova E. V.</em> The Problem of "Word and Music" in Contemporary Musical Art and Musicology (On the 25th Anniversary of the Death of A. V. Mikhailov)<br>
        <em>Gagarina O. A., Ivanov Yu. N.</em> The Trombone in the Works of N. A. Rimsky-Korsakov: On the Question of Expanding the Technical and Expressive Capabilities of the Trombone in the 19th Century<br><br>
        TO THE ANNIVERSARIES OF BEETHOVEN AND TCHAIKOVSKY<br>
        <em>Mokhovikova M. V.</em> Symphonic Works of Ludwig van Beethoven in the Collections of the Moscow Branch of the Imperial Russian Musical Society<br>
        <em>Pospelova R. L., Goverdovskaya M. A.</em> Tonal-Intonational Fabula in the Grand Piano Sonata Op. 37 in G Major by P. I. Tchaikovsky<br><br>
        NOTABLE DATES OF THE YEAR<br>
        <em>Kuprovskaya E. O.</em> Edison Denisov''s Opera "The Foam of Days": Creation, Production, Criticism (On the 35th Anniversary of the Premiere)<br>
        <em>Gavrilova M. V., Lopatnikova A. N.</em> The Role of Author''s Remarks in Shaping Performance Interpretation of Sonata op. 1 by Alban Berg (On the 135th Anniversary of the Composer''s Birth and 85th Anniversary of His Death)<br>
        <em>Egorova M. A.</em> The Idea of Carmen: From Pushkin to Bizet<br><br>
        MUSICAL LIFE OF RUSSIAN REGIONS<br>
        <em>Ekimenko T. S.</em> The Composers'' Union of the Republic of Karelia and Its Chairman Helmer Sinisalo (On the 100th Anniversary of His Birth)<br>
        <em>Kuprina E. Yu.</em> Music Education in Tolyatti: Retrospective and Prospect (Dedicated to the 65th Anniversary of Art Education in Stavropol-on-Volga–Tolyatti)<br><br>
        AD MEMORIAM<br>
        <em>Khaybullina D. N., Nedospasova A. P.</em> Meri Lebenzon – Personality, Musician, Teacher<br>
        <em>Basok M. A.</em> N. M. Puzei as a Representative of the Older Generation of Ural Composers</p>',
        'cover23.jpg',
        '2020_23.pdf'),

        (2021,
        24,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 24',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 24',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2021</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2021</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Городилова М. В.</em> Хроматический лабиринт в гармонии Л. ван Бетховена<br>
        <em>Карташова Т. В.</em> Региональная традиция вокального жанра тхумри: исполнительская школа Варанаси<br>
        <em>Гагарина О. А.</em> Музыка в звуковом пространстве современного Екатеринбурга: к проблеме анализа городской аудиосреды<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ<br>
        <em>Шабалина Л. К.</em> Гармония и синтаксис в отечественных научно-методических трудах ХХ века (к внедрению в учебную практику)<br>
        <em>Полякова Л. П.</em> Фонетика иностранных языков для вокалистов: проблемы и способы решения<br><br>
        ДЕЯТЕЛИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ РОССИЙСКИХ РЕГИОНОВ<br>
        <em>Вишневская Л. А.</em> Научно-педагогическое наследие Саратовской консерватории: Е. Д. Ершова (1942–2001)<br><br>
        ОБЗОРЫ КОНФЕРЕНЦИЙ, РЕЦЕНЗИИ<br>
        <em>Полоцкая Е. Е.</em> Музыковедение регионов и региональное музыковедение: обзор Всероссийской конференции с международным участием «Музыкальная наука, искусство и образование российских регионов: навстречу 300-летию города Екатеринбурга»<br>
        <em>Марков А. В.</em> Рецензия на книгу Д. И. Макарова «Сад расходящихся судеб»</p>',
        '<p>ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Gorodilova M. V.</em> Chromatic Labyrinth in the Harmony of L. van Beethoven<br>
        <em>Kartashova T. V.</em> Regional Tradition of the Vocal Genre Thumri: Varanasi Performance School<br>
        <em>Gagarina O. A.</em> Music in the Sound Space of Modern Yekaterinburg: On the Problem of Analysis of the Urban Audio Environment<br><br>
        ISSUES OF MUSIC EDUCATION<br>
        <em>Shabalina L. K.</em> Harmony and Syntax in Russian Scholarly and Methodological Works of the 20th Century (On Implementation into Educational Practice)<br>
        <em>Polyakova L. P.</em> Phonetics of Foreign Languages for Singers: Problems and Solutions<br><br>
        FIGURES OF MUSICAL CULTURE OF RUSSIAN REGIONS<br>
        <em>Vishnevskaya L. A.</em> Scientific and Pedagogical Heritage of the Saratov Conservatory: E. D. Ershova (1942–2001)<br><br>
        CONFERENCE SURVEYS, REVIEWS<br>
        <em>Polotskaya E. E.</em> Musicology of Regions and Regional Musicology: A Review of the All-Russian Conference with International Participation "Musical Science, Art and Education of Russian Regions: Towards the 300th Anniversary of the City of Yekaterinburg"<br>
        <em>Markov A. V.</em> Review of D. I. Makarov''s Book "The Garden of Diverging Destinies"</p>',
        'cover24.jpg',
        '2021_24.pdf'),

        (2021,
        25,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 25',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 25',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2021</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2021</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">МУЗЫКА В СИСТЕМЕ КУЛЬТУРЫ<br>
        <em>Марков А. В.</em> Звучащие статуи: скрытый диалог Аверинцева и Бибихина о природе музыки<br>
        <em>Бородин Б. Б.</em> Провинция, провинциальность и провинциализм в музыкальном искусстве<br><br>
        ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Михайлова В. С., Максимова А. Е.</em> Реквием О. А. Козловского<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ<br>
        <em>Алексеева И. В.</em> Инноватика в профессиональном музыкальном образовании вуза: теория и практика<br><br>
        МУЗЫКАЛЬНАЯ ЖИЗНЬ РОССИЙСКИХ РЕГИОНОВ: ВЧЕРА И СЕГОДНЯ<br>
        <em>Бородин А. Б.</em> Генрих Нейгауз в Свердловске. Хроника военных лет<br>
        <em>Гун Г. Е.</em> Музыкальная культура индустриального города (на примере Магнитогорска)<br>
        <em>Гуляева Е. С.</em> Театральные произведения Георгия Иванова в контексте социокультурных процессов 1960–1980-х годов<br><br>
        AD MEMORIAM<br>
        <em>Парин А. В.</em> Улица академика Парина, генетика и историческая справедливость</p>',
        '<p>MUSIC IN THE SYSTEM OF CULTURE<br>
        <em>Markov A. V.</em> Sounding Statues: The Hidden Dialogue of Averintsev and Bibikhin on the Nature of Music<br>
        <em>Borodin B. B.</em> Province, Provinciality and Provincialism in Musical Art<br><br>
        ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Mikhailova V. S., Maksimova A. E.</em> Requiem by O. A. Kozlovsky<br><br>
        ISSUES OF MUSIC EDUCATION<br>
        <em>Alekseeva I. V.</em> Innovations in Professional Music Education at University: Theory and Practice<br><br>
        MUSICAL LIFE OF RUSSIAN REGIONS: YESTERDAY AND TODAY<br>
        <em>Borodin A. B.</em> Heinrich Neuhaus in Sverdlovsk. Chronicle of the War Years<br>
        <em>Gun G. E.</em> Musical Culture of an Industrial City (on the Example of Magnitogorsk)<br>
        <em>Gulyaeva E. S.</em> Theatrical Works of Georgy Ivanov in the Context of Socio-Cultural Processes of the 1960s–1980s<br><br>
        AD MEMORIAM<br>
        <em>Parin A. V.</em> Academician Parin Street, Genetics and Historical Justice</p>',
        'cover25.jpg',
        '2021_25.pdf'),

        (2021,
        26,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 26',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 26',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2021</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2021</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Вялухина В. И.</em> Изабелла Леонарда и её латинские диалоги<br>
        <em>Мешкова А. С.</em> Позднеромантический Шёнберг: закат эпохи или рождение новой?<br>
        <em>Гагарина О. А.</em> «Академическая музыка неакадемического времени»: о композиторском творчестве Дмитрия Пейселя<br><br>
        МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Шабшаевич Е. М.</em> «Преданный Вам Ю. Померанцев…»: Письма Ю. Н. Померанцева к С. И. Танееву (избранное). Часть первая<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ И ПРАКТИКА<br>
        <em>Алёшина А. О.</em> Особенности американской и российской педагогических арфовых школ 20-х годов XX века<br>
        <em>Сердечная Е. В.</em> Ритмика и сольфеджио в специальной музыкальной школе: перспективы взаимодействия<br><br>
        РЕЦЕНЗИИ, ОБЗОРЫ, АНОНСЫ КОНФЕРЕНЦИЙ<br>
        <em>Полоцкая Е. Е.</em> Книга, которую надо читать: Отзыв о книге И. В. Степановой «Музыка как константа русской литературы. Александр Куприн»<br>
        Анонсы</p>',
        '<p>ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Vyalukhina V. I.</em> Isabella Leonarda and Her Latin Dialogues<br>
        <em>Meshkova A. S.</em> Late-Romantic Schoenberg: The Decline of an Era or the Birth of a New One?<br>
        <em>Gagarina O. A.</em> "Academic Music of Non-Academic Time": On the Composer''s Work of Dmitri Peysel<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Shabshaevich E. M.</em> "Yours Devotedly, Yu. Pomerantsev...": Letters of Yu. N. Pomerantsev to S. I. Taneyev (Selected). Part One<br><br>
        MUSIC EDUCATION: HISTORY, THEORY AND PRACTICE<br>
        <em>Alyoshina A. O.</em> Characteristics of American and Russian Pedagogical Harp Schools of the 1920s<br>
        <em>Serdechnaya E. V.</em> Rhythmics and Solfège in a Special Music School: Prospects for Interaction<br><br>
        REVIEWS, SURVEYS, CONFERENCE ANNOUNCEMENTS<br>
        <em>Polotskaya E. E.</em> A Book That Must Be Read: Review of I. V. Stepanova''s Book "Music as a Constant of Russian Literature. Alexander Kuprin"<br>
        Announcements</p>',
        'cover26.jpg',
        '2021_26.pdf'),

        (2021,
        27,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 27',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 27',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2021</p>
        <p><em>Количество страниц:</em>&nbsp;62 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2021</p>
        <p><em>Number of pages:</em>&nbsp;62 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Гагарина О. А.</em> Столкновение Аркадии и Элизиума как основа драматургического конфликта в балете «Сильфида»<br>
        <em>Зырянов М. Л.</em> «Александр Невский» С. Прокофьева и С. Эйзенштейна: начало истории саундтрека<br><br>
        МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Бородин Б. Б.</em> Ферруччо Бузони: мысли о мастерстве композитора<br>
        <em>Шабшаевич Е. М.</em> «Преданный вам Ю. Померанцев…»: Письма Ю. Н. Померанцева к С. И. Танееву (избранное). Часть вторая<br><br>
        КОМПОЗИТОР, ИСПОЛНИТЕЛЬ, ПЕДАГОГ<br>
        <em>Басок М. А.</em> Через век: от автора, «из первых рук»… (Вокальные циклы «Пять стихотворений А. Ахматовой» С. Прокофьева и М. Баска)<br><br>
        РЕЦЕНЗИИ, ОБЗОРЫ, АНОНСЫ КОНФЕРЕНЦИЙ<br>
        Анонсы</p>',
        '<p>ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Gagarina O. A.</em> The Clash of Arcadia and Elysium as the Basis of the Dramatic Conflict in the Ballet "La Sylphide"<br>
        <em>Zyryanov M. L.</em> "Alexander Nevsky" by S. Prokofiev and S. Eisenstein: The Beginning of the History of the Soundtrack<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Borodin B. B.</em> Ferruccio Busoni: Thoughts on the Mastery of the Composer<br>
        <em>Shabshaevich E. M.</em> "Yours Devotedly, Yu. Pomerantsev...": Letters of Yu. N. Pomerantsev to S. I. Taneyev (Selected). Part Two<br><br>
        COMPOSER, PERFORMER, TEACHER<br>
        <em>Basok M. A.</em> Through a Century: From the Author, "First-Hand"... (Vocal Cycles "Five Poems of A. Akhmatova" by S. Prokofiev and M. Bask)<br><br>
        REVIEWS, SURVEYS, CONFERENCE ANNOUNCEMENTS<br>
        Announcements</p>',
        'cover27.jpg',
        '2021_27.pdf'),

        (2022,
        28,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 28',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 28',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2022</p>
        <p><em>Количество страниц:</em>&nbsp;87 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2022</p>
        <p><em>Number of pages:</em>&nbsp;87 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ФИЛОСОФИЯ МУЗЫКИ<br>
        <em>Марков А. В.</em> «Алеко» С. Рахманинова с дополнениями Л. Нелидовой-Фивейской в рамке философского диалога<br><br>
        МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Бородин Б. Б.</em> Ферруччо Бузони: мысли о мастерстве пианиста<br>
        <em>Шабшаевич Е. М.</em> «Преданный вам Ю. Померанцев…» : Письма Ю. Н. Померанцева к С. И. Танееву (избранное). Часть III<br><br>
        ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Коробова А. Г.</em> О роли пасторального жанра в становлении европейской оперы<br>
        <em>Мельникова Е. В.</em> Новаторские формы взаимодействия музыки и слова в старинном жанре пассионов: «Страсти по Луке» Кшиштофа Пендерецкого для солистов, чтеца, трёх смешанных хоров, хора мальчиков и оркестра (1965)<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ<br>
        <em>Кадочникова С. Ю.</em> Жест как движение души<br><br>
        К ИТОГАМ ПРОКОФЬЕВСКОГО ФЕСТИВАЛЯ В УРАЛЬСКОЙ КОНСЕРВАТОРИИ<br>
        <em>От редакции</em><br>
        <em>Зисман В.</em> Историческое событие 2021 года (Четвёртая в отечественной истории постановка оперы Прокофьева «Игрок» состоялась в Екатеринбурге)<br>
        <em>Ермаков А. А.</em> Отражение мира детства в произведениях С. С. Прокофьева (на примере фортепианного цикла «Детская музыка», ор. 65)</p>',
        '<p>PHILOSOPHY OF MUSIC<br>
        <em>Markov A. V.</em> "Aleko" by S. Rachmaninoff with Additions by L. Nelidova-Phiveyskaya in the Framework of a Philosophical Dialogue<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Borodin B. B.</em> Ferruccio Busoni: Thoughts on the Mastery of the Pianist<br>
        <em>Shabshaevich E. M.</em> "Yours Devotedly, Yu. Pomerantsev...": Letters of Yu. N. Pomerantsev to S. I. Taneyev (Selected). Part III<br><br>
        ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Korobova A. G.</em> On the Role of the Pastoral Genre in the Formation of European Opera<br>
        <em>Melnikova E. V.</em> Innovative Forms of Interaction between Music and Text in the Old Genre of Passions: "St. Luke Passion" by Krzysztof Penderecki for Soloists, Narrator, Three Mixed Choirs, Boys'' Choir and Orchestra (1965)<br><br>
        ISSUES OF MUSIC EDUCATION<br>
        <em>Kadochnikova S. Yu.</em> Gesture as a Movement of the Soul<br><br>
        TO THE RESULTS OF THE PROKOFIEV FESTIVAL AT THE URAL CONSERVATORY<br>
        <em>From the Editorial Board</em><br>
        <em>Zisman V.</em> A Historical Event of 2021 (The Fourth Production in Russian History of Prokofiev''s Opera "The Gambler" Took Place in Yekaterinburg)<br>
        <em>Ermakov A. A.</em> Reflection of the World of Childhood in the Works of S. S. Prokofiev (on the Example of the Piano Cycle "Children''s Music", Op. 65)</p>',
        'cover28.jpg',
        '2022_28.pdf'),

        (2022,
        29,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 29',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 29',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2022</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2022</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Светлова О. А.</em> Иркутская музыкально-театральная критика об итальянской опере в Сибири на рубеже XIX–XX веков (по материалам газеты «Восточное обозрение»)<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Литвинова Т. А.</em> Формат тембрового диктанта: каков он?<br><br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ НАУКИ<br>
        <em>Евдокимова Н. К.</em> Государственный институт музыкальной науки (1921–1931): история, направления, перспективы<br><br>
        ИЗ МАТЕРИАЛОВ ЮБИЛЕЙНОЙ КОНФЕРЕНЦИИ К 130-ЛЕТИЮ С. С. ПРОКОФЬЕВА<br>
        <em>Бородин Б. Б.</em> С. С. Прокофьев и С. В. Рахманинов как современники<br>
        <em>Петухова С. А.</em> Прокофьев и Скрябин: опыт приближения<br>
        <em>Масловская Т. Ю.</em> Отрицание отрицания: Л. Сабанеев о С. Прокофьеве<br>
        <em>Городилова М. В.</em> Нотация в расширенной тональности C. Прокофьева<br>
        <em>Шелудякова О. Е.</em> Православные песнопения и обряды в музыке С. Прокофьева к кинофильму «Иван Грозный»</p>',
        '<p>MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Svetlova O. A.</em> Irkutsk Musical and Theatre Criticism on Italian Opera in Siberia at the Turn of the 19th–20th Centuries (Based on Materials from the Newspaper "Vostochnoye Obozreniye")<br><br>
        ISSUES OF MUSIC EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Litvinova T. A.</em> The Format of Timbre Dictation: What Is It?<br><br>
        FROM THE HISTORY OF MUSICOLOGY<br>
        <em>Evdokimova N. K.</em> The State Institute of Music Science (1921–1931): History, Directions, Prospects<br><br>
        FROM THE MATERIALS OF THE ANNIVERSARY CONFERENCE DEDICATED TO THE 130TH ANNIVERSARY OF S. S. PROKOFIEV<br>
        <em>Borodin B. B.</em> S. S. Prokofiev and S. V. Rachmaninoff as Contemporaries<br>
        <em>Petukhova S. A.</em> Prokofiev and Scriabin: An Experience of Approximation<br>
        <em>Maslovskaya T. Yu.</em> The Negation of Negation: L. Sabaneyev on S. Prokofiev<br>
        <em>Gorodilova M. V.</em> Notation in Prokofiev''s Extended Tonality<br>
        <em>Sheludyakova O. E.</em> Orthodox Chants and Rites in Prokofiev''s Music for the Film "Ivan the Terrible"</p>',
        'cover29.jpg',
        '2022_29.pdf'),

        (2022,
        30,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 30',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 30',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2022</p>
        <p><em>Количество страниц:</em>&nbsp;108 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2022</p>
        <p><em>Number of pages:</em>&nbsp;108 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Коробова А. Г.</em> Проблематика жанрового статуса пасторали в теоретических представлениях XVI–XVIII веков и её отражение в музыкальном театре<br>
        <em>Смирнова Т. В.</em> Династии итальянских музыкантов при дворе Тюдоров<br>
        <em>Любимов Д. В.</em> «Карнавал» Роберта Шумана в оркестровке русских композиторов<br>
        <em>Мельникова А. В.</em> Опера «Долгий рождественский ужин» Пауля Хиндемита: символизация как способ смыслового конструирования<br><br>
        ПО МАТЕРИАЛАМ ЮБИЛЕЙНОЙ КОНФЕРЕНЦИИ К 130-ЛЕТИЮ С. С. ПРОКОФЬЕВА<br>
        <em>Бородин А. Б.</em> К вопросу о скрябинском влиянии на раннее фортепианное творчество C. C. Прокофьева<br>
        <em>Хуснутдинова Э. А.</em> С. С. Прокофьев и С. А. Кусевицкий: штрихи к двойному портрету<br>
        <em>Поршнев И. Д.</em> «Ждали знакомого, а от незнакомого отмахнулись»: история концертных исполнений музыки балета «Стальной скок» С. С. Прокофьева в СССР (1928, 1929, 1932)<br>
        <em>Милованова О. Э.</em> Композитор на войне – Н. Я. Мясковский<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Тереханова К. Ю.</em> Российская музыкальная школа 100 лет назад: из истории становления системы отечественного музыкального образования в первое десятилетие после Октябрьской революции 1917 года</p>',
        '<p>FROM THE HISTORY OF MUSICAL CULTURE<br>
        <em>Korobova A. G.</em> Problems of the Genre Status of Pastoral in Theoretical Concepts of the 16th–18th Centuries and Its Reflection in Musical Theatre<br>
        <em>Smirnova T. V.</em> Dynasties of Italian Musicians at the Tudor Court<br>
        <em>Lyubimov D. V.</em> Robert Schumann''s "Carnaval" in the Orchestrations of Russian Composers<br>
        <em>Melnikova A. V.</em> Paul Hindemith''s Opera "The Long Christmas Dinner": Symbolization as a Means of Semantic Construction<br><br>
        ON THE MATERIALS OF THE ANNIVERSARY CONFERENCE DEDICATED TO THE 130TH ANNIVERSARY OF S. S. PROKOFIEV<br>
        <em>Borodin A. B.</em> On the Question of Scriabin''s Influence on the Early Piano Works of S. S. Prokofiev<br>
        <em>Khusnutdinova E. A.</em> S. S. Prokofiev and S. A. Koussevitzky: Touches to a Double Portrait<br>
        <em>Porshnev I. D.</em> "We Expected the Familiar, but Brushed Aside the Unfamiliar": The History of Concert Performances of Music from Prokofiev''s Ballet "Le Pas d''Acier" in the USSR (1928, 1929, 1932)<br>
        <em>Milovanova O. E.</em> A Composer at War – N. Ya. Myaskovsky<br><br>
        ISSUES OF MUSIC EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Terekhonova K. Yu.</em> Russian Music School 100 Years Ago: From the History of the Formation of the National Music Education System in the First Decade after the October Revolution of 1917</p>',
        'cover30.jpg',
        '2022_30.pdf'),

        (2022,
         31,
         'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 31',
         'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 31',
         '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2022</p>
         <p><em>Количество страниц:</em>&nbsp;97 с.</p>
         <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2022</p>
         <p><em>Number of pages:</em>&nbsp;97 pp.</p>
         <p><em>Circulation:</em>&nbsp;100 copies.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p">СОВРЕМЕННЫЕ ПРОБЛЕМЫ ИСКУССТВА<br>
         <em>Марков А. В.</em> Традиции церковной гимнографии в проекте «Страсти по Матфею-2000»: к социологии русских художественных сообществ<br><br>
         ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
         <em>Позднякова Л. В.</em> Черты музыкального конструктивизма в циклических сонатах А. В. Мосолова<br><br>
         МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
         <em>Зенкин К. В.</em> Музыкальный смысл и исполнительский жест<br>
         <em>Бородин Б. Б.</em> «Авторецензия» Ферруччо Бузони: комментарии к переводу<br><br>
         ИЗ ИСТОРИИ ИСПОЛНИТЕЛЬСКОГО ИСКУССТВА<br>
         <em>Меркулов А. В.</em> «Первоклассный пианист в ряду самых выдающихся пианистов нашего времени»: о рахманиновском современнике Леониде Александровиче Максимове<br>
         <em>Подгузова М. М.</em> Арфистка Санкт-Петербургских императорских театров Екатерина Вальтер-Кюне<br><br>
         ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
         <em>Адищев В. И.</em> Научный совет как форма сотрудничества учёных-музыкантов российских регионов<br>
         <em>Денисова Г. А.</em> Кафедра сольного пения Уральской консерватории: от прошлого к настоящему</p>',
         '<p>CONTEMPORARY PROBLEMS OF ART<br>
         <em>Markov A. V.</em> Traditions of Church Hymnography in the Project "St. Matthew Passion-2000": Toward a Sociology of Russian Artistic Communities<br><br>
         ISSUES OF MUSIC THEORY<br>
         <em>Pozdnyakova L. V.</em> Features of Musical Constructivism in the Cyclic Sonatas of A. V. Mosolov<br><br>
         MUSICOLOGY AND PERFORMANCE<br>
         <em>Zenkin K. V.</em> Musical Meaning and Performance Gesture<br>
         <em>Borodin B. B.</em> Ferruccio Busoni''s "Self-Review": Comments on the Translation<br><br>
         FROM THE HISTORY OF PERFORMING ARTS<br>
         <em>Merkulov A. V.</em> "A First-Class Pianist Among the Most Outstanding Pianists of Our Time": On Rachmaninoff''s Contemporary Leonid Alexandrovich Maksimov<br>
         <em>Podguzova M. M.</em> Harpist of the St. Petersburg Imperial Theatres Ekaterina Walter-Kühne<br><br>
         ISSUES OF MUSIC EDUCATION: HISTORY, THEORY, PRACTICE<br>
         <em>Adishchev V. I.</em> Scientific Council as a Form of Cooperation among Music Scholars of Russian Regions<br>
         <em>Denisova G. A.</em> Department of Solo Singing of the Ural Conservatory: From the Past to the Present</p>',
         'cover31.jpg',
         '2022_31.pdf'),

        (2023,
         32,
         'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 32',
         'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 32',
         '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2023</p>
         <p><em>Количество страниц:</em>&nbsp;97 с.</p>
         <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2023</p>
         <p><em>Number of pages:</em>&nbsp;97 pp.</p>
         <p><em>Circulation:</em>&nbsp;100 copies.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p">ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
         <em>Окунева Е. Г.</em> Теория полярности Зигфрида Карг-Элерта<br><br>
         МУЗЫКАЛЬНАЯ КУЛЬТУРА: ИСТОРИЯ И СОВРЕМЕННОСТЬ<br>
         <em>Панкина Е. В., Юшкова К. С.</em> Хосе де Каньисарес в истории придворной сарсуэлы<br>
         <em>Максимова А. Е.</em> Балет Ф. Шольца «Пагубные следствия пылких страстей Дон Жуана, или привидение убитого им командора» (1821)<br>
         <em>Ефимова Н. И., Матвеева А. И.</em> Конструкт РМО/ИРМО в истории развития академической музыки постоктябрьской России (на примере работы Владивостокского отделения в эпоху Дальневосточной республики)<br>
         <em>Чупова А. Г.</em> Воплощение мифа в «Персее и Андромеде» С. Шаррино<br><br>
         МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
         <em>Дабаева И. П.</em> Музыка русского барокко в музыковедческом осмыслении и исполнительской интерпретации<br>
         <em>Сайгушкина О. П.</em> «Скиталец» Ф. Шуберта как вершина эволюции жанра фортепианной фантазии в творчестве композитора и объект исполнительской интерпретации<br><br>
         ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ТЕОРИЯ И ПРАКТИКА<br>
         <em>Цукер А. М.</em> Массовая музыка в системе академического музыкального образования</p>',
         '<p>ISSUES OF MUSIC THEORY<br>
         <em>Okuneva E. G.</em> Siegfried Karg-Elert''s Theory of Polarity<br><br>
         MUSICAL CULTURE: HISTORY AND CONTEMPORARY<br>
         <em>Pankina E. V., Yushkova K. S.</em> José de Cañizares in the History of Court Zarzuela<br>
         <em>Maksimova A. E.</em> F. Scholz''s Ballet "The Fatal Consequences of Don Juan''s Ardent Passions, or the Ghost of the Commander He Killed" (1821)<br>
         <em>Efimova N. I., Matveeva A. I.</em> The RMO/IRMS Construct in the History of Academic Music Development in Post-October Russia (on the Example of the Vladivostok Branch during the Far Eastern Republic Era)<br>
         <em>Chupova A. G.</em> The Embodiment of Myth in "Perseus and Andromeda" by S. Sciarrino<br><br>
         MUSICOLOGY AND PERFORMANCE<br>
         <em>Dabaeva I. P.</em> Russian Baroque Music in Musicological Interpretation and Performance Practice<br>
         <em>Saigushkina O. P.</em> Schubert''s "Der Wanderer" as the Culmination of the Composer''s Piano Fantasy Genre Evolution and an Object of Performance Interpretation<br><br>
         ISSUES OF MUSIC EDUCATION: THEORY AND PRACTICE<br>
         <em>Tzukker A. M.</em> Mass Music in the System of Academic Music Education</p>',
         'cover32.jpg',
         '2023_32.pdf'),

        (2023,
        33,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 33',
         'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 33',
         '<p><em>Редакторы:</em>&nbsp;Е.Е. Полоцкая (отв. ред.), М.В. Городилова, А.Г. Коробова</p>
         <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2023</p>
         <p><em>Количество страниц:</em>&nbsp;103 с.</p>
         <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p><em>Editors:</em>&nbsp;E.E. Polotskaya (Executive Editor), M.V. Gorodilova, A.G. Korobova</p>
         <p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2023</p>
         <p><em>Number of pages:</em>&nbsp;103 pp.</p>
         <p><em>Circulation:</em>&nbsp;100 copies.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p">ВОПРОСЫ МУЗЫКАЛЬНОЙ ЭСТЕТИКИ<br>
         <em>Субботина Н. М.</em> «Таинство пленения мечты» (философско-эстетических основаниях творчества А. Н. Скрябина)<br><br>
         СОВРЕМЕННЫЕ ПРОБЛЕМЫ ТЕОРИИ МУЗЫКИ<br>
         <em>Мальцева А. А.</em> Figurenlehre и «больше, чем Figurenlehre» в аналитике музыкальных фигур эпохи Барокко<br>
         <em>Пылаев М. Е.</em> К вопросу о гармоническом четырёхголосии и его роли в музыке Нового времени<br><br>
         ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
         <em>Кадочников В. П.</em> Судьба хорала Страстной Пятницы «O Haupt voll Blut und Wunden»<br>
         <em>Любимов Д. В.</em> Лючия и Жизель: безумные героини в музыкальном театре XIX века<br>
         <em>Клочкова Е. В.</em> «Симфонический музыкальный Апокалипсис» Алемдара Караманова<br>
         <em>Чахвадзе Н. В.</em> Мифопоэтические и ритуальные мотивы как способ отражения национального в творчестве русских композиторов, работавших в Узбекистане<br>
         <em>Карташова Т. В.</em> Музыкальная культура Северной Индии в свете влияния ислама<br><br>
         ДЕЯТЕЛИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ РОССИЙСКИХ РЕГИОНОВ<br>
         <em>Евдокимова Н. К.</em> Акустический подход к процессу голосообразования в научных трудах Е. Е. Егорова</p>',
         '<p>ISSUES OF MUSICAL AESTHETICS<br>
         <em>Subbotina N. M.</em> "The Mystery of Capturing the Dream" (On the Philosophical and Aesthetic Foundations of A. N. Scriabin''s Work)<br><br>
         CONTEMPORARY PROBLEMS OF MUSIC THEORY<br>
         <em>Maltseva A. A.</em> Figurenlehre and "More than Figurenlehre" in the Analytics of Musical Figures of the Baroque Era<br>
         <em>Pylaev M. E.</em> On the Question of Harmonic Four-Part Writing and Its Role in the Music of Modern Times<br><br>
         FROM THE HISTORY OF MUSICAL CULTURE<br>
         <em>Kadochnikov V. P.</em> The Fate of the Good Friday Chorale "O Haupt voll Blut und Wunden"<br>
         <em>Lyubimov D. V.</em> Lucia and Giselle: Mad Heroines in 19th-Century Musical Theatre<br>
         <em>Klochkova E. V.</em> "Symphonic Musical Apocalypse" by Alemdar Karamanov<br>
         <em>Chakhvadze N. V.</em> Mythopoetic and Ritual Motifs as a Means of Reflecting the National in the Works of Russian Composers Who Worked in Uzbekistan<br>
         <em>Kartashova T. V.</em> Musical Culture of North India in the Light of Islamic Influence<br><br>
         FIGURES OF MUSICAL CULTURE OF RUSSIAN REGIONS<br>
         <em>Evdokimova N. K.</em> Acoustic Approach to the Process of Voice Production in the Scholarly Works of E. E. Egorov</p>',
         'cover33.jpg',
         '2023_33.pdf'),

        (2023,
        34,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 34',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 34',
        '<p><em>Редакторы:</em>&nbsp;Е.Е. Полоцкая (отв. ред.), М.В. Городилова, А.Г. Коробова</p>
        <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2023</p>
        <p><em>Количество страниц:</em>&nbsp;103 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Editors:</em>&nbsp;E.E. Polotskaya (Executive Editor), M.V. Gorodilova, A.G. Korobova</p>
        <p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2023</p>
        <p><em>Number of pages:</em>&nbsp;103 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br>
        <em>Чахвадзе Н. В.</em> Об оперном творчестве Вернера Эгка: свой путь<br>
        <em>Шелудякова О. Е.</em> Отечественная православная духовная музыка рубежа ХХ–ХХI веков: традиция и обновление <br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Бородин Б. Б.</em> «Апокрифы» Рахманинова<br>
        <em>Меркулов А. М.</em> «Разрушитель устоев, способствующих рутине»: Л. А. Максимов (1873–1904) как музыкальный критик<br><br>
        ИЗ ИСТОРИИ ИСПОЛНИТЕЛЬСКОГО ИСКУССТВА<br>
        <em>Подгузова М. М.</em> Забытые имена. Ида Цабель-Рашат (1865–1913) – профессор Санкт-Петербургской консерватории по классу арфы<br><br>
        МУЗЫКА ХХ ВЕКА ДЛЯ ДЕТЕЙ<br>
        <em>Фиденко Ю. Л.</em> Образы французских сказок в фортепианном цикле Мориса Равеля «Моя Матушка-Гусыня»<br>
        <em>Городилова М. В., Ермаков А. А.</em> «Детский рай» Артура Лурье: опусы для детей композитора-авангардиста<br><br>
        МУЗЫКА КИНО<br>
        <em>Зырянов М. Л.</em> Графический метод исследования оригинальных саундтреков на примере работы с партитурой к фильму «Звёздные войны: Эпизод I»</p>',
        '<p>ISSUES OF MUSIC HISTORY<br>
        <em>Chakhvadze N. V.</em> On the Operatic Work of Werner Egk: A Path of His Own<br><
        em>Sheludyakova O. E.</em> Russian Orthodox Sacred Music at the Turn of the 20th–21st Centuries: Tradition and Renewal<br><br>
        MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Borodin B. B.</em> Rachmaninoff''s "Apocrypha"<br>
        <em>Merkulov A. M.</em> "A Destroyer of Foundations That Foster Routine": L. A. Maximov (1873–1904) as a Music Critic<br><br>
        FROM THE HISTORY OF PERFORMING ARTS<br>
        <em>Podguzova M. M.</em> Forgotten Names. Ida Zabel-Raschat (1865–1913) – Professor of Harp at the St. Petersburg Conservatory<br><br>
        20TH‑CENTURY MUSIC FOR CHILDREN<br>
        <em>Fidenko Yu. L.</em> Images of French Fairy Tales in Maurice Ravel''s Piano Cycle "Ma mère l''Oye"<br>
        <em>Gorodilova M. V., Ermakov A. A.</em> Arthur Lourié''s "Children''s Paradise": Works for Children by an Avant‑Garde Composer<br><br>
        FILM MUSIC<br>
        <em>Zyryanov M. L.</em> A Graphic Method for Analysing Original Soundtracks Based on Work with the Score for "Star Wars: Episode I"</p>',
        'cover34.jpg',
        '2023_34.pdf'),

        (2023,
        35,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 35',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 35',
        '<p><strong>Императорское Русское музыкальное общество: на переломах истории</strong></p>
        <p><strong>Материалы Международной научно-практической конференции</strong></p>
        <p>&nbsp;</p>
        <p><em>Редакторы:</em>&nbsp;Е.Е. Полоцкая (отв. ред.), М.В. Городилова, А.Г. Коробова</p>
        <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2023</p>
        <p><em>Количество страниц:</em>&nbsp;80 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><strong>The Imperial Russian Musical Society: At the Turning Points of History</strong></p>
        <p><strong>Proceedings of the International Research and Practical Conference</strong></p>
        <p>&nbsp;</p>
        <p><em>Editors:</em>&nbsp;E.E. Polotskaya (Executive Editor), M.V. Gorodilova, A.G. Korobova</p>
        <p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2023</p>
        <p><em>Number of pages:</em>&nbsp;80 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p">ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
        <em>Пылаева Л. Д.</em> К вопросу о принципах формообразования в пассакалиях Ф. Куперена<br><br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Урванцева О. А.</em> «Контрапункт стилей» в творчестве Глинки<br>
        <em>Чахвадзе Н. В.</em> Новый взгляд на симфоническую поэму А. Ф. Козловского «Танавар»<br>
        <em>Девятова О. Л.</em> Музыкальная гофманиана Сергея Слонимского в балете «Волшебный орех»<br><br>
        МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Сорокина У. В.</em> Православная церковно-певческая жизнь Харбина в свете периодической печати 1920–1940 годов<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Хрулева И.</em> Вопросы дыхания в трактате «Метод пения» Парижской консерватории: мифы и реальность<br><br>
        К ЮБИЛЕЮ УРАЛЬСКОЙ ГОСУДАРСТВЕННОЙ КОНСЕРВАТОРИИ<br>
        <em>Городилова М. В., Вялухина В. И.</em> Кафедра теории музыки Уральской консерватории в XXI веке</p>',
        '<p">ISSUES OF MUSIC THEORY<br>
        <em>Pylaeva L. D.</em> On the Question of Principles of Form‑Building in F. Couperin''s Passacailles<br><br>
        FROM THE HISTORY OF MUSICAL CULTURE<br>
        <em>Urvantseva O. A.</em> "Counterpoint of Styles" in Glinka''s Works<br>
        <em>Chakvadze N. V.</em> A New Look at A. F. Kozlovsky''s Symphonic Poem "Tanavar"<br>
        <em>Devyatova O. L.</em> Sergei Slonimsky''s Musical Hoffmanniana in the Ballet "The Magic Nut"<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Sorokina U. V.</em> Orthodox Church‑Singing Life in Harbin in the Light of Periodical Press of the 1920s–1940s<br><br>
        MUSICAL EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Khruleva I.</em> Questions of Breathing in the Treatise "Singing Method" of the Paris Conservatory: Myths and Reality<br><br>
        ON THE ANNIVERSARY OF THE URAL STATE CONSERVATORY<br>
        <em>Gorodilova M. V., Vyalukhina V. I.</em> The Department of Music Theory of the Ural Conservatory in the 21st Century</p">',
        'cover35.jpg',
        '2023_35.pdf'),

        (2024,
        36,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 36',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 36',
        '<p><strong>Императорское Русское музыкальное общество: на переломах истории</strong></p>
        <p><strong>Материалы Международной научно-практической конференции</strong></p>
        <p>&nbsp;</p>
        <p><em>Редакторы:</em>&nbsp;Е.Е. Полоцкая (отв. ред.), М.В. Городилова, А.Г. Коробова</p>
        <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2024</p>
        <p><em>Количество страниц:</em>&nbsp;107 с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><strong>The Imperial Russian Musical Society: At the Turning Points of History</strong></p>
        <p><strong>Proceedings of the International Research and Practical Conference</strong></p>
        <p>&nbsp;</p>
        <p><em>Editors:</em>&nbsp;E.E. Polotskaya (Executive Editor), M.V. Gorodilova, A.G. Korobova</p>
        <p><em>Publisher:</em>&nbsp;Ural State Conservatory named after M. P. Mussorgsky. – Yekaterinburg: USMC, 2024</p>
        <p><em>Number of pages:</em>&nbsp;107 pp.</p>
        <p><em>Circulation:</em>&nbsp;100 copies.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p>СОВРЕМЕННЫЕ ПРОБЛЕМЫ ИСКУССТВА<br>
        <em>Лысенко С.Ю.</em> К проблеме композиторской режиссуры: музыкальная партитура и визуально-сценическое решение оперного спектакля<br><br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Ионайтис О.Б.</em> А.Н. Радищев: музыка и поэзия в век Просвещения<br>
        <em>Кадочников В.П.</em> Й. Гайдн «Семь слов Спасителя на кресте»: три версии – три жанра<br>
        <em>Денисова Г.А.</em> Orchestergesang в творчестве Макса Регера: к вопросу о модели жанра<br>
        <em>Петухова С.А.</em> «Огненный ангел»: премьеры и отклики (1928–1966)<br>
        <em>Клочкова Е.В.</em> Творчество Алемдара Караманова в отечественных исследованиях второй половины XX – начала XXI веков<br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Меркулов А.М.</em> Л.А. Максимов как пианист-педагог в музыкальных классах и училищах ИРМО<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Глушкова О.Р.</em> К вопросу включения предметов духовного содержания в современную образовательную программу подготовки музыкантов (на примере Московской консерватории РМО)</p>',
        '<p>CONTEMPORARY PROBLEMS OF ART<br>
        <em>Lysenko S.Yu.</em> On the Problem of Composer''s Direction: Musical Score and Visual‑Stage Solution of an Opera Performance<br><br>
        FROM THE HISTORY OF MUSICAL CULTURE<br>
        <em>Ionaĭtis O.B.</em> A.N. Radishchev: Music and Poetry in the Age of Enlightenment<br>
        <em>Kadochnikov V.P.</em> J. Haydn''s "The Seven Last Words of Christ on the Cross": Three Versions – Three Genres<br>
        <em>Denisova G.A.</em> Orchestergesang in the Works of Max Reger: On the Question of the Genre Model<br>
        <em>Petukhova S.A.</em> "The Fiery Angel": Premieres and Responses (1928–1966)<br>
        <em>Klochkova E.V.</em> The Works of Alemdar Karamanov in Russian Scholarship of the Second Half of the 20th – Early 21st Centuries<br><br>
        MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Merkulov A.M.</em> L.A. Maximov as a Pianist‑Teacher in the Music Classes and Schools of the IRMS (Imperial Russian Musical Society)<br><br>
        MUSICAL EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Glushkova O.R.</em> On the Question of Including Subjects of Spiritual Content in the Modern Educational Curriculum for Musicians (on the Example of the Moscow Conservatory of the RMO)</p>',
        'cover36.jpg',
        '2025_36.pdf'),

        (2024,
        37,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 37',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 37',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2024</p>
        <p><em>Количество страниц: 73</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2024</p>
        <p><em>Number of pages: 73</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p">ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br>
        <em>Любимов Д. В.</em> Сцена безумия Мелинды из оперы Ф. Эркеля «Банк Бан»: преломление европейских и национальных традиций<br>
        <em>Пыжьянова А. Г.</em> Европейская Künstleroper первой трети XX века: конфликт художника и общества<br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Бородин Б. Б.</em> Ферруччо Бузони: мысли о фортепианном искусстве<br><br>МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Петухова С. А.</em> Оперный замысел Прокофьева и образ Александра Македонского<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Тереханова К. Ю.</em> Народные школы музыкального просвещения Петрограда после Октябрьской революции 1917 года: к вопросу о характере взаимодействия общего и специального музыкального образования<br>
        <em>Евдокимова Н. К.</em> Кафедра сольного пения уральской консерватории: у истоков региональной науки (1934–1974)<br><br>
        ПРОБЛЕМЫ МУЗЫКАЛЬНОЙ АКУСТИКИ<br>
        <em>Рубин Л. С.</em> Слышим ли мы частоты выше 20 килогерц?</p>',
        '<p">ISSUES OF MUSIC HISTORY<br>
        <em>Lyubimov D. V.</em> Melinda''s Madness Scene from F. Erkel''s Opera "Bánk bán": Refraction of European and National Traditions<br>
        <em>Pyzhyanova A. G.</em> European Künstleroper of the First Third of the 20th Century: Conflict of the Artist and Society<br><br>
        MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Borodin B. B.</em> Ferruccio Busoni: Thoughts on Piano Art<br><br>MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Petukhova S. A.</em> Prokofiev''s Operatic Concept and the Image of Alexander the Great<br><br>
        MUSICAL EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Terekhanova K. Yu.</em> People''s Schools of Musical Education in Petrograd after the October Revolution of 1917: On the Question of the Nature of Interaction between General and Special Musical Education<br>
        <em>Evdokimova N. K.</em> The Department of Solo Singing of the Ural Conservatory: At the Origins of Regional Scholarship (1934–1974)<br><br>
        PROBLEMS OF MUSICAL ACOUSTICS<br>
        <em>Rubin L. S.</em> Can We Hear Frequencies Above 20 Kilohertz?</p">',
        'cover37.jpg',
        '2024_37.pdf'),

       (2024,
        38,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 38',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 38',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2024</p>
        <p><em>Количество страниц: 56</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2024</p>
        <p><em>Number of pages: 56</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p>ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Шелудякова О. Е. </em>Стилевые тенденции православной музыки русской эмиграции<br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Бородин Б. Б. </em>Статья Ферруччо Бузони «Значимость обработки»: комментарии к переводу
        <em>Субботина Е. И. </em>Ансамбль как форма художественного диалога<br><br>
        ВОПРОСЫ ИНСТРУМЕНТОВЕДЕНИЯ<br>
        <em>Вялухина В. И. </em>Lira organizzata и «культ экзотических инструментов» в музыке второй половины XVIII века
        <em>Устюгова А. В. </em>К истории создания «баховского» смычка<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Тереханова К. Ю. </em>Советская музыкальная школа в годы Великой Отечественной войны: к вопросу взаимодействия общего и специального музыкального образования</p>',
        '<p>FROM THE HISTORY OF MUSICAL CULTURE<br>
        <em>Sheludyakova O. E. </em>Stylistic trends of Orthodox music of the Russian emigration<br><br>
        MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Borodin B. B. </em>Ferruccio Busoni''s article "The Significance of Arrangement": commentary on the translation
        <em>Subbotina E. I. </em>Ensemble as a form of artistic dialogue<br><br>
        ISSUES OF INSTRUMENTOLOGY<br>
        <em>Vyalukhina V. I. </em>Lira organizzata and the "cult of exotic instruments" in the music of the second half of the 18th century
        <em>Ustyugova A. V. </em>On the history of the creation of the "Bach" bow<br><br>
        MUSIC EDUCATION: HISTORY, THEORY, PRACTICE<br>
        <em>Terekhanova K. Yu. </em>The Soviet music school during the Great Patriotic War: on the issue of interaction between general and special music education</p>',
        'cover38.jpg',
        '2024_38.pdf'),

        (2024,
         39,
         'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 39',
         'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 39',
         '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2024</p>
         <p><em>Количество страниц: 66</em>&nbsp;с.</p>
         <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
         '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2024</p>
         <p><em>Number of pages: 66</em>&nbsp;pp.</p>
         <p><em>Circulation:</em> 100 copies.</p>
         <p>ISSN:&nbsp;2658-7858',
         '<p>ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
         <em>Ефремов Н.А.</em> Регентское преемство в московском храме пророка Илии Обыденном: В.А. Хлебников и судьба его нотной коллекции<br>
         <em> Слатвинская С.А.</em> Эволюция открытой формы в композиторском творчестве Эрла Брауна<br><br>
         ПРОБЛЕМЫ ЭТНОМУЗЫКОЛОГИИ<br>
         <em>Бахтияри Ф.Ф.</em> Проявление оппозиции «певческий голос – музыкальный инструмент» в музыкальной культуре народов Волго-Уралья<br><br>
         МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
         <em>Гагарина О.А., Кабилькова Н.Ю.</em> «Вариации на тему рококо» П.И. Чайковского: к проблеме редакций<br><br>
         МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
         <em>Городилова М.В., Мешкова А.С.</em> Музыка Макса Регера как дидактический материал<br><br>
         СТРАНИЦЫ ИСТОРИИ УРАЛЬСКОЙ КОНСЕРВАТОРИИ<br>
         <em>Евдокимова Н.К.</em> «Научно-методические записки» – первое печатное издание Уральской консерватории (1957–1973)</p>',
         '<p>FROM THE HISTORY OF MUSICAL CULTURE<br>
         <em>Efremov N.A.</em> Regent Succession in the Moscow Church of the Prophet Elijah the Ordinary: V.A. Khlebnikov and the Fate of His Sheet Music Collection<br>
         <em>Slatvinskaya S.A.</em> Evolution of Open Form in the Compositional Work of Earle Brown<br><br>
         PROBLEMS OF ETHNOMUSICOLOGY<br>
         <em>Bakhtiyari F.F.</em> Manifestation of the Opposition "Singing Voice – Musical Instrument" in the Musical Culture of the Volga-Ural Peoples<br><br>
         MUSICAL SCIENCE AND PERFORMANCE<br>
         <em>Gagarina O.A., Kabilkova N.Yu.</em> Tchaikovsky''s "Variations on a Rococo Theme": On the Problem of Editions<br><br>
         MUSICAL EDUCATION: HISTORY, THEORY, PRACTICE<br>
         <em>Gorodilova M.V., Meshkova A.S.</em> The Music of Max Reger as Didactic Material<br><br>
         PAGES OF THE HISTORY OF THE URAL CONSERVATORY<br>
         <em>Evdokimova N.K.</em> "Scientific and Methodological Notes" – The First Printed Publication of the Ural Conservatory (1957–1973)</p>',
         'cover39.jpg',
         '2024_39.pdf'),

       (2025,
        40,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 40',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 40',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2025</p>
        <p><em>Количество страниц: 56</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2025</p>
        <p><em>Number of pages: 56</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br><br>
        Тихомирова А. А. Рассредоточенный тематизм в Новейшей музыке: основные векторы проявления в формообразовании<br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>Возчиков Д. В. Музыкальная культура Южной и Юго-Восточной Азии в травелогах венецианских купцов XV–XVI веков<br><br>
        Логинова Л. Н. Джон Кейдж – изобретатель языков и смыслов<br>
        Клочкова Е. В. Индивидуальный мир композиторского творчества: к 90-летию Алемдара Караманова<br>
        Воротынцева Л. А. Теоретическое осмысление «новой простоты» в отечественном культурном пространстве<br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br><br>
        Ковалёв А. Б. Русская духовная музыка как одно из ведущих направлений в концертной, образовательной и научной деятельности Академии хорового искусства имени В. С. Попова</p>',
        '<p>ISSUES OF MUSIC THEORY<br><br>
         Tikhomirova A. A. Dispersed Thematicism in Newest Music: Main Vectors of Manifestation in Form‑Building<br>
         FROM THE HISTORY OF MUSICAL CULTURE<br><br>
         Vozchikov D. V. Musical Culture of South and Southeast Asia in the Travelogues of Venetian Merchants of the 15th–16th Centuries<br>
         Loginova L. N. John Cage – Inventor of Languages and Meanings<br>
         Klochkova E. V. The Individual World of Compositional Creativity: On the 90th Anniversary of Alemdar Karamanov<br>
         Vorotyntseva L. A. Theoretical Understanding of the "New Simplicity" in the Russian Cultural Space<br>
         MUSICAL EDUCATION: HISTORY, THEORY, PRACTICE<br><br>
         Kovalyov A. B. Russian Sacred Music as One of the Leading Directions in the Concert, Educational, and Research Activities of the Popov Academy of Choral Art</p>',
        'cover40.jpg',
        '2025_40.pdf'),

       (2025,
        41,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 41',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 41',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2025</p>
        <p><em>Количество страниц: 65</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
         <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2025</p>
        <p><em>Number of pages: 65</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
        <em>Молчанов А. С.</em> Вопросы симметрии, музыкальной формы и повтора в лекциях Карлоса Чавеса<br><br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Черниченко Д. В.</em> Ретроспектива секстетов Гаэтано Брунетти и Луиджи Боккерини: анализ музыкальных инноваций и их культурного контекста<br>
        <em>Пыжьянова А. Г.</em> Романтический тип героя-художника и его преломление в австро-немецкой Künstleroper начала ХХ века<br>
        <em>Денисова Г. А.</em> Шесть романсов на слова японских поэтов для тенора с оркестром ор. 21 Д. Шостаковича: к проблеме жанра Orchestergesang<br>
        <em>Чумаченко Д. И.</em> «Новая простота» в произведениях Альфреда Шнитке 1970-х годов: «Stille Musik» и «Stille Nacht»<br><br>
        ИСПОЛНИТЕЛЬ В ЗЕРКАЛЕ МУЗЫКИ<br>
        <em>Юсупова В. В.</em> Нина Александровна Фриде в музыкальных стихотворениях Ц. А. Кюи op. 67 (1904)</p>',
        '<p>ISSUES OF MUSIC THEORY<br>
         <em>Molchanov A. S.</em> Questions of Symmetry, Musical Form, and Repetition in the Lectures of Carlos Chávez<br><br>
         FROM THE HISTORY OF MUSICAL CULTURE<br>
         <em>Chernichenko D. V.</em> A Retrospective of the Sextets by Gaetano Brunetti and Luigi Boccherini: Analysis of Musical Innovations and Their Cultural Context<br>
         <em>Pyzhyanova A. G.</em> The Romantic Type of the Artist‑Hero and Its Refraction in the Austro‑German Künstleroper of the Early 20th Century<br>
         <em>Denisova G. A.</em> Six Romances on Words by Japanese Poets for Tenor and Orchestra, Op. 21 by D. Shostakovich: On the Problem of the Orchestergesang Genre<br>
         <em>Chumachenko D. I.</em> "New Simplicity" in the Works of Alfred Schnittke from the 1970s: "Stille Musik" and "Stille Nacht"<br><br>
         PERFORMER IN THE MIRROR OF MUSIC<br>
         <em>Yusupova V. V.</em> Nina Aleksandrovna Friede in the Musical Poems by Ts. A. Cui, Op. 67 (1904)</p>',
        'cover41.jpg',
        '2025_41.pdf'),

       (2025,
        42,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 42',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 42',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2025</p>
       <p><em>Количество страниц: 60</em>&nbsp;с.</p>
       <p><em>Тираж:</em>&nbsp;100 экз.</p>
       <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2025</p>
       <p><em>Number of pages: 60</em>&nbsp;pp.</p>
       <p><em>Circulation:</em> 100 copies.</p>
       <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
        <em>Городилова М. В.</em> Гармония «золотого хода»: от Бетховена до Шнитке<br><br>
        МЕЖДИСЦИПЛИНАРНЫЕ ИССЛЕДОВАНИЯ В ИСКУССТВЕ<br>
        <em>Колганова О. В.</em> Светозвуковые и светоцветовые эксперименты в творчестве российских художников, композиторов и изобретателей первой трети XX века<br><br>
        ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br>
        <em>Королевская Н. В., Дин Лулу</em>. Фортепианная миниатюра Шопена как автометафора<br>
        <em>Галкин А. А.</em> Опера «Три Пинто» в творческой биографии Густава Малера<br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Бородин Б. Б.</em> Письма Ферруччо Бузони к жене за 1895–1896 годы: перевод и комментарии<br><br>
        МУЗЫКАЛЬНОЕ ОБРАЗОВАНИЕ: ИСТОРИЯ, ТЕОРИЯ, ПРАКТИКА<br>
        <em>Литвинова Т. А.</em> Третий вид речитатива в курсе сольфеджио</p>',
        '<p>ISSUES OF MUSIC THEORY<br>
        <em>Gorodilova M. V.</em> Harmony of the "golden progression": from Beethoven to Schnittke<br><br>
        INTERDISCIPLINARY RESEARCH IN ART<br>
        <em>Kolganova O. V.</em> Light-sound and light-color experiments in the works of Russian artists, composers and inventors of the first third of the 20th century<br><br>
        FROM THE HISTORY OF MUSICAL CULTURE<br>
        <em>Korolevskaya N. V., Ding Lulu</em>. Chopin''s piano miniature as an autometaphor<br>
        <em>Galkin A. A.</em> The opera "The Three Pintos" in Gustav Mahler''s creative biography<br><br>
        MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Borodin B. B.</em> Ferruccio Busoni''s letters to his wife from 1895–1896: translation and commentary<br><br>
        MUSIC EDUCATION: HISTORY, THEORY, PRACTICE<br>',
        'cover42.jpg',
        '2025_42.pdf'),

       (2025,
        43,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 43',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 43',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2025</p>
        <p><em>Количество страниц: 93</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2025</p>
        <p><em>Number of pages: 93</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ ТЕОРИИ МУЗЫКИ<br>
        <em>Ситдиков А. С. </em>Реквием Э. Н. Артемьева как пример претворения канонического жанра в современной музыке<br>&nbsp;</p>
         <p>ИЗ ИСТОРИИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ<br><em>Поршнев И. Д. </em>«Нелегко родился этот спектакль…»: «Красный мак» – «поэма-либретто» М. П. Гальперина и балет Р. М. Глиэра</p>
         <p><em>Кожевникова В. А. </em>Между иронией и искренностью: «Старинная музыка российских провинциальных цирков» и «Российские фотографии» Родиона Щедрина<br>&nbsp;</p>
         <p>ПРОБЛЕМЫ ЭТНОМУЗЫКОЛОГИИ<br><em>Крылов К. А. </em>Особые формы соотношения стиха и напева в свадебных песнях оренбургских казаков</p>
         <p><em>Арынова А. Д. </em>Народная терминология казахских обрядовых плачей как способ жанровой атрибуции<br>&nbsp;</p>
         <p>МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br><em>Туринцева А. Б. </em>Эстетические баталии: Камилло Эверарди и русско-итальянский оперный конфликт</p>',
        '<p>ISSUES OF MUSIC THEORY<br><em>Sitdikov A. S.</em> E. N. Artemyev''s Requiem as an Example of the Embodiment of the Canonical Genre in Contemporary Music<br>&nbsp;</p>
         <p>FROM THE HISTORY OF MUSICAL CULTURE<br><em>Porshnev I. D.</em> "This performance was not born easily...": "The Red Poppy" – M. P. Galperin''s "poem-libretto" and R. M. Gliere''s ballet</p>
         <p><em>Kozhevnikova V. A.</em> Between Irony and Sincerity: "Old Music of Russian Provincial Circuses" and "Russian Photographs" by Rodion Shchedrin<br>&nbsp;</p>
         <p>PROBLEMS OF ETHNOMUSICOLOGY<br><em>Krylov K. A.</em> Special Forms of the Correlation between Verse and Melody in the Wedding Songs of the Orenburg Cossacks</p>
         <p><em>Arynova A. D.</em> Folk Terminology of Kazakh Ritual Laments as a Means of Genre Attribution<br>&nbsp;</p>
         <p>MUSICAL SCIENCE AND PERFORMANCE<br><em>Turintseva A. B.</em> Aesthetic Battles: Camillo Everardi and the Russo-Italian Opera Conflict</p>',
        'cover43.jpg',
        '2025_43.pdf'),

       (2026,
        44,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 44',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 44',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2026</p>
    <p><em>Количество страниц: 64</em>&nbsp;с.</p>
    <p><em>Тираж:</em>&nbsp;100 экз.</p>
    <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2026</p>
    <p><em>Number of pages: 64</em>&nbsp;pp.</p>
    <p><em>Circulation:</em> 100 copies.</p>
    <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ СОВРЕМЕННОГО МУЗЫКОЗНАНИЯ<br>
        <em>Демченко А. И.</em> Кардинальные парадигмы творчества Д. Д. Шостаковича: (к 120-летию со дня рождения)<br>
        <em>Галкин А. А.</em> Поэтика природы в симфониях Густава Малера<br><br>МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br>
        <em>Ефимова Н.И., Рудая А.С.</em> Primo uomo в опере Settecento: cтатус и положение в обществе<br><br>
        МУЗЫКАЛЬНЫЕ АРХИВЫ: НОВЫЕ ИССЛЕДОВАНИЯ И ПУБЛИКАЦИИ<br>
        <em>Колганова О. В.</em> 25 лет артистической деятельности композитора и дирижёра Игоря Сергеевича Миклашевского (1894–1942): от симфонической поэмы «Сизиф» до Концерта для фортепиано с оркестром<br><br>
        ВОПРОСЫ ИНСТРУМЕНТОВЕДЕНИЯ<br>
        <em>Цзяцзюнь Линь.</em> Метафоры воды в строении и приёмах игры на китайских традиционных музыкальных инструментах гуцинь и гучжэн<br><br>
        ДЕЯТЕЛИ МУЗЫКАЛЬНОЙ КУЛЬТУРЫ РОССИЙСКИХ РЕГИОНОВ<br><em>Ермаков А. А.</em> Претворение жанровой специфики детской оперы для любительского театра в произведениях М. А. Баска</p>',
        '<p>ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Demchenko A. I.</em> Cardinal paradigms of D. D. Shostakovich''s creative work: (to the 120th anniversary of his birth)<br>
        <em>Galkin A. A.</em> Poetics of nature in Gustav Mahler''s symphonies<br><br>MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Efimova N.I., Rudaya A.S.</em> Primo uomo in Settecento opera: status and position in society<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Kolganova O. V.</em> 25 years of artistic activity of composer and conductor Igor Sergeevich Miklashevsky (1894–1942): from the symphonic poem "Sisyphus" to the Concerto for Piano and Orchestra<br><br>
        ISSUES OF INSTRUMENTOLOGY<br>
        <em>Jiajun Lin.</em> Water metaphors in the structure and performance techniques of Chinese traditional musical instruments guqin and guzheng<br><br>
        FIGURES OF MUSICAL CULTURE IN RUSSIAN REGIONS<br><em>Ermakov A. A.</em> Implementation of genre specifics of children''s opera for amateur theatre in the works of M. A. Baska</p>
        <p>ISSUES OF CONTEMPORARY MUSICOLOGY<br>
        <em>Demchenko A. I.</em> Cardinal paradigms of D. D. Shostakovich''s creative work: (to the 120th anniversary of his birth)<br>
        <em>Galkin A. A.</em> Poetics of nature in Gustav Mahler''s symphonies<br><br>MUSICAL SCIENCE AND PERFORMANCE<br>
        <em>Efimova N.I., Rudaya A.S.</em> Primo uomo in Settecento opera: status and position in society<br><br>
        MUSICAL ARCHIVES: NEW RESEARCH AND PUBLICATIONS<br>
        <em>Kolganova O. V.</em> 25 years of artistic activity of composer and conductor Igor Sergeevich Miklashevsky (1894–1942): from the symphonic poem "Sisyphus" to the Concerto for Piano and Orchestra<br><br>
        ISSUES OF INSTRUMENTOLOGY<br>
        <em>Jiajun Lin.</em> Water metaphors in the structure and performance techniques of Chinese traditional musical instruments guqin and guzheng<br><br>
        FIGURES OF MUSICAL CULTURE IN RUSSIAN REGIONS<br><em>Ermakov A. A.</em> Implementation of genre specifics of children''s opera for amateur theatre in the works of M. A. Baska</p>',
        'cover44.jpg',
        '2026_44.pdf'),

       (2026,
        45,
        'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 45',
        'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 45',
        '<p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2026</p>
        <p><em>Количество страниц: 76</em>&nbsp;с.</p>
        <p><em>Тираж:</em>&nbsp;100 экз.</p>
        <p>ISSN:&nbsp;2658-7858</p>',
        '<p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2026</p>
        <p><em>Number of pages: 76</em>&nbsp;pp.</p>
        <p><em>Circulation:</em> 100 copies.</p>
        <p>ISSN:&nbsp;2658-7858',
        '<p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br>
        <em>Цильке Д. С.</em> Livre de clavecin: формирование жанровых и издательских стандартов во французской клавесинной музыке XVII–XVIII веков<br>
        <em>Пыжьянова А. Г.</em> Образ художника и его творчества в «Дальнем звоне» Франца Шрекера<br><br>
        МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br> <em>Бородин Б. Б.</em> Письма Ферруччо Бузони к жене за 1898–1899 годы: перевод и комментарии<br><br>
        МУЗЫКАЛЬНАЯ КУЛЬТУРА НАРОДОВ МИРА<br> <em>Рыжик О. Н.</em> Фанданго и севильяны: два корня андалузского фольклора в музыкальном и хореографическом искусстве фламенко XX века<br>
        <em>Харитонова Е. В., Сиднева Т. Б.</em> Ценностно-культурные императивы в музыке африканской повседневности<br><br>
        ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ТЕОРИЯ И ПРАКТИКА<br>
        <em>Карабатов Р. П., Галиева А. О.</em> Организационные модели российских хоровых студий XX века и их региональная специфика (на примере Свердловской области)</p>',
        '<p>MUSIC HISTORY ISSUES<br>
         <em>D.S. Zilke</em> Livre de clavecin: The Formation of Genre and Publishing Standards in French Harpsichord Music of the 17th–18th Centuries<br>
         <em>A.G. Pyzhyanova</em> The Image of the Artist and His Creative Work in Franz Schreker’s “Der ferne Klang”<br><br>

         MUSICOLOGICAL RESEARCH AND PERFORMANCE<br>
         <em>B.B. Borodin</em> Ferruccio Busoni’s Letters to His Wife, 1898–1899: Translation and Commentary<br><br>

         MUSICAL CULTURE OF THE PEOPLES OF THE WORLD<br>
         <em>O.N. Ryzhik</em> Fandango and Sevillanas: Two Roots of Andalusian Folklore in the Musical and Choreographic Art of 20th-Century Flamenco<br>
         <em>E.V. Kharitonova, T.B. Sidneva</em> Value-Based Cultural Imperatives in the Music of Everyday Life in Africa<br><br>

         ISSUES IN MUSIC EDUCATION: THEORY AND PRACTICE<br>
         <em>R.P. Karabatov, A.O. Galiyeva</em> Organizational Models of Russian Choral Studios in the 20th Century and Their Regional Specificity (A Case Study of Sverdlovsk Region)</p>',
        'cover45.jpg',
        '2026_45.pdf');
