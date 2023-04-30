-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 30. 17:47
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gorillago`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `restaurantId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `description`, `url`, `restaurantId`) VALUES
(1, 'Margarita', 850, 'asd', 'https://cdn.discordapp.com/attachments/355709434166640640/1097181487876542615/image.png', 1),
(2, 'Gyrosos pizza (32cm)', 3090, 'pizzaszósz, fűszeres gyroshús, lila hagyma, mozzarella sajt', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466024718631015/Kepernyofoto_2023-04-28_-_13.12.26.png', 1),
(3, 'Laci kedvence', 3090, 'pizzaszósz, bolognai ragu, lila hagyma, mozzarella sajt ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466446464290866/Kepernyofoto_2023-04-28_-_13.13.44.png', 1),
(4, 'Sonka-Gomba-Kukorica pizza (32cm)', 2500, 'pizzaszósz, sonka, gomba, kukorica, mozzarella sajt', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466446724345897/Kepernyofoto_2023-04-28_-_13.13.39.png', 1),
(5, 'Bolognai pizza (32cm)\r\n', 2700, 'pizzaszósz, bolognai ragu, paradicsomkarika, mozzarella sajt', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466446934052904/Kepernyofoto_2023-04-28_-_13.13.31.png', 1),
(6, 'Bugaci pizza (32cm)', 2800, 'mozzarella sajt, csirkemájragu', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466445503803493/Kepernyofoto_2023-04-28_-_13.13.49.png', 1),
(7, 'Carbonara pizza (32cm)', 3090, 'carbonara alap, sonka, fokhagyma, oregánó, mozzarella sajt', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466444971130880/Kepernyofoto_2023-04-28_-_13.13.54.png', 1),
(8, 'Florida pizza (32cm)', 3090, 'mustáros, tejfölös alap, sonka, lila hagyma, mozzarella sajt', 'https://cdn.discordapp.com/attachments/355709434166640640/1101466444664934470/Kepernyofoto_2023-04-28_-_13.14.08.png', 1),
(9, 'Hawaii pizza (32cm)', 3090, 'pizzaszósz, mozzarella sajt, sonka, ananász', 'https://cdn.discordapp.com/attachments/355709434166640640/1101468618711126056/Kepernyofoto_2023-04-28_-_13.22.57.png', 1),
(10, 'Négysajtos Burger', 2890, '180g marhahúspogácsa, gouda, cheddar, gorgonzola, és ír vörös cheddar sajt, kevert saláta, paradicsom, aioli szósz', 'https://cdn.discordapp.com/attachments/355709434166640640/1101469671435288596/Kepernyofoto_2023-04-28_-_13.27.08.png', 2),
(11, 'Hamburger', 2190, '180g marhahúspogácsa, ketchup, angol mustár, majonéz, lila hagyma, savanyú uborka, paradicsom, jégsaláta, tejmentes', 'https://cdn.discordapp.com/attachments/355709434166640640/1101471507928068155/Kepernyofoto_2023-04-28_-_13.33.41.png', 2),
(12, 'Hamburger menüben édesburgonyával', 3680, '180g marhahúspogácsa, ketchup, angol mustár, majonéz, lila hagyma, savanyú uborka, paradicsom, jégsaláta, édesburgonya, tejmentes (Kérlek, válassz hozzá üdítőt!)', 'https://cdn.discordapp.com/attachments/355709434166640640/1101471507659636776/Kepernyofoto_2023-04-28_-_13.33.49.png', 2),
(13, 'Sajtburger', 2390, '180g húspogácsa, dupla szelet vörös cheddar sajt, ketchup, angol mustár, majonéz, lila hagyma, savanyú uborka, paradicsom, jégsaláta', 'https://cdn.discordapp.com/attachments/355709434166640640/1101471507395399721/Kepernyofoto_2023-04-28_-_13.33.57.png', 2),
(14, 'Dupla Hamburger', 2990, 'dupla marhahúspogácsa (360g), ketchup, angol mustár, majonéz, lila hagyma, savanyú uborka, paradicsom, jégsaláta, tejmentes', 'https://cdn.discordapp.com/attachments/355709434166640640/1101471507152121928/Kepernyofoto_2023-04-28_-_13.34.10.png', 2),
(15, 'Dupla sajtburger menüben hasábburgonyával', 4480, 'dupla marhahúspogácsa (360g), 4 szelet ír vörös cheddar sajt, ketchup, angol mustár, majonéz, lila hagyma, savanyú uborka, paradicsom, jégsaláta, hasábburgonya', 'https://cdn.discordapp.com/attachments/355709434166640640/1101474055191801907/Kepernyofoto_2023-04-28_-_13.44.33.png', 2),
(16, 'Bárányburger', 2890, '180g bárányhúspogácsa, majonéz, angol mustár, lila hagyma, savanyú uborka, paradicsom, kevert saláta, jégsaláta, tejmentes', 'https://cdn.discordapp.com/attachments/355709434166640640/1101474324482895882/Kepernyofoto_2023-04-28_-_13.45.01.png', 2),
(17, 'Bárányburger menüben hasábburgonyával', 3980, '180g bárányhúspogácsa, majonéz, angol mustár, lila hagyma, savanyú uborka, paradicsom, kevert saláta, jégsaláta, hasábburgonya, tejmentes', 'https://cdn.discordapp.com/attachments/355709434166640640/1101474324218642442/Kepernyofoto_2023-04-28_-_13.45.06.png', 2),
(18, 'Lazacburger', 2890, '125g lazacpogácsa, fokhagymás majonéz, paradicsom, lila hagyma, kevert saláta, jégsaláta, tejmentes', 'https://cdn.discordapp.com/attachments/355709434166640640/1101474323920867328/Kepernyofoto_2023-04-28_-_13.45.16.png', 2),
(19, 'Avokádó maki (6db)', 1450, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476249240613015/Kepernyofoto_2023-04-28_-_13.52.04.png', 3),
(20, 'Füstölt lazac maki (6db)', 1680, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476249018302514/Kepernyofoto_2023-04-28_-_13.52.09.png', 3),
(21, 'Füstölt tofu maki (6db)', 1350, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476248733110312/Kepernyofoto_2023-04-28_-_13.52.15.png', 3),
(22, 'Japán omlett maki (6db)', 1350, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476248494026803/Kepernyofoto_2023-04-28_-_13.52.22.png', 3),
(23, 'Lazac krémsajt maki (6db)', 1680, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476248280105012/Kepernyofoto_2023-04-28_-_13.52.25.png', 3),
(24, 'Lazac maki (6db)', 1580, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476248057827378/Kepernyofoto_2023-04-28_-_13.52.31.png', 3),
(25, 'Pácolt japán retek maki (6db)', 1350, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476247768412221/Kepernyofoto_2023-04-28_-_13.52.45.png', 3),
(26, 'Pácolt tök maki (6db)', 1350, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476247483207720/Kepernyofoto_2023-04-28_-_13.52.48.png', 3),
(27, 'Ropogós, tempurázott rák maki (6db)', 1650, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101476247231541298/Kepernyofoto_2023-04-28_-_13.52.56.png', 3),
(28, 'Caramel Cream Frappuccino', 1590, 'Frappuccino crème szirup tejjel, karamellízű sziruppal és jéggel összeturmixolva, tetején tejszínhabbal és Caramel Drizzle-lel.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479581048909954/Kepernyofoto_2023-04-28_-_14.05.14.png', 4),
(29, 'Caramel Frappuccino', 1590, 'Karamellízű szirup kávéval és tejjel, jéggel összeturmixolva, tetején tejszínhabbal és karamell sziruppal.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479580734341191/Kepernyofoto_2023-04-28_-_14.05.19.png', 4),
(30, 'Chocolate Chip Cream Frappuccino', 1590, 'Mocha szósz, Frappuccino® csokoládé-darabok kávéízű sziruppal és tejjel, jéggel összeturmixolva, tetején tejszínhabbal és mocha Caramel Drizzle-lel.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479580411363429/Kepernyofoto_2023-04-28_-_14.05.27.png', 4),
(31, 'Chocolate Cream Frappuccino', 1590, 'Krémes mocha szósz tejjel összeturmixolva. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479580059054141/Kepernyofoto_2023-04-28_-_14.05.31.png', 4),
(32, 'Coffee Frappuccino', 1590, 'Frappuccino roast coffee tejjel, jéggel összeturmixolva, tetején tejszínhabbal. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479579677376633/Kepernyofoto_2023-04-28_-_14.05.37.png', 4),
(33, 'Espresso Frappuccino', 1590, 'Kávé ízű szirup espresso shottal és tejjel, jéggel összeturmixolva.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479579421507674/Kepernyofoto_2023-04-28_-_14.05.44.png', 4),
(34, 'Java Chip Frappuccino', 1890, 'Mocha szirup és java chips tejjel, jéggel összeturmixolva, tetején tejszínhabbal. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479579182448671/Kepernyofoto_2023-04-28_-_14.05.50.png', 4),
(35, 'Mocha Frappuccino', 1790, 'Mocha szósz, Frappuccino roast coffee és tej, jéggel összeturmixolva.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479578939162675/Kepernyofoto_2023-04-28_-_14.06.01.png', 4),
(36, 'Strawberries and Cream Frappuccino', 1690, 'Frappuccino crème szirup tejjel, jéggel és epersziruppal összeturmixolva, tetején tejszínhabbal.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101479578624602152/Kepernyofoto_2023-04-28_-_14.06.07.png', 4),
(37, 'Coca-Cola 500 ml', 750, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482907421380608/Kepernyofoto_2023-04-28_-_14.18.42.png', 5),
(38, 'Coca-Cola Zero 500 ml', 750, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482907094220861/Kepernyofoto_2023-04-28_-_14.18.49.png', 5),
(39, 'Coca-Cola 330 ml', 650, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482906796445788/Kepernyofoto_2023-04-28_-_14.18.52.png', 5),
(40, 'Coca-Cola Zero 330 ml', 650, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482906486046831/Kepernyofoto_2023-04-28_-_14.18.56.png', 5),
(41, 'Gyros pitában', 1800, 'csirkehús, jégsaláta, paradicsom, lila káposzta, fehér káposzta, hagyma', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482906142134272/Kepernyofoto_2023-04-28_-_14.19.06.png', 5),
(42, 'Gyros tortillában', 1800, 'csirkehús, jégsaláta, paradicsom, lila káposzta, fehér káposzta, hagyma, joghurtos szósz, csípős szósz', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482905831739432/Kepernyofoto_2023-04-28_-_14.19.11.png', 5),
(43, 'Gyros pitában (csak hússal)', 2000, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482905458442260/Kepernyofoto_2023-04-28_-_14.19.15.png', 5),
(44, 'Falafel pitában', 2500, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482905160650772/Kepernyofoto_2023-04-28_-_14.19.19.png', 5),
(45, 'Nagy gyros tál 0,5l üdítővel, baklavával', 3700, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101482904929959976/Kepernyofoto_2023-04-28_-_14.19.27.png', 5),
(46, 'Maestro Gusto Greg McMenü® Plusz', 3940, 'Marhahúspogácsák (2 db), bacon, ömlesztett cheddar sajtszeletek (2db), savanyú uborka, paradicsom, rukkola saláta mix, hagyma, fokhagymás BBQ szósz, hamburger zsemlében szezámos és mákos szórással. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492318105780327/Kepernyofoto_2023-04-28_-_14.56.05.png', 6),
(47, 'Maestro Honey Holly Sült csirkemellel McMenü', 3940, 'Csirkemellfilé-szelet, érlelt Maasdam sajtszelet, szeletelt paradicsom, rukkola saláta mix, mézes-mustáros szósz, hamburger zsemlében szezámos és mákos szórással.(A McMenüben a köret közepes burgonya. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492317854126121/Kepernyofoto_2023-04-28_-_14.56.08.png', 6),
(48, 'Maestro Honey Helga Sült csirkemellel McMenü', 3580, 'sirkemellfilé-szelet, érlelt Maasdam sajtszelet, szeletelt paradicsom, rukkola saláta mix, jégsaláta, mézes-mustáros szósz, paradicsomos tortilla lapban.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492317669568522/Kepernyofoto_2023-04-28_-_14.56.16.png', 6),
(49, 'Maestro Honey Holly Ropogós csirkemellel McMenü', 3680, 'Íróval pácolt csirkemellfilé, panírozott, elősütött, főtt és gyorsfagyasztott, érlelt Maasdam sajtszelet, szeletelt paradicsom, rukkola saláta mix, mézes-mustáros szósz, hamburger zsemlében szezámos és mákos szórással.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492317417914398/Kepernyofoto_2023-04-28_-_14.56.20.png', 6),
(50, 'BBQ Bob McMenü', 3680, 'Marhahúspogácsák (2 db), bacon, érlelt Maasdam sajtszeletek (2 db), sült hagyma, hagyma, füstös BBQ szósszal, hamburger zsemlében szezámos és mákos szórással. (A McMenüben a köret közepes burgonya.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492317149483008/Kepernyofoto_2023-04-28_-_14.56.24.png', 6),
(51, 'Csirkemell csíkok 3 db McMenü + 1 db  szósz', 2970, 'Pácolt csirkemell csík, panírozott, elősütött, főtt és gyorsfagyasztott + 1 db  szósz. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492316860067841/Kepernyofoto_2023-04-28_-_14.56.27.png', 6),
(52, 'Pinky Burger McMenü', 1950, 'Sertéshúspogácsa, aioli szósz, ömlesztett sajt, paradicsom, saláta, hagyma, hamburger zsemlében.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492316579053619/Kepernyofoto_2023-04-28_-_14.56.33.png', 6),
(53, 'Big Mac McMenü®', 2250, 'Hamburger marhahúspogácsa (2db), ömlesztett cheddar sajt szelet, hagyma darabok, jégsaláta, kapros savanyú uborka, Big Mac szósz, szezámmagos zsemlében. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101492316306427954/Kepernyofoto_2023-04-28_-_14.56.37.png', 6),
(54, 'Dupla Sajtburger McMenü® Plusz', 2240, '2 db marhahúspogácsa zsemlében, 2 db ömlesztett cheddar sajtszelettel, savanyú uborkával, hagymával, ketchuppal és mustárral. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101493894534922240/Kepernyofoto_2023-04-28_-_15.03.25.png', 6),
(55, 'Bacon King', 2940, 'Tapasztald meg, milyen az, amikor a dupla WHOPPER® húspogácsát nem kevesebb, mint 8 (!) szelet bacon és 4 (!) szelet sajt még tovább fokozza, az extrább ízélményt pedig a bacon-majonéz', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494687686217808/Kepernyofoto_2023-04-28_-_15.05.42.png', 7),
(56, 'Chili Cheese Bacon King', 2940, 'Visszatért a kihagyhatatlan szendvics a bacon szerelmeseinek. A fényes zsemlébe kerülő 2 db WHOPPER® húst kiegészítettük 4 szelet olvadós sajttal, plusz 8 ropogós baconnel. ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494687199658114/Kepernyofoto_2023-04-28_-_15.05.46.png', 7),
(57, 'Dupla WHOPPER Sajttal', 2340, 'Két tűzön grillezett marhahússzelet, olvadó Cheddar sajt, friss paradicsomkarikák, uborka, hagyma, ropogós jégsaláta, lágy majonéz és ketchup, pirított, szezámmagos zsemlében.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494686725705748/Kepernyofoto_2023-04-28_-_15.05.51.png', 7),
(58, 'Dupla WHOPPER', 2190, 'Két tűzön grillezett marhahússzelet, friss paradicsomkarikák, hagyma, uborka, ropogós jégsaláta, lágy majonéz és ketchup, pirított, szezámmagos zsemlében. Ez a dupla WHOPPER', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494686369206302/Kepernyofoto_2023-04-28_-_15.05.55.png', 7),
(59, 'WHOPPER Baconnel és Sajttal', 2210, 'A tűzön grillezett marhahúsra olvadó Cheddar sajt, a ropogós bacon, a lágy, krémes majonéz, ketchup, a friss paradicsom, az uborka, a hagyma és a ropogós jégsaláta adja a szendvics ellenálhatatlan ízét.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494685693902908/Kepernyofoto_2023-04-28_-_15.05.59.png', 7),
(60, 'WHOPPER Sajttal', 2040, 'A tűzön grillezett marhahúsra olvadó Cheddar sajt, a lágy, krémes majonéz és ketchup, ropogós uborka, friss paradicsom, hagyma és ropogós jégsaláta adja a szendvics felejthetetlen ízét.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494684766965770/Kepernyofoto_2023-04-28_-_15.06.03.png', 7),
(61, 'WHOPPER', 2000, 'A klasszikus WHOPPER szendvicset a tűzön grillezett marhahús, a ropogós uborkaszeletek, a nap érlelte paradicsom, a friss hagyma, a ropogós jégsalátalevelek, a krémes majonéz és a ketchup teszik felejthetetlenné.', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494684414660709/Kepernyofoto_2023-04-28_-_15.06.09.png', 7),
(62, 'XTRA Long Chili Cheese', 2400, 'Nagy kedvenc xtra változatban! Az xtrákat mindig xtra komolyan vesszük! ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494684074905610/Kepernyofoto_2023-04-28_-_15.06.12.png', 7),
(63, 'Long BIG KING', 2300, 'Nyúúújtsd el az élvezetet! Ami királyi, az tartson is sokáig! ', 'https://cdn.discordapp.com/attachments/355709434166640640/1101494683596771368/Kepernyofoto_2023-04-28_-_15.06.19.png', 7),
(64, 'Csípős marhahús menü （750ml)', 4300, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497199474516008/Kepernyofoto_2023-04-28_-_15.15.45.png', 8),
(65, 'Csípős csirkehús menü (750ml)', 2790, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497199185104986/Kepernyofoto_2023-04-28_-_15.15.48.png', 8),
(66, 'Csípős szezámmagos csirkehús menü (750ml)', 2790, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497198912491550/Kepernyofoto_2023-04-28_-_15.15.52.png', 8),
(67, 'sirkehús ananásszal menü (750ml)', 2290, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497198660821012/Kepernyofoto_2023-04-28_-_15.15.55.png', 8),
(68, 'Csirkehús bambuszrüggyel, gombával menü (750ml)', 2200, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497198417547434/Kepernyofoto_2023-04-28_-_15.15.59.png', 8),
(69, 'Brokkolis-fafülgombás csirkehús menü (750ml)', 2100, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497198136545290/Kepernyofoto_2023-04-28_-_15.16.04.png', 8),
(70, 'Gombás csirkehús menü (750ml)', 2000, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497197838733353/Kepernyofoto_2023-04-28_-_15.16.09.png', 8),
(71, 'Gombás kacsahús menü (750ml)', 1900, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497197570314250/Kepernyofoto_2023-04-28_-_15.16.13.png', 8),
(72, 'Gombás kacsahús menü (750ml)', 1650, '', 'https://cdn.discordapp.com/attachments/355709434166640640/1101497197276696656/Kepernyofoto_2023-04-28_-_15.16.17.png', 8);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `houseNumber` varchar(255) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `menuId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `restaurant`
--

INSERT INTO `restaurant` (`id`, `name`, `url`) VALUES
(1, 'Pizzaking', 'https://www.pizza-king.hu/webshop/pizzaking/images/pizzeriaaction/pizzaking_cooky.jpg'),
(2, 'Catch Burger - Mester utca', 'https://images.deliveryhero.io/image/fd-hu/LH/wva4-hero.jpg?width=2500&height=625&quality=45'),
(3, 'Hanami Sushi', 'https://images.deliveryhero.io/image/fd-hu/LH/x9pa-hero.jpg?width=2500&height=625&quality=45'),
(4, 'Starbucks Corvin Pláza', 'https://images.deliveryhero.io/image/fd-hu/LH/z2sf-hero.jpg?width=2500&height=625&quality=45'),
(5, 'Mester Gyros', 'https://images.deliveryhero.io/image/fd-hu/LH/q5uj-hero.jpg?width=2500&height=625&quality=45'),
(6, 'McDonald\'s', 'https://imageproxy.wolt.com/venue/5ff73e7dafc2579c437eb6a8/09575320-8005-11eb-ae31-caf86b783e67_mcd_wolt_header_1440x810.jpg'),
(7, 'BurgerKing', 'https://s.24.hu/app/uploads/2021/01/043_dpa-pa_201218-99-738823_dpai-e1610025834344.jpg'),
(8, 'Padthai Wokbar', 'https://imageproxy.wolt.com/venue/5f48fbc50ab8cb330fee2596/c19293a0-b709-11ec-80cc-365e87f7bb93_7.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_085156de3c3a44eba017a6a0846` (`restaurantId`);

--
-- A tábla indexei `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_caabe91507b3379c7ba73637b84` (`userId`);

--
-- A tábla indexei `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5f91d6693d5aab198d418b9b1d0` (`menuId`),
  ADD KEY `FK_646bf9ece6f45dbe41c203e06e0` (`orderId`);

--
-- A tábla indexei `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT a táblához `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_085156de3c3a44eba017a6a0846` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_caabe91507b3379c7ba73637b84` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_5f91d6693d5aab198d418b9b1d0` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_646bf9ece6f45dbe41c203e06e0` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
