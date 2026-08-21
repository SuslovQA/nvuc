DROP TABLE IF EXISTS journals CASCADE;

CREATE TABLE journals (
                          id BIGSERIAL PRIMARY KEY,
                          title VARCHAR(255),
                          title_en VARCHAR(255),
                          description TEXT,
                          description_en TEXT,
                          issue INTEGER NOT NULL,
                          year INTEGER NOT NULL,
                          contents TEXT,
                          contents_en TEXT,
                          cover VARCHAR(255),
                          pdf VARCHAR(255)
);

INSERT INTO journals (year, issue, title, title_en, description, description_en, contents, contents_en, cover, pdf) VALUES
                                                                     (2019,
                                                                     16,
                                                                     'Музыка в системе культуры: Научный вестник Уральской консерватории. Вып. 16',
                                                                     'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 16',
                                                                     '<p><strong>Актуальные проблемы языка и культуры:</strong></p>
                                                                     <p><strong>Труды Второй межвузовской научно-практической конференции со всероссийским участием (Екатеринбург, 31 октября 2018 года)</strong></p>&nbsp;
                                                                     <p><em>Отв. ред:</em>&nbsp;Д.С. Бирюков, Д.И. Макаров, Л.А. Серебрякова</p>
                                                                     <p><em>Издательство:</em>&nbsp;Урал. гос. консерватория им. М. П. Мусоргского. – Екатеринбург: УГК, 2019</p>
                                                                     <p><em>Количество страниц:</em>&nbsp;220 с.</p>
                                                                     <p><em>Тираж:</em>&nbsp;100 экз.</p>
                                                                     <p>ISSN:&nbsp;2658-7858</p>',
                                                                     '<p><strong>Current Issues in Language and Culture:</strong></p>
                                                                     <p><strong>Proceedings of the Second Interuniversity Research and Practical Conference with All-Russian Participation (Yekaterinburg, October 31, 2018)</strong></p>&nbsp;
                                                                     <p><em>Editors-in-Chief: D.S. Biryukov, D.I. Makarov, L.A. Serebryakova</p>
                                                                     <p><em>Publisher:</em>&nbsp;Ural State Mussorgsky Conservatory. – Yekaterinburg: USMC, 2019</p>
                                                                     <p><em>Number of pages:</em>&nbsp;220 pp.</p>
                                                                     <p><em>Circulation:</em>&nbsp;100 copies.</p>
                                                                     <p>ISSN:&nbsp;2658-7858</p>',
                                                                     '<p style="text-align: justify;"><em>Основу настоящего (16-го) выпуска Научного вестника Уральской консерватории составляют материалы Второй межвузовской научно-практической конференции со всероссийским участием «Актуальные проблемы языка и культуры», организованной кафедрой общих гуманитарных дисциплин и состоявшейся в УГК имени М. П. Мусоргского 31 октября 2018 года. В конференции приняли участие как маститые учёные, так и молодые исследователи из разных музыкальных вузов и других научных центров Екатеринбурга, а также Москвы, Санкт-Петербурга, Перми, Ханты-Мансийска. Издание содержит результаты новейших изысканий российских учёных по актуальным вопросам русской и зарубежной философии, эстетики и куль-турологии, музыкознания, теории и практики языка и межкультурных коммуникаций, методики преподавания предметов общегуманитарного цикла. Для специалистов и всех интересующихся проблемами современных гума-нитарных наук.
                                                                     </em><br><br>
                                                                     I. ФИЛОСОФИЯ, ИСТОРИЯ<br>
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
                                                                     '<p style="text-align: justify;"><em>
                                                                      The present (16th) issue of the Scientific Bulletin of the Ural Conservatory is based on materials from the Second Interuniversity Research and Practical Conference with All-Russian Participation, “Current Issues in Language and Culture,” organized by the Department of General Humanities and held at the M.P. Mussorgsky Ural State Conservatory on October 31, 2018. The conference brought together both distinguished scholars and young researchers from various music universities and other research centers in Yekaterinburg, as well as from Moscow, St. Petersburg, Perm, and Khanty-Mansiysk. The publication presents the results of the latest research by Russian scholars on topical issues in Russian and foreign philosophy, aesthetics and cultural studies, musicology, language theory and practice, intercultural communication, and methods of teaching subjects within the humanities. The publication is intended for specialists and anyone interested in contemporary humanities.
                                                                      </em><br><br>
                                                                      I. PHILOSOPHY, HISTORY<br>
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
                                                                     'Music in the System of Culture: Scientific Bulletin of the Ural Conservatory. Issue 16',
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
                                                                      '<p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br> <em>Цильке Д. С.</em> Livre de clavecin: формирование жанровых и издательских стандартов во французской клавесинной музыке XVII–XVIII веков<br>
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
