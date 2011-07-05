-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 05 2011 г., 09:10
-- Версия сервера: 5.1.54
-- Версия PHP: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `zadmin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_table`
--

CREATE TABLE IF NOT EXISTS `admin_table` (
  `id_table` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_table`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `admin_table`
--

INSERT INTO `admin_table` (`id_table`, `name`, `created`) VALUES
(1, 'article', '2011-07-03 18:39:50'),
(2, 'article_category', '2011-07-03 18:39:56');

-- --------------------------------------------------------

--
-- Структура таблицы `admin_table_field`
--

CREATE TABLE IF NOT EXISTS `admin_table_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_table` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `type` tinyint(4) DEFAULT '2',
  `is_primary` tinyint(4) DEFAULT '0',
  `required` tinyint(4) DEFAULT '0',
  `field_order` int(11) DEFAULT NULL,
  `show_field` tinyint(4) DEFAULT '1',
  `other` text,
  `show_view` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `admin_table_field`
--

INSERT INTO `admin_table_field` (`id_field`, `id_table`, `name`, `label`, `created`, `type`, `is_primary`, `required`, `field_order`, `show_field`, `other`, `show_view`) VALUES
(1, 2, 'id_category', 'Primary', '2011-07-03 18:40:18', 1, 1, 0, 1, 1, NULL, 1),
(2, 2, 'title', 'Название категории', '2011-07-03 18:40:53', 1, 0, 1, 2, 1, NULL, 1),
(3, 2, 'ident', 'Имя в ссылке', '2011-07-03 18:41:08', 1, 0, 1, 3, 1, NULL, 1),
(4, 2, 'head_title', 'Head title', '2011-07-03 18:41:25', 1, 0, 0, 4, 1, NULL, 1),
(5, 2, 'meta_keywords', 'Meta keywords', '2011-07-03 18:41:41', 1, 0, 0, 5, 1, NULL, 1),
(6, 2, 'meta_description', 'Meta description', '2011-07-03 18:42:01', 1, 0, 0, 6, 1, NULL, 1),
(7, 2, 'static_block', 'Статический блок', '2011-07-03 18:42:19', 3, 0, 0, 7, 1, NULL, 1),
(8, 2, 'is_left_menu', 'Разместить в левом меню', '2011-07-03 18:43:20', 2, 0, 0, 8, 1, NULL, 1),
(9, 2, 'is_visible', 'Показывать раздел', '2011-07-03 18:44:01', 2, 0, 0, 9, 1, NULL, 1),
(10, 1, 'id_article', '', '2011-07-03 18:44:30', 1, 1, 0, 1, 1, NULL, 1),
(11, 1, 'title', 'Название статьи', '2011-07-03 18:45:22', 1, 0, 1, 2, 1, NULL, 1),
(12, 1, 'ident', 'Имя в ссылке', '2011-07-03 18:45:39', 1, 0, 1, 3, 1, NULL, 0),
(13, 1, 'preview', 'Превью', '2011-07-03 18:45:55', 3, 0, 1, 4, 1, NULL, 0),
(14, 1, 'full_text', 'Текст статьи', '2011-07-03 18:46:14', 3, 0, 1, 5, 1, NULL, 0),
(15, 1, 'head_title', 'Head title', '2011-07-03 18:46:34', 1, 0, 0, 6, 1, NULL, 0),
(16, 1, 'meta_keywords', 'Meta keywords', '2011-07-03 18:46:47', 1, 0, 0, 7, 1, NULL, 0),
(17, 1, 'meta_description', 'Meta description', '2011-07-03 18:46:57', 1, 0, 0, 8, 1, NULL, 0),
(18, 1, 'is_visible', 'Показывать статью', '2011-07-03 18:47:26', 2, 0, 0, 9, 1, NULL, 1),
(19, 1, 'created', 'Добавлена', '2011-07-03 18:47:49', 7, 0, 0, 10, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `preview` text,
  `full_text` text,
  `head_title` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `is_visible` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  UNIQUE KEY `indent` (`ident`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `article`
--

INSERT INTO `article` (`id_article`, `id_category`, `title`, `ident`, `preview`, `full_text`, `head_title`, `meta_keywords`, `meta_description`, `is_visible`, `created`) VALUES
(1, 1, 'NISSAN HOLDS 112TH ORDINARY GENERAL MEETING OF SHAREHOLDERS', 'nissan-holds-112th-ordinary-general-meeting-of-shareholders', 'Nissan Motor Co., Ltd., today held its 112th Ordinary General Meeting of Shareholders at the National Convention Hall of Yokohama. The meeting lasted 2 hours 16 minutes, starting from 10:00 JST and concluding at 12:16 JST. A total of 1005 shareholders attended the meeting.\r\n\r\nThe shareholders'' meeting included an overview of the company''s new six-year business plan called "Nissan Power 88." The key contents of the plan focus on developing Nissan''s leadership and profitability in global growth markets; actively cultivating sustainable mobility through zero-emission cars and technologies that reduce emissions; and advancing "mobility for all" by offering attractive, competitive products to make personal mobility accessible for people worldwide.', 'Nissan Motor Co., Ltd., today held its 112th Ordinary General Meeting of Shareholders at the National Convention Hall of Yokohama. The meeting lasted 2 hours 16 minutes, starting from 10:00 JST and concluding at 12:16 JST. A total of 1005 shareholders attended the meeting.\r\n\r\nThe shareholders'' meeting included an overview of the company''s new six-year business plan called "Nissan Power 88." The key contents of the plan focus on developing Nissan''s leadership and profitability in global growth markets; actively cultivating sustainable mobility through zero-emission cars and technologies that reduce emissions; and advancing "mobility for all" by offering attractive, competitive products to make personal mobility accessible for people worldwide.\r\n\r\nChief Operating Officer Toshiyuki Shiga reported on the company''s sales and financial performance from fiscal year 2010 and its outlook for fiscal year 2011. Nissan President and CEO Carlos Ghosn confirmed the company''s plan to distribute a sustainable, attractive dividend over the course of the midterm plan, with a dividend of 20 yen per share for fiscal year 2011 and a targeted minimum payout ratio of 25% of net income beyond fiscal 2011 and through fiscal 2016.\r\n\r\nGhosn and the members of Nissan''s Executive Committee responded to questions submitted by shareholders who attended the meeting and who supplied questions in advance.\r\n\r\nThree items were proposed to the shareholders for approval:\r\nthe approval of appropriation of retained earnings for the 112th fiscal year;\r\ndelegation to the board of directors to determine the terms and conditions of issuing Shinkabu-Yoyakuken (share options) without consideration to employees of the company and directors and employees of its affiliates; and\r\nthe election of nine directors due to the expiration of terms of all directors.\r\nAll items were approved by the shareholders as presented.\r\n\r\nIn place of the annual reception party for shareholders at the conclusion of the meeting, the company made a donation to relief efforts benefiting victims of the March 11 earthquake and tsunami in Japan. The donation was made in the name of all Nissan shareholders.\r\n\r\nAbout Nissan\r\nNissan Motor Co., Ltd., Japan''s second-largest automotive company, is headquartered in Yokohama, Japan, and is part of the Renault-Nissan Alliance. Operating with more than 248,000 employees globally, Nissan provided customers with more than 4.1 million vehicles in 2010, generating revenue of 8.77 trillion yen ($102.37 billion US). With a strong commitment to developing exciting and innovative products for all, Nissan delivers a comprehensive range of 64 models under the Nissan and Infiniti brands. A pioneer in zero-emission mobility, Nissan made history with the introduction of the Nissan LEAF, the first affordable, mass-market, pure-electric vehicle and winner of numerous international accolades, including the prestigious 2011 European Car of the Year award and 2011 World Car of the Year.', 'NISSAN HOLDS 112TH ORDINARY GENERAL MEETING OF SHAREHOLDERS', 'NISSAN HOLDS 112TH ORDINARY GENERAL MEETING OF SHAREHOLDERS', 'NISSAN HOLDS 112TH ORDINARY GENERAL MEETING OF SHAREHOLDERS', 1, '2011-07-02 19:01:33'),
(2, 1, 'NISSAN DONATES FIVE NEW VEHICLES TO NASHVILLE ZOO', 'nissan-donates-five-new-vehicles-to-nashville-zoo', 'Today, Nashville Zoo received the keys to four Nissan Titan trucks and one Armada generously donated by Nissan Americas. The vehicles will assist the Zoo’s ongoing operations and education programs.\r\n\r\n“We rely heavily on trucks to move equipment, supplies and materials not only throughout our 188-acre property but also to and from destinations around Middle Tennessee,” says Zoo President Rick Schwartz. “These vehicles will significantly help to keep the Zoo running smoothly, and all of us here are very appreciative of Nissan’s support.”\r\n\r\nThe donated Armada will be used for Nashville Zoo’s “Wildlife on Wheels” program. Serving more than 18,000 students every year, this outreach program brings animals and educational programming to schools, day cares, hospitals and other organizations that may not have the ability to visit the Zoo.', '\r\nToday, Nashville Zoo received the keys to four Nissan Titan trucks and one Armada generously donated by Nissan Americas. The vehicles will assist the Zoo’s ongoing operations and education programs.\r\n\r\n“We rely heavily on trucks to move equipment, supplies and materials not only throughout our 188-acre property but also to and from destinations around Middle Tennessee,” says Zoo President Rick Schwartz. “These vehicles will significantly help to keep the Zoo running smoothly, and all of us here are very appreciative of Nissan’s support.”\r\n\r\nThe donated Armada will be used for Nashville Zoo’s “Wildlife on Wheels” program. Serving more than 18,000 students every year, this outreach program brings animals and educational programming to schools, day cares, hospitals and other organizations that may not have the ability to visit the Zoo.\r\n\r\n"The Nashville Zoo offers Middle Tennessee’s children and families a place to have fun while learning about our environment and the creatures that live in it," said Bill Krueger, vice chairman, Nissan Americas. "Through the donation of the Titan trucks and Armada, we are pleased to help support the zoo in its valuable mission and make a positive contribution to the local community."\r\n\r\nSince 2004, Nissan has donated a total of 10 vehicles to Nashville Zoo. In the Americas, Nissan''s operations include automotive styling, engineering, consumer and corporate financing, sales and marketing, distribution and manufacturing. Nissan is dedicated to improving the environment under the Nissan Green Program and was recognized as an ENERGY STAR® Partner of the Year by the U.S. Environmental Protection Agency in 2010 and 2011. More information on Nissan in North America, the Nissan LEAF and zero emissions can be found at www.nissanusa.com. \r\n\r\nNashville Zoo is accredited by the prestigious Association of Zoos and Aquariums assuring the highest standards of animal care and husbandry. The Zoo is a non-profit organization located at 3777 Nolensville Pike and is open every day except Thanksgiving, Christmas and New Year’s Day. The mission of Nashville Zoo is to inspire a culture of understanding and discovery of our natural world through conservation, innovation, and leadership. For more information about Nashville Zoo, please call 833-1534 or visit our website at www.nashvillezoo.org.', 'NISSAN DONATES FIVE NEW VEHICLES TO NASHVILLE ZOO', 'NISSAN DONATES FIVE NEW VEHICLES TO NASHVILLE ZOO', 'NISSAN DONATES FIVE NEW VEHICLES TO NASHVILLE ZOO', 1, '2011-07-02 19:02:04'),
(3, 1, 'THE 2012 INFINITI LINEUP: CHARTING THE CHANGES', 'the-2012-infiniti-lineup-charting-the-changes', 'Following the 2011 introduction of two next-generation redesigns, the Infiniti M and Infiniti QX, and two highly significant model line extensions in the form of the Infiniti G25 Sedan and Infiniti M Hybrid, the Infiniti lineup enters the 2012 model year with a number of product enhancements – led by a refreshed front exterior design for the Infiniti FX. ', '\r\nFollowing the 2011 introduction of two next-generation redesigns, the Infiniti M and Infiniti QX, and two highly significant model line extensions in the form of the Infiniti G25 Sedan and Infiniti M Hybrid, the Infiniti lineup enters the 2012 model year with a number of product enhancements – led by a refreshed front exterior design for the Infiniti FX. Key changes to the 2012 Infiniti lineup include, but are not limited to, the following:\r\nInfiniti M – All-new360-horsepower, 32-mpg M Hybrid. Enhancements to the rest of the Infiniti M line include a new 18-inch Wheel Package, the combining of the previous M56 Sport and Sport Touring Packages into a single Sport Package, and the availability of the Graphite interior for models equipped with the Deluxe Touring Package. Available now.\r\n \r\nInfiniti G Sedan – Content refinements to the Limited Edition and Sport Appearance Edition. The G37 Limited Edition adds a new Graphite interior color (replaces the previous Monaco Red interior), a Black Obsidian exterior color and dark-finish 18-inch aluminum-alloy wheels. The G37 Sport Appearance Edition model changes include a new Midnight Black grille. Other 2012 refinements include one new exterior color, Malbec Black. Available September 2011.\r\n \r\nInfiniti G Coupe – No major refinements for the new model year. Available September 2011.\r\n \r\nInfiniti G Convertible – Changes include the addition of a standard spare tire (replacing the previous repair kit). In addition, the previous Limited Edition package is no longer available. Available September 2011.\r\n \r\nInfiniti QX – Enhancements include the addition of Blind Spot Intervention™ to the Technology Package, the addition of the Bose® Cabin Surround® sound system with 15 speakers (two additional for 2012) to the Deluxe Touring Package, the addition of heated second row seats and remote tip-up second row seats to the Theater Package (from the Deluxe Touring Package) and the addition of headlight washers to QX56 2WD models with Deluxe Touring Package. The 22-inch Wheel Package (introduced in late 2011) carries over to 2012. Available August2011.\r\n \r\nInfiniti FX – Revised front grille and front fascia design, revised meter illumination, standard heated front seats on all models and the addition of a new “Limited Edition” for the FX35 AWD. The Limited Edition includes an extensive list of special features, starting with an exclusive Iridium Blue exterior color, 21-inch 10-spoke dark finish aluminum-alloy turbine wheels, Infiniti Hard Drive Navigation System, and Around View® Monitor. Other 2012 Infiniti FX enhancements include a new exterior color, Graphite Shadow (replaces Platinum Graphite), a new 20-inch wheel design for the FX35 Deluxe Touring Package, the addition of Adaptive Front lighting System (AFS) to the FX50 Sport Package, and a shift of the quilted leather climate-controlled front seats to the FX35 Deluxe Touring Package from the Premium Package. Available October 2011.\r\nInfiniti EX – Enhancements for the new model year include the addition of HomeLink® Universal Transceiver as standard equipment on the EX35 Journey (previously part of the Deluxe Touring Package). Available September 2011.\r\n \r\nInfiniti JX – The all-new Infiniti JX 7-passenger luxury crossover is set to be previewed at the 2011 Pebble Beach Concours d’Elegance, prior to its global debut at the upcoming Los Angeles Auto Show in readiness for a spring 2012 introduction as a 2013 model. The new Infiniti JX is designed to push the boundaries of what a luxury crossover can be – with signature styling cues of the brand, such as dynamic and elegant line treatments inspired by nature. It will feature a stunning interior, while offering exceptional seating flexibility, easy access to the roomy 3rd row, plus the latest in-vehicle technology – including advanced telematics. More details will be released as they become available.\r\nFollowing is a more detailed overview of Infiniti products for the 2012 model year:\r\n\r\n2012 Infiniti M\r\nLaunched in spring 2011 in conjunction with the arrival of the new 2012 Infiniti M Hybrid, the Infiniti M is a showcase for Infiniti’s advanced, user-focused technologies, including:\r\nInfiniti Drive Mode Selector, a four-mode driver-selectable control of throttle and transmission mapping that helps optimize vehicle performance.\r\nActive Noise Control, which reduces undesirable engine harmonics, providing a quieter cabin.\r\nBlind Spot Warning (BSW), which helps alert the driver if another vehicle is detected in the blind spot area; Blind Spot Intervention™ (BSI), a world’s first system that, in addition to the Blind Spot Warning, helps the driver return the vehicle back toward the center of the lane of travel.\r\nForest Air™ system, which helps reduce the intrusion of unpleasant odors into the cabin and provides natural “breeze-like” airflow.\r\nEco Pedal, which provides driver feedback to encourage eco-driving behavior\r\nActive Trace Control, which adjusts engine torque and the control of braking at each of the four wheels to help enhance cornering performance.\r\nThe 2012 M also offers a next-generation Infiniti Hard Drive Navigation System, Bose® Studio Surround® premium audio system, Intelligent Cruise Control (Full-Speed Range), Lane Departure Warning (LDW) and Lane Departure Prevention (LDP) systems, Distance Control Assist (DCA), Intelligent Brake Assist (IBA) with Forward Collision Warning (FCW) and Front Pre-Crash Seat Belts.\r\n\r\nThe M’s dramatic, sports styling provides a coefficient of drag of just 0.27 Cd (0.26 for M Hybrid), while the roomy, comfortable interior environment features standard leather-appointed seating, standard Japanese Ash wood trim or available silver powdered genuine White Ash wood trim and available premium audio and climate control systems. Key standard features include Infiniti Intelligent Key with Push Button Ignition, XM® Satellite Radio (XM® subscription required, sold separately), Bluetooth® Hands-free Phone System and power sliding glass tinted moonroof.\r\n\r\nAs Infiniti’s first-ever hybrid, the 2012 Infiniti Hybrid delivers V8 performance with 4-cylinder fuel efficiency. Powered by the Infiniti Direct Response Hybrid™ System, the Infiniti M Hybrid is the first V6 true luxury performance “driver’s” hybrid – and the only such vehicle to offer more than 350 horsepower (360 net horsepower) and 32 mpg fuel economy. Estimated fuel economy is 27 mpg City, 32 mpg Highway, with Combined fuel economy rated at 29 mpg. \r\n\r\nIn addition to the M Hybrid, the 2012 Infiniti M is available in M37 and M56 model designations, with rear-wheel drive or Infiniti’s Intelligent All-Wheel Drive system. The M37 features a 330-horsepower 3.7-liter V6 engine, while the M56 offers a 420-horsepower 5.6-liter V8. Both engines feature Infiniti’s advanced VVEL (Variable Valve Event & Lift) system and all models are equipped with a standard 7-speed automatic transmission. A special Sport Package, offered on rear-wheel drive models, offers 4-Wheel Active Steer (4WAS), sport-tuned suspension, Sport Brakes and 20-inch wheels and tires.\r\n\r\nEnhancements for the 2012 model (non-Hybrid) include the addition of a new 18-inch Wheel Package, the combining of the previous M56 Sport and Sport Touring Packages into a single Sport Package, and the availability of the Graphite interior for models equipped with the Deluxe Touring Package (a total of four interior colors – Stone, Java, Wheat and Graphite – are offered depending on model).\r\n\r\nThe 2012 Infiniti M is available in five models: M37 RWD, M37x AWD, M56 RWD, M56x AWD and M35h RWD with 3.5-liter Direct Response Hybrid™ System. It is on sale now at Infiniti retailers nationwide.\r\n\r\n2012 INFINITI G LINE\r\nFor 2012, the popular Infiniti G once again is offered in three body configurations – G Sedan, G Coupe and G Convertible, each powered by a proven 3.7-liter V6. In addition, the G Sedan is available with a 2.5-liter V6 (designated the G25 Sedan). Full information on each follows.\r\n\r\n2012 Infiniti G Sedan\r\nFollowing the 2011 introduction of new “Limited Edition” and “Sport Appearance Edition” with special content features – and the 2.5-liter V6 equipped Infiniti G25 Sedan – the major enhancements for the 2012 model year focus on content refinements to the Limited Edition and Sport Appearance Edition.\r\n\r\nThe G37 Limited Edition adds a new Graphite interior color (replaces the previous Monaco Red interior), a Black Obsidian exterior color and dark-finish 18-inch aluminum-alloy wheels. The G37 Sport Appearance Edition model changes include a new Midnight Black grille. Other 2012 refinements include one new exterior color, Malbec Black, for all models (excluding G25, Limited Edition and Sport Appearance Edition). \r\n\r\nKey highlights of the 2012 Infiniti G Sedan include:\r\nThe Infiniti G25 Sedan shares the same dynamic exterior, interior and chassis as the G37, but with a smaller displacement engine. The 2.5-liter DOHC 24-valve V6 produces 218 horsepower and 187 lb-ft of torque. The G25 Sedan comes with a standard 7-speed automatic transmission and is available in both rear-wheel drive and intelligent all-wheel drive.\r\nThe Infiniti G37 Sedan features a 328-horsepower 3.7-liter “VVEL” V6 and choice of 7-speed automatic or 6-speed manual transmissions, along with available sport brakes and 18-inch wheels (Sport Package).\r\nEvery 2012 G Sedan offers the proven FM (Front Mid-ship) platform featuring a 4-wheel independent suspension with lightweight aluminum components– to provide responsive acceleration and agile handling. The G Sedan AWD models add Infiniti’s “intelligent” ATTESA E-TS? all-wheel drive system.\r\nAll 2012 G models continue to offer a strikingly seductive exterior, defined by its sleek wave-form hood, signature G-style taillights and raked A-pillars and athletic stance.\r\nInside, the G Sedan provides a crafted, heritage-inspired interior environment and luxury features such as standard leather-appointed seating and an available audiophile-quality Infiniti Studio on Wheels? by Bose?.\r\nAdvanced technologies include Intelligent Key with Push Button Ignition and available RearView Monitor; a touch screen Infiniti Navigation System with XM NavTraffic® real-time traffic information (XM® subscription required, sold separately); and Intelligent Cruise Control with Preview Braking.\r\nThe 2012 Infiniti G Sedan is offered in 10 well-equipped versions: G25 Sedan, G25 Sedan Journey, G25x Sedan AWD, G37 Sedan Journey, G37x Sedan AWD, G37 Sedan Sport 6MT, G37 Sedan Sport Appearance Edition, G37x Sedan AWD Sport Appearance Edition, G37 Sedan Limited Edition and G37x Sedan AWD Limited Edition. It goes on sale in September 2011. \r\n\r\n2012 Infiniti G37 Coupe\r\nFor 2012, the G Coupe is again available in both rear-wheel and all-wheel drive and comes equipped with a standard 3.7-liter VQ-series V6 with VVEL (for Variable Valve Event and Lift) rated at 330 horsepower and 270 lb-ft of torque. The engine is backed by a choice of an electronically controlled 7-speed automatic transmission with available magnesium paddle shifters or a 6-speed manual. There are no major refinements for the new model year.\r\n\r\nAlso offered is the limited production IPL (Infiniti Performance Line) G Coupe, which was introduced in 2011. The IPL G Coupe’s advanced VQ37HR 3.7-liter V6 engine generates 348 horsepower – an increase of 18 horsepower over the non-IPL models – and 276 lb-ft of torque (+6 lb-ft). \r\n\r\nThe IPL G Coupe’s unique exterior includes a dramatic front and rear bumper/fascia design with integrated fog lights and black finishers, sculpted side sills, rear spoiler and chrome exhaust tips and exclusive 19-inch IPL split 7-spoke graphite-finish wheels and low-profile W-rated Bridgestone Potenza RE50A performance tires. The IPL G Coupe is offered in just two exterior colors: Graphite Shadow and Malbec Black.\r\n\r\nKey highlights of the 2012 Infiniti G Coupe include:\r\nDynamic exterior design, featuring seductive and muscular shapes, including flowing front fender lines with low silhouette roofline, strong side character lines and side sills, wave-form hood.\r\nAggressive front end aerodynamics and styling with smooth front fascia, integrated fog lamps and double-arch grille.\r\nInfiniti signature L-shape High Intensity Discharge (HID) bi-functional xenon headlights and large LED Infiniti G-style taillights, large trunk opening and integrated RearView Monitor camera (standard on all models except G37 Coupe base).\r\nInside, the G37 Coupe blends unique materials and finishes with traditional Japanese design cues. Interior features include a predominately white color scheme for the gauges and LCD instrument display, “Shodo” aluminum trim inspired by the traditional art of Japanese calligraphy and available high-gloss Maple accents.\r\nThe G37 Coupe also includes an extensive list of available technology features, including a touch screen navigation system with XM NavTraffic® Real-Time Traffic information (XM® subscription required, sold separately), RearView Monitor and an available 11-speaker Infiniti Studio on Wheels® by Bose® audio system.\r\nThe complete lineup of 2012 G Coupes now stands at six exciting models: Infiniti G37 Coupe, Infiniti G37 Coupe Journey, Infiniti G37x Coupe AWD, Infiniti G37 Coupe Sport 6MT, Infiniti IPL G Coupe and Infiniti IPL G Coupe 6MT. The 2012 Infiniti G37 Coupe goes on sale in September 2011. \r\n\r\n2012 Infiniti G37 Convertible\r\nNow in its fourth year of production, the 2012 Infiniti G Convertible again features athletic, well-proportioned coupe-like styling (with the top raised), flowing front fenders, wave-like hood, signature Infiniti double-arch grille. Its exclusive body structure for open-top use includes unique panels from A-pillar rearward (compared to the G Coupe) and an exclusive three-piece power retractable hardtop with one-button operation. \r\n\r\nModifications compared to the G Coupe include a wider rear track, modified rear suspension and a special convertible-focused interior with rear Pop-up Roll Bars and available Bose® front seat Personal Speakers and available climate-controlled front seats. For 2012, the previous Limited Edition package is no longer available. Other changes include the addition of a standard spare tire (replacing the previous repair kit).\r\n\r\nKey highlights of the 2012 Infiniti G Convertible include:\r\nStandard leather-appointed seating and an available Bose® Open Air Sound System that dynamically changes equalization based on outside noise, vehicle speed, and top position, and an adaptive climate control system that adjusts fan speed in accordance to top position and vehicle speed.\r\nTechnology features include standard RearView Monitor and available Pre-Crash Seat Belts and Intelligent Cruise Control (ICC). The G’s available Infiniti Navigation System includes XM NavTraffic® Real-Time Traffic Information, NavWeather™ with Real-Time Weather and 3-day forecast (XM® subscription required, sold separately), Streaming Audio via Bluetooth® and Zagat Survey® Restaurant Guide. The system also features a touch screen and Voice Recognition.\r\nEvery 2012 G Convertible comes equipped with a standard 3.7-liter VQ-series V6 with VVEL (for Variable Valve Event and Lift) rated at 325 horsepower. The engine is backed by a choice of an electronically controlled 7-speed automatic transmission with available solid magnesium paddle shifters or a responsive close-ratio 6-speed manual transmission.\r\nThe G37 Convertible Sport 6MT adds sport-tuned steering and larger sport brakes, along with 19-inch aluminum-alloy wheels and W-rated performance tires.\r\nThe 2012 G37 Convertible is available in G37 Convertible and G37 Convertible Sport 6MT models. It is scheduled to go on sale in September 2011. \r\n\r\n2012 Infiniti QX\r\nFollowing its total redesign for 2011, the Infiniti QX has experienced record sales and strong media and consumer reviews. Featuring an all-new platform versus the previous generation QX – along with a new exterior and interior – the Infiniti QX is designed to attract and hold viewers’ attention, conveying its underlying sense of power and strength. The styling is dynamic, its size capable of transporting up to eight adults and their belongings with spacious elegance, and its drivetrain rugged enough to handle tasks such as towing boats or trailers (8,500-pound towing capacity, when properly equipped), while also offering 14% better fuel economy (EPA Combined) than the previous generation QX. \r\n\r\nEnhancements for the 2012 model year include the addition of Blind Spot Intervention™ to the Technology Package, the addition of the Bose® Cabin Surround® sound system with 15 speakers (two additional for 2012) to the Deluxe Touring Package, the addition of heated second row seats and remote tip-up second row seats to the Theater Package (from the Deluxe Touring Package) and the addition of headlight washers to the QX56 2WD Deluxe Touring Package. In addition, the 22-inch Wheel Package (introduced in late 2011) carries over to 2012.\r\n\r\nKey highlights of the 2012 Infiniti QX include:\r\nA high-stiffness frame structure that enhances ride comfort while reducing noise, vibration and harshness.\r\nA standard 5.6-liter V8 engine that combines the responsive acceleration of Infiniti’s VVEL (Variable Valve Event & Lift) technology with the efficiency of Direct Injection Gasoline (DIG™) and 7-speed automatic transmission – rated at 400 horsepower and 413 lbs-ft of torque.\r\nAn interior that is long on luxury and comfort, including standard Infiniti Hard Drive Navigation System, Around View™ Monitor, Bose® 13-speaker Premium Audio System, available perforated semi-aniline leather-appointed seating and an available Theater Package with dual 7-inch color monitors, which allows different sources to be played at the same time.\r\nThe 2012 QX is offered in two fully equipped models – Infiniti QX56 2WD and Infiniti QX56 4WD. It is scheduled to go on sale in August 2011. \r\n\r\n2012 Infiniti FX\r\nThe Infiniti FX, Infiniti’s iconic performance crossover, enters the 2012 model year with big news – a revised front grille and front fascia design, revised meter illumination, standard heated front seats on all models and the addition of the new Limited Edition FX35 AWD model. \r\n\r\nThe 2012 FX Limited Edition includes an extensive list of special features, starting with an exclusive Iridium Blue exterior color, 21-inch 10-spoke dark finish aluminum-alloy wheels, dark tinted headlights and roof rail crossbars, aluminum pedal accents, Infiniti Hard Drive Navigation System, Around View® Monitor, Graphite interior with unique blue piping on the floor mats and more.\r\n\r\nOther 2012 enhancements include a new exterior color, Graphite Shadow (replaces Platinum Graphite), a new 20-inch wheel design for the FX35 Deluxe Touring Package, the addition of Adaptive Front lighting System (AFS) to the FX50 Sport Package, and a shift of the quilted leather climate-controlled front seats to the FX35 Deluxe Touring Package from the Premium Package.\r\n\r\nKey highlights of the 2012 Infiniti FX include:\r\nAvailable with a choice of a 390-horsepower 5.0-liter 32-valve DOHC V8 engine with VVEL (Variable Valve Event & Lift) or with a 303-horsepower 3.5-liter 24-valve DOHC V6.\r\nBoth engines are paired with a standard 7-speed automatic transmission featuring Adaptive Shift Control (ASC) and available solid magnesium paddle shifters.\r\nAvailable Intelligent All-Wheel Drive (standard on FX50), double-wishbone front/multi-link rear suspension and large 4-wheel disc brakes, along with available Continuous Damping Control (CDC)®, Rear Active Steer, Intelligent Brake Assist and 6-spoke 21-inch super lightweight aluminum-alloy wheels (FX50 Deluxe Touring Package).\r\nA warm, modern, inviting environment highlighted by a driver-oriented cockpit with intuitive controls, available sport seating and advanced audio, navigation and technology ranging from an 11-speaker Bose®-developed audio system to Infiniti Intelligent Key, available Intelligent Cruise Control (Full-Speed Range) and available Around View™ Monitor system.\r\nThe 2012 FX is available in three models: FX50 AWD with 5.0-liter V8, FX35 AWD with 3.5-liter V6 and FX35 RWD with 3.5-liter V6. It goes on sale in October 2011. \r\n\r\n2012 Infiniti EX\r\nThe Infiniti EX35 combines a sleek, sculpted, elegant skin, exhilarating driving performance and an engaging interior environment. Enhancements for the new model year include the addition of HomeLink® Universal Transceiver as standard equipment on the EX35 Journey (previously part of the Deluxe Touring Package).\r\n\r\nKey highlights of the 2012 Infiniti EX include:\r\nStandard advanced 297-horsepower 3.5-liter V6 engine and 7-speed automatic transmission.\r\nAvailable Intelligent All-Wheel Drive.\r\nStandard 18-inch aluminum-alloy wheels, available 19-inch wheels and tires (Deluxe Touring Package).\r\nAvailable Blind Spot Warning (BSW) system.\r\nAvailable Around View™ Monitor utilizes four small cameras located front, side and rear to give the driver a “top-down view” of the outside of the vehicle and help reduce blind spots when parking.\r\nOther driving aids include available Lane Departure Prevention system (LDP), Intelligent Cruise Control, Distance Control Assist (DCA) and Intelligent Brake Assist (IBA) with Forward Collision Warning.\r\nA long list of other available features, including standard leather-appointed seating and RearView Monitor, and available driver’s seat headrest coat hanger, advanced audio systems and power up-folding 2nd row seat.\r\n\r\nThe 2012 Infiniti EX is available in four models: EX35 RWD, EX35 AWD, EX35 RWD Journey and EX35 AWD Journey. It goes on sale in September 2011. ', 'THE 2012 INFINITI LINEUP: CHARTING THE CHANGES', 'THE 2012 INFINITI LINEUP: CHARTING THE CHANGES', 'THE 2012 INFINITI LINEUP: CHARTING THE CHANGES', 1, '2011-07-02 19:02:55');

-- --------------------------------------------------------

--
-- Структура таблицы `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `head_title` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `static_block` text,
  `is_left_menu` tinyint(4) DEFAULT '0',
  `is_visible` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `ident` (`ident`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `article_category`
--

INSERT INTO `article_category` (`id_category`, `title`, `ident`, `head_title`, `meta_keywords`, `meta_description`, `static_block`, `is_left_menu`, `is_visible`) VALUES
(1, 'Новости', 'news', 'Новости', 'Новости', 'Новости', '', 0, 1),
(2, 'Статьи', 'articles', 'Статьи', 'Статьи', 'Статьи', '', 0, 1),
(9, 'Nissan qashqai', 'nissan-qashqai', 'Nissan qashqai', 'Nissan qashqai', 'Nissan qashqai', 'Nissan qashqai', 1, 1),
(10, 'Nissan almera', 'nissan-almera', 'Nissan Almera', 'Nissan almera', 'Nissan almera', 'Nissan almera', 1, 1),
(11, 'Nissan xtrail', 'nissan-xtrail', 'Nissan xtrail', 'Nissan xtrail', 'Nissan xtrail', 'Nissan xtrail', 1, 1),
(12, 'Nissan primera', 'nissan-primera', 'Nissan primera', 'Nissan primera', 'Nissan primera', 'Nissan primera', 1, 1),
(13, 'Nissan micra', 'nissan-micra', 'Nissan micra', 'Nissan micra', 'Nissan micra', 'Nissan micra', 1, 1),
(14, 'Nissan GT-R', 'nissan-gt-r', 'Nissan GT-R', 'Nissan GT-R', 'Nissan GT-R', 'Nissan GT-R', 1, 1),
(15, 'Nissan maxima', 'nissan-maxima', 'Nissan maxima', 'Nissan maxima', 'Nissan maxima', 'Nissan maxima', 1, 1),
(16, 'Nissan juke', 'nissan-juke', 'Nissan juke', 'Nissan juke', 'Nissan juke', 'Nissan juke', 1, 1),
(17, 'Nissan versa', 'nissan-versa', 'Nissan versa', 'Nissan versa', 'Nissan versa', 'Nissan versa', 1, 1),
(18, 'Nissan patrol', 'nissan-patrol', 'Nissan patrol', 'Nissan patrol', 'Nissan patrol', 'Nissan patrol', 1, 1);
