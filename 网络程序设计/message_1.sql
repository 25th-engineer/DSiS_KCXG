-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-11-14 12:21:07
-- 服务器版本： 5.7.29-log
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `message`
--

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`id`, `nickname`, `content`, `from_user`, `to_user`, `time`, `visibility`, `type`, `message_id`) VALUES
(3, '111', '111', '1', NULL, '2020-11-13 14:47:02', 1, 1, NULL),
(7, '发送到', 'f阿斯蒂芬', '8', '1', '2020-11-13 16:14:51', 1, 3, 3),
(35, '11', '11', '9', NULL, '2020-11-13 23:06:52', 1, 1, NULL),
(34, '发送到', '发斯蒂芬', '9', NULL, '2020-11-13 23:06:46', 1, 1, NULL),
(31, '111', 'test', '9', NULL, '2020-11-13 22:59:58', 1, 1, NULL),
(32, '111', 'test', '9', NULL, '2020-11-13 23:00:09', 1, 1, NULL),
(33, 'OK', 'OKK', '10', NULL, '2020-11-13 23:00:14', 1, 1, NULL),
(40, '测试1', ' KNN算法的关键：\r\n\r\n           (1) 样本的所有特征都要做可比较的量化\r\n\r\n           若是样本特征中存在非数值的类型，必须采取手段将其量化为数值。例如样本特征中包含颜色，可通过将颜色转换为灰度值来实现距离计算。\r\n\r\n           (2) 样本特征要做归一化处理\r\n\r\n           样本有多个参数，每一个参数都有自己的定义域和取值范围，他们对距离计算的影响不一样，如取值较大的影响力会盖过取值较小的参数。所以样本参数必须做一些 scale 处理，最简单的方式', '10', NULL, '2020-11-13 23:18:40', 1, 1, NULL),
(41, 'plk', '我\r\n在\r\n测\r\n试', '10', NULL, '2020-11-13 23:20:50', 1, 1, NULL),
(42, '1', '11', '9', NULL, '2020-11-14 00:24:25', 1, 1, NULL),
(43, '55', 'afsdfsdfsdf', '11', NULL, '2020-11-14 09:36:02', 1, 1, NULL),
(44, '11', '1111111111111111111111', '11', NULL, '2020-11-14 09:40:42', 1, 1, NULL),
(45, '-=', '123456778', '11', NULL, '2020-11-14 09:46:51', 1, 1, NULL),
(46, '11', '11', '1', NULL, '2020-11-14 10:04:06', 1, 1, NULL),
(47, 'rer', '1111111113rfwer', '1', '11', '2020-11-14 10:06:00', 1, 3, 45),
(48, 'qwe', '数据集中有的数据项严重缺失，为了方便下一步工作，需要剔除训练数据中缺失值大于90%的列。具体操作是构建函数drop_col，以待剔除数据集、列名与阈值为参数，在导入训练数据时调用其进行筛除。实现代码如下所示：', '12', NULL, '2020-11-14 10:11:53', 1, 1, NULL),
(49, 'teyt', '数据集中有的数据项严重缺失，为了方便下一步工作，需要剔除训练数据中缺失值大于90%的列。具体操作是构建函数drop_col，以待剔除数据集、列名与阈值为参数，在导入训练数据时调用其进行筛除。实现代码如下所示：', '1', '12', '2020-11-14 10:12:16', 1, 3, 48),
(50, '管理员', '测试留言1', '1', NULL, '2020-11-14 10:16:02', 1, 1, NULL),
(51, 'xef@123.com', '测试回复1', '12', '1', '2020-11-14 10:16:59', 1, 3, 50);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `telephone` varchar(255) DEFAULT NULL COMMENT '手机',
  `blog` varchar(255) DEFAULT NULL COMMENT '博客',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `id_public` tinyint(1) DEFAULT NULL,
  `email_public` tinyint(1) DEFAULT NULL,
  `realname_public` tinyint(1) DEFAULT NULL,
  `telephone_public` tinyint(1) DEFAULT NULL,
  `blog_public` tinyint(1) DEFAULT NULL,
  `qq_public` tinyint(1) DEFAULT NULL,
  `wechat_public` tinyint(1) DEFAULT NULL,
  `weibo_public` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0' COMMENT '是否为管理员',
  `forbid` varchar(255) DEFAULT '' COMMENT '禁言 -1 永久'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `realname`, `telephone`, `blog`, `qq`, `wechat`, `weibo`, `id_public`, `email_public`, `realname_public`, `telephone_public`, `blog_public`, `qq_public`, `wechat_public`, `weibo_public`, `password`, `admin`, `forbid`) VALUES
(1, '249845@qq.com', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'e10adc3949ba59abbe56e057f20f883e', 1, ''),
(9, '245@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, ''),
(12, 'xef@123.com', 'Alay', '', '', '', 'wertetryyrtutyrutyityi78iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', '', 0, 0, 0, 0, 0, 0, 1, 0, '46f94c8de14fb36680850768ff1b7f2a', 0, ''),
(13, '123456789012345@163.com', '123456789012345', '', '123456789012345123456789012345', '', '', '', 0, 0, 1, 0, 1, 0, 0, 0, '46f94c8de14fb36680850768ff1b7f2a', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户名', AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
