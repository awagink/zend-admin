-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 07 2011 г., 15:19
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

-- --------------------------------------------------------

--
-- Структура таблицы `admin_table_field`
--

CREATE TABLE IF NOT EXISTS `admin_table_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_table` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `type` tinyint(4) DEFAULT '2',
  `is_primary` tinyint(4) DEFAULT '0',
  `required` tinyint(4) DEFAULT '0',
  `field_order` int(11) DEFAULT NULL,
  `show_field` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

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
