-- 取消数据库外键关联
SET FOREIGN_KEY_CHECKS = 0;

-- 留言
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(100) NOT NULL COMMENT '留言人',
	`contact` VARCHAR(100) DEFAULT '' COMMENT '联系方式',
	`title` VARCHAR(255) NOT NULL COMMENT '留言标题',
	`content` VARCHAR(1000) DEFAULT '' COMMENT '留言内容',
	`reply` VARCHAR(1000) DEFAULT '' COMMENT '留言回复',
	`remark` VARCHAR(1000) DEFAULT '' COMMENT '留言备注',
	`is_read` TINYINT DEFAULT 0 COMMENT '是否已读 0：未读  1：已读',
	`customer_id` BIGINT NOT NULL COMMENT '客户id',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	FOREIGN KEY(`customer_id`) REFERENCES `cms_customer`(`id`)
) COMMENT = '留言';

-- 语言管理
DROP TABLE IF EXISTS `cms_language`;
CREATE TABLE `cms_language`(
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '语言',
	`language` VARCHAR(50) NOT NULL COMMENT '标识，如：zh-cn',
	`desc` VARCHAR(255) DEFAULT '' COMMENT '描述',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	UNIQUE(`language`),
	UNIQUE(`name`)
) COMMENT '语言管理模块';

-- 网站基本信息
DROP TABLE IF EXISTS `cms_web_config`;
CREATE TABLE `cms_web_config` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`site` VARCHAR(500) DEFAULT '' COMMENT '网站域名 如：www.uls.cn',
	`logo` VARCHAR(500) DEFAULT '' COMMENT '网站logo',
	`name` VARCHAR(100) DEFAULT '' COMMENT '网站名称',
	`title` VARCHAR(500) DEFAULT '' COMMENT '网站标题',
	`sub_title` VARCHAR(500) DEFAULT '' COMMENT '网站副标题',
	`seo_keywords` VARCHAR(500) DEFAULT '' COMMENT '网站SEO关键字',
	`seo_description` VARCHAR(500) DEFAULT '' COMMENT '网站SEO描述',
	`ipc_no` VARCHAR(255) DEFAULT '' COMMENT '网站备案号',
	`copyright` VARCHAR(255) DEFAULT '' COMMENT '网站版权',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	PRIMARY KEY(`id`),
	UNIQUE(`language`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '网站基本信息';

-- 友情链接
DROP TABLE IF EXISTS `cms_friend_link`;
CREATE TABLE `cms_friend_link` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(100) NOT NULL COMMENT '网站名称',
	`url` VARCHAR(500) DEFAULT '' COMMENT '网站链接',
	`logo` VARCHAR(500) DEFAULT '' COMMENT '网站logo',
	`category` VARCHAR(50) DEFAULT '' COMMENT '友情链接分类',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '友情链接';


-- 轮播图
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`title` VARCHAR(100) NOT NULL COMMENT '标题',
	`desc` VARCHAR(200) DEFAULT '' COMMENT '描述',
	`img` VARCHAR(500) NOT NULL COMMENT '轮播图片',
	`url` VARCHAR(500) DEFAULT '' COMMENT '跳转链接',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`start_time` datetime DEFAULT NULL COMMENT '轮播开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '轮播结束时间',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '轮播图';


-- 客户
DROP TABLE IF EXISTS `cms_customer`;
CREATE TABLE `cms_customer` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(100) NOT NULL COMMENT '客户姓名',
	`contact` VARCHAR(100) NOT NULL COMMENT '联系方式',
	`email` VARCHAR(100) DEFAULT '' COMMENT '邮箱',
	`address` VARCHAR(100) DEFAULT '' COMMENT '地址',
	`gender` VARCHAR(100) DEFAULT '' COMMENT '性别',
	`company` VARCHAR(100) DEFAULT '' COMMENT '公司',
	`qq` VARCHAR(100) DEFAULT '' COMMENT 'QQ',
	`wechat` VARCHAR(100) DEFAULT '' COMMENT '微信',
	`remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
	PRIMARY KEY(`id`)
) COMMENT '客户';

-- 客户咨询
DROP TABLE IF EXISTS `cms_consult`;
CREATE TABLE `cms_consult` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`title` VARCHAR(100) NOT NULL COMMENT '咨询标题',
	`content` VARCHAR(2000) NOT NULL COMMENT '咨询内容',
	`status` TINYINT DEFAULT 0 COMMENT '1：已处理  0：未处理',
	`remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
	`extra` VARCHAR(2000) DEFAULT '' COMMENT '拓展字段,记录其他信息',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	`customer_id` BIGINT NOT NULL COMMENT '客户id',
	PRIMARY KEY(`id`),
	FOREIGN KEY(`customer_id`) REFERENCES `cms_customer`(`id`)
) COMMENT '客户咨询';

-- 新闻/解决方案分类
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE `cms_article_category` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(100) NOT NULL COMMENT '新闻/解决方案分类名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '分类描述',
	`banner` VARCHAR(500) DEFAULT '' COMMENT '分类banner图片',
	`icon` VARCHAR(200) DEFAULT '' COMMENT '分类图标',
	`type` TINYINT DEFAULT 10 COMMENT '分类类型，10：新闻分类 20：解决方案',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '新闻/解决方案分类';


-- 新闻/解决方案模块
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
 	`article_category_id` BIGINT,
	`title` VARCHAR(500) NOT NULL COMMENT '新闻/解决方案分类名称',
	`video` VARCHAR(500) DEFAULT '' COMMENT '新闻/解决方案视频',
	`thumbnail` VARCHAR(500) DEFAULT '' COMMENT '缩略图',
	`summary` VARCHAR(500) DEFAULT '' COMMENT '简介',
	`content` TEXT COMMENT '新闻/解决方案内容',
	`publisher` VARCHAR(50) DEFAULT '' COMMENT '发布人',
	`publish_time` datetime DEFAULT NULL COMMENT '发布时间',
	`view_count` INT DEFAULT 0 COMMENT '访问量',
	`type` TINYINT DEFAULT 10 COMMENT '分类类型，10：新闻分类 20：解决方案 冗余字段',
	`sort` INT COMMENT '排序',
	`status` TINYINT DEFAULT 1 COMMENT '状态 1：发布  0：草稿',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`language`, `slug`), -- 联合主键
	INDEX (`language`),
 	FOREIGN KEY(`article_category_id`) REFERENCES `cms_article_category`(`id`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '新闻/解决方案模块';


-- 新闻/解决方案 与分类 关系映射 分类与新闻/解决方案 多对多关系   (弃用，分类和新闻改为一对多的关系)
/*DROP TABLE IF EXISTS `cms_article_category_mapping`;
CREATE TABLE `cms_article_category_mapping` (
	`article_category_id` BIGINT NOT NULL COMMENT '新闻/解决方案 分类ID',
	`article_slug` VARCHAR(200) NOT NULL COMMENT '新闻/解决方案 slug',
  `article_language` VARCHAR(50) NOT NULL COMMENT '新闻/解决方案 语言',
	PRIMARY KEY(`article_category_id`, `article_slug`, `article_language`) -- 联合主键
) COMMENT '新闻/解决方案与分类 关系映射';*/



-- 产品分类
DROP TABLE IF EXISTS `cms_product_category`;
CREATE TABLE `cms_product_category` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(100) NOT NULL COMMENT '产品分类分类名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '分类描述',
	`banner` VARCHAR(500) DEFAULT '' COMMENT '分类banner图片',
	`icon` VARCHAR(200) DEFAULT '' COMMENT '分类图标',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '产品分类';


-- 产品属性
DROP TABLE IF EXISTS `cms_product_property`;
CREATE TABLE `cms_product_property` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '产品属性名称',
	`desc` VARCHAR(200) NOT NULL COMMENT '产品属性说明',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '产品属性';




-- 产品
DROP TABLE IF EXISTS `cms_product`;
CREATE TABLE `cms_product` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`product_category_id` BIGINT,
	`drawing_id` BIGINT,
	`name` VARCHAR(100) NOT NULL COMMENT '产品名称',
	`thumbnail` VARCHAR(500) DEFAULT '' COMMENT '缩略图',
	`video` VARCHAR(500) DEFAULT '' COMMENT '视频地址',
	`video_cover` VARCHAR(500) DEFAULT '' COMMENT '视频图片',
	`summary` VARCHAR(500) DEFAULT '' COMMENT '简介',
	`content` TEXT COMMENT '产品详情',
	`view_count` INT DEFAULT 0 COMMENT '访问量',
	`sort` INT COMMENT '排序',
	`status` TINYINT DEFAULT 1 COMMENT '状态 1：发布  0：草稿',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`), -- 主键
	INDEX (`language`),
	FOREIGN KEY(`product_category_id`) REFERENCES `cms_product_category`(`id`),
	FOREIGN KEY(`drawing_id`) REFERENCES `cms_drawing`(`id`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '产品';


-- 产品展示图片
DROP TABLE IF EXISTS `cms_product_carousel`;
CREATE TABLE `cms_product_carousel`(
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`product_id` BIGINT NOT NULL COMMENT '产品Id',
	`src` VARCHAR(500) DEFAULT '' COMMENT '资源地址',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '产品展示图片';


-- 产品属性与产品关系映射
DROP TABLE IF EXISTS `cms_product_property_mapping`;
CREATE TABLE `cms_product_property_mapping` (
	`product_id` BIGINT NOT NULL COMMENT '产品Id',
	`property_id` BIGINT NOT NULL COMMENT '属性Id',
	`value` VARCHAR(200) DEFAULT '' COMMENT '属性值',
	PRIMARY KEY(`product_id`, `property_id`) -- 联合主键
) COMMENT '产品属性与产品关系映射';


/*
图纸模块 （技术支持）
图纸可以作为一个单独模块存在，
也可以与产品进行关联 在产品处添加一个关联图纸的入口，且可以展示已关联的图纸
一个产品可以关联多个图纸 （一个图纸也可以关联多个产品 不做限制）
*/
DROP TABLE IF EXISTS `cms_drawing_category`;
CREATE TABLE `cms_drawing_category` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(100) NOT NULL COMMENT '图纸分类名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '分类描述',
	`banner` VARCHAR(500) DEFAULT '' COMMENT '分类banner图片',
	`icon` VARCHAR(200) DEFAULT '' COMMENT '分类图标',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '图纸分类';


DROP TABLE IF EXISTS `cms_drawing`;
CREATE TABLE `cms_drawing` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`drawing_category_id` BIGINT,
	`name` VARCHAR(100) NOT NULL COMMENT '图纸名称',
	`thumbnail` VARCHAR(500) DEFAULT '' COMMENT '缩略图',
	`video` VARCHAR(500) DEFAULT '' COMMENT '视频地址',
	`video_cover` VARCHAR(500) DEFAULT '' COMMENT '视频图片',
	`summary` VARCHAR(500) DEFAULT '' COMMENT '简介',
	`content` TEXT COMMENT '图纸详情',
	`view_count` INT DEFAULT 0 COMMENT '访问量',
	`sort` INT COMMENT '排序',
	`status` TINYINT DEFAULT 1 COMMENT '状态 1：发布  0：草稿',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`drawing_category_id`) REFERENCES `cms_drawing_category`(`id`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '图纸（技术支持）';


-- 图纸格式
DROP TABLE IF EXISTS `cms_drawing_type`;
CREATE TABLE `cms_drawing_type` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '图纸格式名称',
	`type` VARCHAR(50) NOT NULL COMMENT '格式如：pdf，dwg，step，isg等',
	`desc` VARCHAR(200) NOT NULL COMMENT '图纸格式说明',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	PRIMARY KEY(`id`),
	UNIQUE(`type`)
) COMMENT '图纸格式';


-- 图纸与图纸格式关系映射
DROP TABLE IF EXISTS `cms_drawing_type_mapping`;
CREATE TABLE `cms_drawing_type_mapping` (
	`drawing_id` BIGINT NOT NULL COMMENT '图纸Id',
	`type` VARCHAR(50) COMMENT '图纸格式',
	`url` VARCHAR(200) DEFAULT '' COMMENT '图纸具体地址值',
	PRIMARY KEY(`drawing_id`, `type`), -- 联合主键
	INDEX (`type`),
	FOREIGN KEY(`type`) REFERENCES `cms_drawing_type`(`type`) ON UPDATE CASCADE
) COMMENT '图纸与图纸格式关系映射';



-- 产品与图纸关系映射 改为一对一关系（弃用）
/*DROP TABLE IF EXISTS `cms_product_drawing_mapping`;
CREATE TABLE `cms_product_drawing_mapping` (
	`product_id` BIGINT NOT NULL COMMENT '产品Id',
	`drawing_id` BIGINT NOT NULL COMMENT '图纸Id',
	PRIMARY KEY(`product_id`, `drawing_id`) -- 联合主键
) COMMENT '产品与图纸关系映射';*/


-- 导航菜单
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(100) NOT NULL COMMENT '菜单名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '菜单描述',
	`banner` VARCHAR(500) DEFAULT '' COMMENT '菜单banner图片',
	`icon` VARCHAR(200) DEFAULT '' COMMENT '菜单图标',
	`type` VARCHAR(50) DEFAULT '主菜单' COMMENT '菜单类型：主菜单、顶部菜单、底部菜单',
	`url` VARCHAR(500) DEFAULT '' COMMENT '链接地址',
	`target` VARCHAR(50) DEFAULT '' COMMENT '打开的方式，对应a标点target如：_blank',
	`is_frame` TINYINT DEFAULT 0 COMMENT '是否外链，0：否 1：是',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`product_category_id` bigint(20) DEFAULT NULL COMMENT '产品分类Id',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
    `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '导航菜单';


-- 自定义页面
DROP TABLE IF EXISTS `cms_single_page`;
CREATE TABLE `cms_single_page` (
	`title` VARCHAR(100) NOT NULL COMMENT '自定义页面标题',
	`thumbnail` VARCHAR(500) DEFAULT '' COMMENT '缩略图',
	`summary` VARCHAR(500) DEFAULT '' COMMENT '简介',
	`content` TEXT COMMENT '自定义页面详情',
	`publisher` VARCHAR(50) DEFAULT '' COMMENT '发布人',
	`publish_time` datetime DEFAULT NULL COMMENT '发布时间',
	`view_count` INT DEFAULT 0 COMMENT '访问量',
	`layout` VARCHAR(50) DEFAULT '' COMMENT '布局标志', -- 根据这个标志显示不同的布局组件
	`sort` INT COMMENT '排序',
	`status` TINYINT DEFAULT 1 COMMENT '状态 1：发布  0：草稿',
	`meta_keywords` VARCHAR(200) DEFAULT '' COMMENT 'SEO关键字',
	`meta_description` VARCHAR(500) DEFAULT '' COMMENT 'SEO描述内容',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`language`, `slug`), -- 联合主键
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '自定义页面';


-- 静态资源/附件
DROP TABLE IF EXISTS `cms_attachment`;
CREATE TABLE `cms_attachment` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`title` VARCHAR(200) NOT NULL COMMENT '名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '文件描述',
	`path` VARCHAR(500) DEFAULT '' COMMENT '文件路径',
	`mime_type` VARCHAR(100) DEFAULT '' COMMENT '媒体类型 如：image/png',
	`suffix` VARCHAR(50) DEFAULT '' COMMENT '文件后缀',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX(`suffix`)
) COMMENT '静态资源/附件';


-- 网站配置拓展信息
DROP TABLE IF EXISTS `cms_options`;
CREATE TABLE `cms_options`(
	`key` VARCHAR(256) NOT NULL COMMENT '配置key',
	`value` TEXT COMMENT '配置key',
	`type` VARCHAR(50) DEFAULT '' COMMENT '数据类型/分类，自定义',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '字段说明',
	`is_system` TINYINT DEFAULT 0 COMMENT '是否系统配置 0：否 1：是 为“1”时不能被删除',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`language`, `slug`), -- 联合主键
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '网站配置拓展信息';


-- 微信菜单配置
DROP TABLE IF EXISTS `cms_wechat_menu`;
CREATE TABLE `cms_wechat_menu` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(256) DEFAULT '' COMMENT '菜单名称',
	`type` VARCHAR(50) DEFAULT '' COMMENT '菜单类型 ： click(文本类型)、view(url链接类型)、media_id(图片、图文等素材类型)',
	`content` VARCHAR(256) DEFAULT '' COMMENT '内容',
	`key` VARCHAR(256) DEFAULT '' COMMENT 'key值',
	`sort` INT COMMENT '排序',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`)
) COMMENT '微信菜单配置';


-- 用户自定义微信关键字回复
DROP TABLE IF EXISTS `cms_wechat_reply`;
CREATE TABLE `cms_wechat_reply` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`keyword` VARCHAR(256) DEFAULT '' COMMENT '关键字',
	`content` TEXT COMMENT '回复内容',
	`type` INT COMMENT '1:收到消息回复，2：关键词回复，3：被关注回复',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`)
) COMMENT '用户自定义微信关键字回复';



-- 匹配产品分类
DROP TABLE IF EXISTS `cms_match_product_category`;
CREATE TABLE `cms_match_product_category` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`parent_id` BIGINT DEFAULT 0 COMMENT '父级Id 默认0顶级',
	`name` VARCHAR(100) NOT NULL COMMENT '匹配产品分类分类名称',
	`desc` VARCHAR(500) DEFAULT '' COMMENT '分类描述',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`),
	INDEX (`language`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '匹配产品分类';



-- 匹配产品
DROP TABLE IF EXISTS `cms_match_product`;
CREATE TABLE `cms_match_product` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`match_product_category_id` BIGINT,
	`name` VARCHAR(100) NOT NULL COMMENT '匹配产品名称',
	`thumbnail` VARCHAR(500) DEFAULT '' COMMENT '缩略图',
	`summary` VARCHAR(500) DEFAULT '' COMMENT '简介',
	`content` TEXT COMMENT '匹配产品详情',
	`sort` INT COMMENT '排序',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	`language` VARCHAR(50) NOT NULL COMMENT '语言标识',
	`slug` VARCHAR(200) NOT NULL COMMENT '显示标识，与language一起确认数据',
	`create_by` VARCHAR(100) DEFAULT NULL COMMENT '创建者',
  `update_by` VARCHAR(100) DEFAULT NULL COMMENT '更新者',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	PRIMARY KEY(`id`), -- 主键
	INDEX (`language`),
	FOREIGN KEY(`match_product_category_id`) REFERENCES `cms_match_product_category`(`id`),
	FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '匹配产品';

-- 大事件
DROP TABLE IF EXISTS `cms_big_event`;
CREATE TABLE `cms_big_event`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件标题',
  `summary` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '概述',
  `date` date NULL DEFAULT NULL COMMENT '事件日期',
  `year` int(255) NULL DEFAULT NULL COMMENT '年份',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `active` tinyint(4) NULL DEFAULT NULL COMMENT '1：激活 0：未激活',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建事件',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新事件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX (`language`),
  FOREIGN KEY(`language`) REFERENCES `cms_language`(`language`) ON UPDATE CASCADE
) COMMENT '大事件' ;

-- 参与匹配属性
DROP TABLE IF EXISTS `cms_match_property`;
CREATE TABLE `cms_match_property` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`name` VARCHAR(50) NOT NULL COMMENT '图纸格式名称',
	`json` text COMMENT '属性数据选项 如：[{label: "是", value: true}, {label: "否", value: false}]',
	`desc` VARCHAR(200) NOT NULL COMMENT '属性说明',
	`active` TINYINT DEFAULT 1 COMMENT '1：激活  0：未激活',
	PRIMARY KEY(`id`)
) COMMENT '匹配属性';


-- 匹配表，增加图纸Id
DROP TABLE IF EXISTS `cms_match`;
CREATE TABLE `cms_match` (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`product_id` BIGINT NOT NULL COMMENT '产品Id',
	`drawing_id` BIGINT COMMENT '图纸id',
	`show_property` TINYINT DEFAULT 1 COMMENT '1：属性参与匹配  0：属性不参与匹配',
	PRIMARY KEY(`id`),
	FOREIGN KEY(`drawing_id`) REFERENCES `cms_drawing`(`id`)
) COMMENT '匹配表';


-- 匹配表和匹配属性映射，添加匹配属性Id
DROP TABLE IF EXISTS `cms_match_property_mapping`;
CREATE TABLE `cms_match_property_mapping` (
	`match_id` BIGINT NOT NULL COMMENT '匹配表ID',
	`match_property_id` BIGINT COMMENT '匹配属性ID',
	`match_property_value` VARCHAR(256) NOT NULL COMMENT '匹配属性的值'
) COMMENT '匹配表与匹配属性映射';


-- 匹配产品与匹配表映射
DROP TABLE IF EXISTS `cms_match_product_mapping`;
CREATE TABLE `cms_match_product_mapping` (
	`match_id` BIGINT NOT NULL COMMENT '匹配表ID',
	`match_product_id` BIGINT NOT NULL COMMENT '匹配产品ID'
) COMMENT '匹配产品与匹配表映射';

-- 用户与菜单表映射
DROP TABLE IF EXISTS `cms_user_menu_relate`;
CREATE TABLE `cms_user_menu_relate` (
	`user_id` BIGINT NOT NULL COMMENT '用户表ID',
	`menu_id` BIGINT NOT NULL COMMENT '菜单表ID',
	`title` VARCHAR(256) DEFAULT NULL COMMENT '模块标题',
    `path` VARCHAR(256) DEFAULT NULL COMMENT '跳转路径',
    `icon` VARCHAR(256) DEFAULT NULL COMMENT '图标'
) COMMENT '用户与菜单表映射';

-- 添加数据库外键
SET FOREIGN_KEY_CHECKS = 1;













