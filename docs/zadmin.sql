-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 30 2011 г., 17:01
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
