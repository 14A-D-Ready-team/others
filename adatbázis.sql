DROP DATABASE IF EXISTS `ready-db-dev`;

CREATE DATABASE `ready-db-dev`
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

USE `ready-db-dev`;  

set names utf8mb4;
set foreign_key_checks = 0;

create table `category` (`id` int unsigned not null auto_increment primary key, `name` varchar(80) not null) default character set utf8mb4 engine = InnoDB;

create table `product` (`id` int unsigned not null auto_increment primary key, `name` varchar(100) not null, `description` varchar(500) not null, `full_price` numeric(10,0) not null, `discounted_price` numeric(10,0) null, `stock` mediumint not null, `category_id` int unsigned not null) default character set utf8mb4 engine = InnoDB;
alter table `product` add index `product_category_id_index`(`category_id`);

create table `customization` (`id` int unsigned not null auto_increment primary key, `description` varchar(120) not null, `option_count` tinyint not null, `product_id` int unsigned not null) default character set utf8mb4 engine = InnoDB;
alter table `customization` add index `customization_product_id_index`(`product_id`);

create table `option` (`id` int unsigned not null auto_increment primary key, `name` varchar(120) not null, `extra_cost` numeric(10,0) not null, `customization_id` int unsigned not null) default character set utf8mb4 engine = InnoDB;
alter table `option` add index `option_customization_id_index`(`customization_id`);

create table `user` (`id` int unsigned not null auto_increment primary key, `type` tinyint not null, `name` varchar(50) not null, `email` varchar(80) not null, `password` varchar(255) null, `status` tinyint not null) default character set utf8mb4 engine = InnoDB;
alter table `user` add unique `user_email_unique`(`email`);

create table `token` (`id` varchar(36) not null, `type` tinyint not null, `user_id` int unsigned not null, primary key (`id`)) default character set utf8mb4 engine = InnoDB;
alter table `token` add index `token_user_id_index`(`user_id`);

create table `customer` (`user_id` int unsigned not null, primary key (`user_id`)) default character set utf8mb4 engine = InnoDB;

create table `buffet_worker` (`user_id` int unsigned not null, primary key (`user_id`)) default character set utf8mb4 engine = InnoDB;

create table `buffet_owner` (`user_id` int unsigned not null, primary key (`user_id`)) default character set utf8mb4 engine = InnoDB;

create table `admin` (`user_id` int unsigned not null, primary key (`user_id`)) default character set utf8mb4 engine = InnoDB;

alter table `product` add constraint `product_category_id_foreign` foreign key (`category_id`) references `category` (`id`) on update cascade;

alter table `customization` add constraint `customization_product_id_foreign` foreign key (`product_id`) references `product` (`id`) on update cascade;

alter table `option` add constraint `option_customization_id_foreign` foreign key (`customization_id`) references `customization` (`id`) on update cascade;

alter table `token` add constraint `token_user_id_foreign` foreign key (`user_id`) references `user` (`id`) on update cascade;

alter table `customer` add constraint `customer_user_id_foreign` foreign key (`user_id`) references `user` (`id`) on update cascade on delete cascade;

alter table `buffet_worker` add constraint `buffet_worker_user_id_foreign` foreign key (`user_id`) references `user` (`id`) on update cascade on delete cascade;

alter table `buffet_owner` add constraint `buffet_owner_user_id_foreign` foreign key (`user_id`) references `user` (`id`) on update cascade on delete cascade;

alter table `admin` add constraint `admin_user_id_foreign` foreign key (`user_id`) references `user` (`id`) on update cascade on delete cascade;



-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jan 18. 10:55
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ready-db-dev`
--

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`user_id`) VALUES
(1),
(2),
(3);

--
-- A tábla adatainak kiíratása `buffet_owner`
--

INSERT INTO `buffet_owner` (`user_id`) VALUES
(5);

--
-- A tábla adatainak kiíratása `buffet_worker`
--

INSERT INTO `buffet_worker` (`user_id`) VALUES
(4);

--
-- A tábla adatainak kiíratása `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Italok'),
(2, 'Melegszendvicsek'),
(3, 'Péksütik'),
(4, 'Édességek'),
(5, 'Gyorsételek'),
(6, 'Fincsi ®'),
(7, 'Forró italok'),
(8, 'Nassolnivalók');

--
-- A tábla adatainak kiíratása `customer`
--

INSERT INTO `customer` (`user_id`) VALUES
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55);

--
-- A tábla adatainak kiíratása `customization`
--

INSERT INTO `customization` (`id`, `description`, `option_count`, `product_id`) VALUES
(1, 'Méret', 0, 2),
(2, 'Méret', 0, 3),
(3, 'Méret', 0, 4),
(4, 'Méret', 0, 5),
(5, 'Méret', 0, 1),
(6, 'Szósz', 1, 7),
(7, 'Sajt', 0, 7),
(8, 'Szósz', 1, 8),
(9, 'Sajt', 0, 8),
(10, 'Szósz', 1, 9),
(11, 'Sajt', 0, 9),
(12, 'Szósz', 1, 6),
(13, 'Sajt', 0, 6),
(14, 'Íz', 0, 17),
(15, 'Íz', 0, 18),
(16, 'Íz', 0, 19),
(17, 'Cukor', 0, 29),
(18, 'Cukor', 0, 38),
(19, 'Cukor', 0, 39),
(20, 'Cukor', 0, 40),
(21, 'Cukor', 0, 41),
(22, 'Cukor', 0, 42),
(23, 'Cukor', 0, 28),
(24, 'Szósz', 1, 31),
(25, 'Sajt', 0, 31),
(26, 'Szósz', 1, 32),
(27, 'Sajt', 0, 32),
(28, 'Szósz', 1, 30),
(29, 'Sajt', 0, 30),
(30, 'Íz', 0, 44),
(31, 'Méret', 0, 44),
(32, 'Íz', 0, 45),
(33, 'Méret', 0, 45),
(34, 'Íz', 0, 46),
(35, 'Méret', 0, 46),
(36, 'Méret', 0, 47),
(37, 'Íz', 0, 43),
(38, 'Méret', 0, 43);

--
-- A tábla adatainak kiíratása `option`
--

INSERT INTO `option` (`id`, `name`, `extra_cost`, `customization_id`) VALUES
(1, '0,33l', '0', 1),
(2, '0,5l', '25', 1),
(3, '1,25l', '75', 1),
(4, '1,75l', '270', 1),
(5, '2,25l', '415', 1),
(6, '0,33l', '0', 2),
(7, '0,5l', '25', 2),
(8, '1,25l', '75', 2),
(9, '1,75l', '270', 2),
(10, '2,25l', '415', 2),
(11, '0,33l', '0', 3),
(12, '0,5l', '25', 3),
(13, '1,25l', '75', 3),
(14, '1,75l', '270', 3),
(15, '2,25l', '415', 3),
(16, '0,33l', '0', 4),
(17, '0,5l', '25', 4),
(18, '1,25l', '75', 4),
(19, '1,75l', '270', 4),
(20, '2,25l', '415', 4),
(21, '0,33l', '0', 5),
(22, '0,5l', '25', 5),
(23, '1,25l', '75', 5),
(24, '1,75l', '270', 5),
(25, '2,25l', '415', 5),
(26, 'Ketchup', '0', 6),
(27, 'Mustár', '0', 6),
(28, 'Majonéz', '0', 6),
(29, 'BBQ', '0', 6),
(30, 'Pesto', '100', 6),
(31, 'Csípős', '0', 6),
(32, 'Sajttal', '0', 7),
(33, 'Sajt nélkül', '0', 7),
(34, 'Ketchup', '0', 8),
(35, 'Mustár', '0', 8),
(36, 'Majonéz', '0', 8),
(37, 'BBQ', '0', 8),
(38, 'Pesto', '100', 8),
(39, 'Csípős', '0', 8),
(40, 'Sajttal', '0', 9),
(41, 'Sajt nélkül', '0', 9),
(42, 'Ketchup', '0', 10),
(43, 'Mustár', '0', 10),
(44, 'Majonéz', '0', 10),
(45, 'BBQ', '0', 10),
(46, 'Pesto', '100', 10),
(47, 'Csípős', '0', 10),
(48, 'Sajttal', '0', 11),
(49, 'Sajt nélkül', '0', 11),
(50, 'Ketchup', '0', 12),
(51, 'Mustár', '0', 12),
(52, 'Majonéz', '0', 12),
(53, 'BBQ', '0', 12),
(54, 'Pesto', '100', 12),
(55, 'Csípős', '0', 12),
(56, 'Sajttal', '0', 13),
(57, 'Sajt nélkül', '0', 13),
(58, 'Cola', '0', 14),
(59, 'Narancs', '0', 14),
(60, 'Trópusi gyümölcs', '0', 14),
(61, 'Eper', '0', 14),
(62, 'Dinnye', '0', 14),
(63, 'Erdei gyümölcs', '0', 14),
(64, 'Cola', '0', 15),
(65, 'Narancs', '0', 15),
(66, 'Trópusi gyümölcs', '0', 15),
(67, 'Eper', '0', 15),
(68, 'Dinnye', '0', 15),
(69, 'Erdei gyümölcs', '0', 15),
(70, 'Cola', '0', 16),
(71, 'Narancs', '0', 16),
(72, 'Trópusi gyümölcs', '0', 16),
(73, 'Eper', '0', 16),
(74, 'Dinnye', '0', 16),
(75, 'Erdei gyümölcs', '0', 16),
(76, 'Cukorral', '0', 17),
(77, 'Cukor nélkül', '0', 17),
(78, 'Extra cukorral', '20', 17),
(79, 'Édesítőszerrel', '40', 17),
(80, 'Cukorral', '0', 18),
(81, 'Cukor nélkül', '0', 18),
(82, 'Extra cukorral', '20', 18),
(83, 'Édesítőszerrel', '40', 18),
(84, 'Cukorral', '0', 19),
(85, 'Cukor nélkül', '0', 19),
(86, 'Extra cukorral', '20', 19),
(87, 'Édesítőszerrel', '40', 19),
(88, 'Cukorral', '0', 20),
(89, 'Cukor nélkül', '0', 20),
(90, 'Extra cukorral', '20', 20),
(91, 'Édesítőszerrel', '40', 20),
(92, 'Cukorral', '0', 21),
(93, 'Cukor nélkül', '0', 21),
(94, 'Extra cukorral', '20', 21),
(95, 'Édesítőszerrel', '40', 21),
(96, 'Cukorral', '0', 22),
(97, 'Cukor nélkül', '0', 22),
(98, 'Extra cukorral', '20', 22),
(99, 'Édesítőszerrel', '40', 22),
(100, 'Cukorral', '0', 23),
(101, 'Cukor nélkül', '0', 23),
(102, 'Extra cukorral', '20', 23),
(103, 'Édesítőszerrel', '40', 23),
(104, 'Ketchup', '0', 24),
(105, 'Mustár', '0', 24),
(106, 'Majonéz', '0', 24),
(107, 'BBQ', '0', 24),
(108, 'Pesto', '100', 24),
(109, 'Csípős', '0', 24),
(110, 'Sajttal', '0', 25),
(111, 'Sajt nélkül', '0', 25),
(112, 'Ketchup', '0', 26),
(113, 'Mustár', '0', 26),
(114, 'Majonéz', '0', 26),
(115, 'BBQ', '0', 26),
(116, 'Pesto', '100', 26),
(117, 'Csípős', '0', 26),
(118, 'Sajttal', '0', 27),
(119, 'Sajt nélkül', '0', 27),
(120, 'Ketchup', '0', 28),
(121, 'Mustár', '0', 28),
(122, 'Majonéz', '0', 28),
(123, 'BBQ', '0', 28),
(124, 'Pesto', '100', 28),
(125, 'Csípős', '0', 28),
(126, 'Sajttal', '0', 29),
(127, 'Sajt nélkül', '0', 29),
(128, 'Sós', '0', 30),
(129, 'Sajtos', '0', 30),
(130, 'BBQ', '0', 30),
(131, 'Chilis', '0', 30),
(132, 'Ranch Szósz', '0', 30),
(133, '60g', '0', 31),
(134, '140g', '150', 31),
(135, '250g', '350', 31),
(136, 'Sós', '0', 32),
(137, 'Sajtos', '0', 32),
(138, 'BBQ', '0', 32),
(139, 'Chilis', '0', 32),
(140, 'Ranch Szósz', '0', 32),
(141, '60g', '0', 33),
(142, '140g', '150', 33),
(143, '250g', '350', 33),
(144, 'Sós', '0', 34),
(145, 'Sajtos', '0', 34),
(146, 'BBQ', '0', 34),
(147, 'Chilis', '0', 34),
(148, 'Ranch Szósz', '0', 34),
(149, '60g', '0', 35),
(150, '140g', '150', 35),
(151, '250g', '350', 35),
(152, '60g', '0', 36),
(153, '140g', '150', 36),
(154, '250g', '350', 36),
(155, 'Sós', '0', 37),
(156, 'Sajtos', '0', 37),
(157, 'BBQ', '0', 37),
(158, 'Chilis', '0', 37),
(159, 'Ranch Szósz', '0', 37),
(160, '60g', '0', 38),
(161, '140g', '150', 38),
(162, '250g', '350', 38);

--
-- A tábla adatainak kiíratása `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `full_price`, `discounted_price`, `stock`, `category_id`) VALUES
(1, 'Coca Cola', 'Consequuntur doloremque sed. Temporibus enim odit veniam necessitatibus labore reprehenderit commodi. Voluptas sint voluptas fuga et voluptates nobis similique. Facere vel cupiditate earum quis omnis nulla repellendus.', '2602', '858', 14, 1),
(2, 'Pepsi', 'Ducimus in omnis ab recusandae rem atque voluptatum magni odio. Delectus similique dolorum ea modi odit. Quia quae totam reprehenderit.', '3081', '3400', 31, 1),
(3, 'Fanta', 'Quis debitis id tempora omnis. Ipsam veritatis non vitae aliquid. Optio necessitatibus occaecati. Quaerat modi ex aut delectus labore commodi. Quam excepturi iste reprehenderit reiciendis qui libero recusandae accusamus explicabo. Animi veniam quam maiores dolores alias asperiores facilis saepe similique.', '2230', '3963', 82, 1),
(4, 'Mountain Dew', 'Sapiente atque doloribus quod doloribus facilis occaecati corrupti sint. Minima harum similique illum eius recusandae architecto dolores soluta. Quo officiis accusamus eveniet corporis provident commodi necessitatibus perspiciatis eligendi.', '1003', '2262', 90, 1),
(5, 'Kinley', 'Reiciendis deserunt doloribus temporibus. Ab voluptate error dicta dolorum incidunt reiciendis neque dicta. Corrupti laboriosam facere deleniti id tenetur.', '4397', '4509', 56, 1),
(6, 'Sonkás melegszendvics', 'Dignissimos vitae ea harum vel hic consequuntur libero blanditiis ad. Odio quia corporis libero inventore doloribus velit laboriosam perferendis. Molestias adipisci totam perferendis accusantium commodi deleniti laboriosam provident aliquam. Possimus magnam esse eius. Asperiores repudiandae magni amet. Quibusdam officiis quae quam rerum illum tempore perspiciatis debitis occaecati.', '2562', '4367', 14, 2),
(7, 'Gombás melegszendvics', 'Accusantium dolor veritatis voluptate esse sint nemo explicabo enim ut. Voluptatibus quasi nesciunt esse voluptas fuga sapiente labore cupiditate. Iure perspiciatis possimus consequuntur esse laborum iusto doloribus. Quam nesciunt quis ab quam veniam.', '4521', '504', 79, 2),
(8, 'Sonkás-kukoricás melegszendvics', 'Eaque optio itaque illo voluptatibus aspernatur quia minus qui consequuntur. Enim qui dolore voluptatibus possimus voluptatum ab saepe corporis. Aspernatur dolore iure eum asperiores facilis provident accusamus. Maiores qui delectus.', '525', '1052', 76, 2),
(9, 'Magyaros melegszendvics', 'Officiis aspernatur ea sed deserunt sequi nobis in molestiae reprehenderit. Ducimus dolor ducimus maiores unde rem aut beatae consequatur ea. Dolores consectetur sapiente magni perspiciatis ab a facilis quos totam. Praesentium qui repellendus laboriosam ut id praesentium beatae itaque dicta. Qui suscipit facere. Deleniti ab odit soluta corporis temporibus earum saepe dolorem.', '119', '1048', 81, 2),
(10, 'Mars', 'Modi eligendi quia modi eveniet a dolore optio voluptates libero. Fuga neque veritatis excepturi autem. Voluptatibus debitis nihil voluptate non. Earum alias unde. Repellendus at fugit repellat placeat consectetur in suscipit.', '73', '4195', 78, 4),
(11, 'Bounty', 'Perferendis dolor quia inventore. Corrupti vero nobis assumenda. Corporis culpa corrupti placeat possimus cum expedita quis atque. Esse nisi quam iste vitae qui ipsa. Enim neque voluptas sunt aliquid voluptas.', '4306', '266', 89, 4),
(12, 'Pogácsa', 'Aperiam porro quos libero cum omnis. Commodi tenetur nesciunt ea odio eveniet quos repudiandae. Quam qui cum deserunt nisi.', '1711', '805', 83, 3),
(13, 'Pizzás háromszög', 'Quidem culpa aliquam magni veritatis asperiores molestias ipsum non. Earum harum sapiente voluptates quidem voluptates. Velit iusto provident quam. Hic hic aperiam debitis ab. Dolorum assumenda illum harum natus ratione veniam commodi nihil.', '1478', '1105', 99, 3),
(14, 'Kakaóscsiga', 'Fugiat officia voluptate magni placeat. Ex nisi nemo commodi neque doloremque exercitationem quos adipisci. Reprehenderit nesciunt perspiciatis.', '2947', '2096', 6, 3),
(15, 'Lekváros bukta', 'Autem ab earum dolores quisquam earum saepe facilis. Nihil molestias natus. Ullam explicabo est est facere accusamus.', '2728', '1952', 59, 3),
(16, 'Perec', 'Vitae in ea porro repellat saepe praesentium animi. Eligendi voluptatum maxime aspernatur sequi nobis beatae cum. Adipisci vel voluptate saepe animi voluptas ab voluptate veritatis. Accusamus molestiae ipsa blanditiis voluptatem non.', '1850', '1272', 97, 3),
(17, 'Nyalóka', 'Tenetur aliquid est. Molestiae alias quae placeat doloribus quidem. Velit voluptate soluta molestiae nam.', '3031', '3122', 87, 4),
(18, 'Gumicukor', 'Quo consequuntur expedita magni sequi voluptas nesciunt nobis laborum. Magni voluptas voluptatum inventore id quasi libero. Nam voluptate nihil aliquid quidem facilis ducimus id odit. Exercitationem dolore molestias. Ipsa dicta sunt distinctio consequatur repellendus eaque voluptatum minima odio. Architecto perferendis quidem similique asperiores quidem corrupti ad aliquam.', '3394', '2480', 53, 4),
(19, 'Toffix', 'Illum reprehenderit quas dolores voluptates. Iusto provident voluptate harum voluptatem aliquam nam odit. Veniam iusto voluptates quam culpa. Quae dolorum nulla amet corporis voluptate temporibus.', '3721', '157', 53, 4),
(20, 'Snickers', 'Tenetur mollitia quas eius vel ut veritatis ab ipsum eius. Quidem praesentium nulla in voluptas labore ut. Maxime aperiam blanditiis odit eligendi harum similique sapiente. Dolorem odit debitis neque nobis aliquid officia ducimus. Error fuga dolor doloremque laborum provident autem molestiae molestiae. Tempore qui repudiandae exercitationem eveniet nostrum ipsa quidem.', '206', '778', 20, 4),
(21, 'Milky Way', 'Dolor cupiditate nostrum consectetur accusantium tempora. Eius tenetur similique repellendus magnam et adipisci. Distinctio neque sint doloremque nam eaque quasi ad.', '4152', '1057', 80, 4),
(22, 'Twix', 'Quos illo sit odit repellat doloribus. Autem ab in porro hic iure nobis suscipit placeat doloribus. Cupiditate sapiente adipisci nulla. Molestias delectus atque exercitationem totam quos explicabo voluptates. Unde perferendis alias laudantium nihil at modi commodi dicta nisi.', '3576', '4420', 12, 4),
(23, 'Kinder Bueno', 'Sit blanditiis sequi maxime vel dignissimos facere quod recusandae. Iusto cum atque iste officia quis nemo optio hic. Corrupti illum vel inventore facere cupiditate sequi eius praesentium ullam.', '849', '1164', 82, 4),
(24, 'Sonkás-sajtos szendvics', 'Pariatur omnis aperiam. Molestias placeat quod minima mollitia occaecati similique pariatur. Molestias quas enim expedita at ad quis ex consequuntur. Voluptatem in rerum consequuntur excepturi ducimus illum illum.', '3522', '2574', 40, 6),
(25, 'Rántott húsos szendvics', 'Tempore iste aut quisquam dolorum repudiandae in tempore. Libero ab fuga odio est id qui dolorum iusto. Nobis impedit facere minima optio dolor consequatur labore. Asperiores ea expedita corporis illum quis sint unde officia. Similique neque fuga animi.', '3912', '4023', 94, 6),
(26, 'Tzazikis gyros', 'Debitis quam vel nisi dolorum architecto deserunt. Nihil commodi saepe blanditiis. Numquam enim culpa. Reiciendis beatae consequatur deserunt.', '3674', '2142', 34, 6),
(27, 'Chillis gyros', 'Dolor exercitationem culpa eum magni vitae. In atque hic totam nobis ducimus excepturi culpa odio quo. Voluptate aliquid perferendis ipsam voluptatibus odit ad cumque. Deserunt adipisci pariatur facere. Vitae voluptatum occaecati quasi culpa nobis reprehenderit debitis dicta.', '571', '80', 54, 6),
(28, 'Kávé', 'Dolorem libero recusandae consequatur totam odit modi. Tempora provident aliquid voluptatum quos quia cumque. Ea aliquid veritatis. Vero aliquam dolorum id fuga inventore accusamus. Odio nisi voluptate laborum excepturi beatae cumque dignissimos porro.', '3240', '3799', 6, 7),
(29, 'Forrócsoki', 'Suscipit impedit officia quia officia ex porro dolor cupiditate. Nihil sunt provident officia sapiente. Sit facere atque blanditiis est. Nihil ratione amet dignissimos provident.', '3263', '1037', 18, 7),
(30, 'Hamburger', 'Eveniet nihil deserunt commodi rerum iure nemo quis soluta eius. Non iusto suscipit voluptates dignissimos. Nisi quasi animi unde maxime commodi tenetur fuga laborum. Minima a itaque molestiae delectus.', '3249', '2815', 84, 5),
(31, 'Pizza szelet', 'Autem perspiciatis reprehenderit alias itaque. Ea non omnis at hic. Quisquam soluta dolorem saepe.', '2739', '3390', 28, 5),
(32, 'Hot Dog', 'Quaerat repellendus iste. Ut quod quis nisi quibusdam. Rerum neque qui provident explicabo vero. Rem reiciendis aspernatur repudiandae tempore quod sed eos. Dicta sed culpa aperiam et repellat reprehenderit blanditiis.', '2448', '1154', 21, 5),
(33, 'Csibefalatos-csípős fincsi szendvics', 'Cupiditate quam corporis corporis ducimus iure neque unde dolorum molestiae. Voluptates nulla numquam similique ad quibusdam. Nostrum cum maiores numquam ad. Deserunt mollitia repudiandae. Perspiciatis unde sed.', '3173', '3412', 94, 6),
(34, 'Csibefalatos-mézes-mustáros fincsi szendvics', 'Odit maxime consequuntur suscipit iste reiciendis incidunt iste. Odio magni perspiciatis. Quos aliquam quisquam facilis nemo sint nesciunt sint nam doloremque. Et hic voluptatibus sunt. Nisi pariatur mollitia voluptatibus quam cumque pariatur blanditiis laudantium.', '4261', '1530', 97, 6),
(35, 'Tarjás fincsi szendvics', 'Ea exercitationem voluptate labore repudiandae. Quidem alias eum voluptate minus tempora dignissimos nulla expedita eius. Corrupti alias quae.', '163', '2045', 64, 6),
(36, 'Rántott-csirkemelles fincsi szendvics', 'Cum aut dignissimos dolores pariatur nihil ex veniam impedit. Perferendis reiciendis illo quo quis dolor quidem asperiores corporis. Quisquam molestiae quae nulla alias perferendis aliquam minima quaerat.', '2822', '1654', 18, 6),
(37, 'Szalámis-tojásos fincsi szendvics', 'Culpa earum nihil rerum. Laudantium labore voluptas velit at nam occaecati dolorem non. Cupiditate autem dolor harum inventore. Tempora non culpa unde ipsam pariatur sequi reiciendis odio.', '2974', '323', 2, 6),
(38, 'Cappuccino', 'Rerum eum asperiores. Inventore aliquid sequi veritatis odio. Numquam molestiae beatae ullam minima. Esse sit quis iste nemo quo laudantium exercitationem laudantium. Harum molestiae quas ad.', '726', '930', 15, 7),
(39, 'Esspresso', 'Facere doloremque laudantium. Odio quos quae facere. Possimus optio quam optio. Placeat nam quidem nostrum animi accusantium.', '4413', '1708', 33, 7),
(40, 'Zöld tea', 'Odio corporis iusto voluptatibus itaque laboriosam pariatur fugit. Ratione earum nisi ex optio dolores perspiciatis. Adipisci deleniti mollitia eligendi officia.', '808', '4296', 11, 7),
(41, 'Yorkshire Gold', 'Aliquid molestias sed in maxime soluta explicabo ipsa. Ea natus culpa assumenda occaecati nobis similique. Consequuntur iure fuga. Quidem aspernatur illum officia odio occaecati dignissimos maxime. Dolore modi eius nemo minus labore commodi ex reprehenderit nemo.', '362', '2534', 29, 7),
(42, 'Americano', 'Sapiente soluta sint quae non. Sapiente repellendus tenetur. Iusto quidem aspernatur deleniti doloremque dolor. Assumenda aperiam tempore. Dolore quas ipsa ipsam eligendi architecto placeat.', '3982', '1489', 94, 7),
(43, 'Chio Chipsz', 'Sequi dolor tenetur eaque quasi optio molestiae. Veniam nemo esse non iusto similique vel. Ullam voluptatum quae quis mollitia doloribus. Magnam magni dolore aliquam labore illum natus.', '4555', '4150', 34, 8),
(44, 'Tortilla Chipsz', 'Dignissimos maxime inventore quod esse sed. Quis voluptate id ipsum. Voluptatibus numquam non animi nobis exercitationem. Et nesciunt perspiciatis sequi praesentium illum voluptatem repudiandae. Aliquam molestiae qui itaque debitis eaque vitae.', '2968', '3906', 36, 8),
(45, 'Tuc Keksz', 'Ad tempora provident deserunt nam quam labore voluptate nesciunt asperiores. Accusamus atque deleniti aliquid repudiandae delectus quia nam placeat dolorem. Consequuntur nisi placeat quasi quidem corporis totam cupiditate pariatur praesentium. Nulla quidem ea odit necessitatibus. Libero voluptates asperiores ea odio aperiam tenetur tempore placeat.', '852', '2713', 27, 8),
(46, 'Pufi Kukoricasnack', 'Modi placeat cupiditate ab asperiores hic mollitia neque. Id ut recusandae hic voluptate ducimus dolorum unde eum. Quam similique debitis laudantium porro. Molestias quas qui incidunt id.', '1778', '3127', 70, 8),
(47, 'Nógrádi Ropogós', 'Accusantium quo odit totam officiis consectetur mollitia. Itaque dolore temporibus a expedita. Repellendus vitae aut animi laboriosam rem et. Modi totam illum.', '3977', '1436', 87, 8);

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `type`, `name`, `email`, `password`, `status`) VALUES
(1, 3, 'Fekete Miklós', 'redstone12@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cjBmHDNWKUkQtyiSChmb3A$VCjInmra7fDg3Z5W9rxSLVbL9eAOaBfp7d90BORiV8I', 0),
(2, 3, 'Sulyok Dávid', 'sulyok.david@students.jedlik.eu', '$argon2id$v=19$m=65536,t=3,p=4$vQrAOlsbt7krNvWxLXh63Q$7xCh4ERCDKZeYdwEf5bw+Vds2WFvsl9LIR/lsjKSKj8', 0),
(3, 3, 'Kékesi Ádám', 'kekesi.adam@students.jedlik.eu', '$argon2id$v=19$m=65536,t=3,p=4$qZEZL8zeFqyVTNP4uMaNsg$bdNHnNa9CtO5K5jPbx23O18IKtN3rUYPcSFfPvkQt50', 0),
(4, 1, 'Cserepes Virág', 'flower123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$LFORCOkUWr/optGN/fyOrA$vzbKd2r8xYzcXBuEFSZ/dVpoFtpgpg6/I3NyndT2rNk', 0),
(5, 2, 'Végh Béla', 'bela123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$lO0SJC8r1cNm79buBs4CQA$QklRCY5tRKubmJVixrVLhBsopgZbiBkCWwgGgrzpRcM', 0),
(6, 0, 'Oscar Robel', 'Oscar39@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(7, 0, 'Jerrod Heller', 'Jerrod90@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(8, 0, 'Deon Hudson', 'Deon_Hudsonf5f401f2-9715-11ed-bf30-0b8650ab5b7134@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(9, 0, 'Bettie Ziemann', 'Bettie_Ziemannf5f401f3-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(10, 0, 'Fabiola Rempel', 'Fabiola.Rempelf5f401f4-9715-11ed-bf30-0b8650ab5b7190@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(11, 0, 'Carol Little', 'Carol0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(12, 0, 'Melba Carroll', 'Melba.Carrollf5f401f6-9715-11ed-bf30-0b8650ab5b7177@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(13, 0, 'Garett Schinner', 'Garett.Schinnerf5f42900-9715-11ed-bf30-0b8650ab5b712@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(14, 0, 'Cody Hagenes', 'Cody.Hagenesf5f42901-9715-11ed-bf30-0b8650ab5b718@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(15, 0, 'Orie Hessel', 'Orie4@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(16, 0, 'Devan Farrell', 'Devan.Farrellf5f42903-9715-11ed-bf30-0b8650ab5b719@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(17, 0, 'Brandyn McLaughlin', 'Brandyn73@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(18, 0, 'Jaren Heaney', 'Jaren_Heaneyf5f45010-9715-11ed-bf30-0b8650ab5b7159@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(19, 0, 'Hannah Jacobson', 'Hannah5@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(20, 0, 'Mohammed Stamm', 'Mohammed.Stammf5f45012-9715-11ed-bf30-0b8650ab5b7183@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(21, 0, 'Moshe Hills', 'Moshe62@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(22, 0, 'Eliane Herzog', 'Eliane_Herzogf5f45014-9715-11ed-bf30-0b8650ab5b71@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(23, 0, 'Name Schinner', 'Name_Schinnerf5f45015-9715-11ed-bf30-0b8650ab5b71@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(24, 0, 'Tianna Gislason', 'Tianna.Gislasonf5f45016-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(25, 0, 'Taryn Lemke', 'Taryn_Lemkef5f45017-9715-11ed-bf30-0b8650ab5b71@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(26, 0, 'Johnson Stokes', 'Johnson.Stokesf5f45018-9715-11ed-bf30-0b8650ab5b7128@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(27, 0, 'Emelie Baumbach', 'Emelie22@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(28, 0, 'Eryn Sanford', 'Eryn_Sanfordf5f4501a-9715-11ed-bf30-0b8650ab5b7120@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(29, 0, 'Norberto Friesen', 'Norberto59@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(30, 0, 'Cali Flatley', 'Cali97@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(31, 0, 'Audreanne Weissnat', 'Audreanne_Weissnatf5f4501d-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(32, 0, 'Arch Yundt', 'Arch96@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(33, 0, 'Brando Mohr', 'Brando_Mohrf5f4501f-9715-11ed-bf30-0b8650ab5b7146@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(34, 0, 'Lauriane Gleichner', 'Lauriane_Gleichnerf5f45020-9715-11ed-bf30-0b8650ab5b7166@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(35, 0, 'Wanda Stiedemann', 'Wanda57@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(36, 0, 'Vivienne Osinski', 'Vivienne.Osinskif5f45022-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(37, 0, 'Cletus Moen', 'Cletus34@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(38, 0, 'Alena Stoltenberg', 'Alena49@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(39, 0, 'Elyssa Wisozk', 'Elyssa_Wisozkf5f47722-9715-11ed-bf30-0b8650ab5b7150@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(40, 0, 'Chelsie Stark', 'Chelsie_Starkf5f47723-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(41, 0, 'Santiago Bradtke', 'Santiago63@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(42, 0, 'Domenick Quitzon', 'Domenick_Quitzonf5f47725-9715-11ed-bf30-0b8650ab5b71@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(43, 0, 'Lonie MacGyver', 'Lonie_MacGyverf5f47726-9715-11ed-bf30-0b8650ab5b71@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(44, 0, 'Dino Mohr', 'Dino20@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(45, 0, 'Ephraim Borer', 'Ephraim89@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(46, 0, 'Nils Stokes', 'Nils.Stokesf5f47729-9715-11ed-bf30-0b8650ab5b71@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(47, 0, 'Genoveva Veum', 'Genoveva.Veumf5f4772a-9715-11ed-bf30-0b8650ab5b7125@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(48, 0, 'Kale Bayer', 'Kale_Bayerf5f4772b-9715-11ed-bf30-0b8650ab5b71@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(49, 0, 'Lina Zulauf', 'Lina_Zulauff5f4772c-9715-11ed-bf30-0b8650ab5b7148@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(50, 0, 'Jeffrey Boyer', 'Jeffrey_Boyerf5f4772d-9715-11ed-bf30-0b8650ab5b7140@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(51, 0, 'Kian Ebert', 'Kian8@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(52, 0, 'Vada Rath', 'Vada50@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0),
(53, 0, 'Garett Block', 'Garett.Blockf5f47730-9715-11ed-bf30-0b8650ab5b71@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(54, 0, 'Jesse Bergstrom', 'Jesse_Bergstromf5f47731-9715-11ed-bf30-0b8650ab5b7188@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 1),
(55, 0, 'Jerad Leannon', 'Jerad82@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qn2XAW/X+MlCAxUxzNbTgQ$YO62sujyRc66F8YfTfRG4ldCuujNjyRRihm/1QHQmag', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

set foreign_key_checks = 1;