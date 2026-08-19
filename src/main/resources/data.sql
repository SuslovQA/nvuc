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
                                                                      '<p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br> <em>Цильке Д. С.</em> Livre de clavecin: формирование жанровых и издательских стандартов во французской клавесинной музыке XVII–XVIII веков<br> <em>Пыжьянова А. Г.</em> Образ художника и его творчества в «Дальнем звоне» Франца Шрекера<br><br> МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br> <em>Бородин Б. Б.</em> Письма Ферруччо Бузони к жене за 1898–1899 годы: перевод и комментарии<br><br> МУЗЫКАЛЬНАЯ КУЛЬТУРА НАРОДОВ МИРА<br> <em>Рыжик О. Н.</em> Фанданго и севильяны: два корня андалузского фольклора в музыкальном и хореографическом искусстве фламенко XX века<br> <em>Харитонова Е. В., Сиднева Т. Б.</em> Ценностно-культурные императивы в музыке африканской повседневности <br><br> ВОПРОСЫ МУЗЫКАЛЬНОГО ОБРАЗОВАНИЯ: ТЕОРИЯ И ПРАКТИКА<br><em>Карабатов Р. П., Галиева А. О.</em> Организационные модели российских хоровых студий XX века и их региональная специфика (на примере Свердловской области)</p>',
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
