-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 14 2011 г., 16:49
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
(1, 'article', '2011-05-30 17:00:33'),
(2, 'user', '2011-06-02 15:42:38');

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
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `admin_table_field`
--

INSERT INTO `admin_table_field` (`id_field`, `id_table`, `name`, `label`, `created`, `type`, `is_primary`, `required`, `field_order`, `show_field`, `other`) VALUES
(6, 1, 'id_article', NULL, '2011-05-31 16:21:40', 1, 1, 1, 0, 1, NULL),
(12, 1, 'full_text', 'Full text', '2011-06-02 14:54:34', 3, 0, 1, 1, 1, NULL),
(13, 1, 'created', 'Created', '2011-06-02 14:54:41', 3, 0, 1, 2, 1, NULL),
(14, 1, 'status', 'Status', '2011-06-02 14:54:55', 9, 0, 1, 3, 1, NULL),
(20, 2, 'id_user', NULL, '2011-06-02 15:42:45', 1, 1, 1, 0, 1, NULL),
(21, 2, 'email', NULL, '2011-06-02 15:42:55', 1, 0, 1, 1, 1, NULL),
(22, 2, 'password', NULL, '2011-06-02 15:43:14', 6, 0, 1, 2, 1, NULL),
(23, 1, 'recent_added', 'Recent added', '2011-06-07 15:15:03', 7, 0, 0, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `full_text` text,
  `created` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `recent_added` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `article`
--

INSERT INTO `article` (`id_article`, `full_text`, `created`, `status`, `recent_added`) VALUES
(1, 'adsfasdf', '2011-06-15 14:59:34', 1, NULL),
(2, 'adf', '2011-06-30 15:16:04', 2, 'asdfasdf'),
(3, 'sdfgsdfg', '2011-06-09 15:16:18', 1, 'asdasdfasdf');
