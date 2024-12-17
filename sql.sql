DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图：';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
  `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
  `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图标：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。';
insert into `forum_type` values ('1','分类一','分类一','/article/list?type_id=1','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `forum_type` values ('2','分类二','分类二','/article/list?type_id=2','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `forum_type` values ('3','分类三','分类三','/article/list?type_id=3','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告：';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章频道：用于汇总浏览文章，在不同频道下展示不同文章。';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞：';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '论坛id',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `praise_len` int(10) DEFAULT '0' COMMENT '点赞数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(125) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `img` text COMMENT '封面图',
  `content` longtext COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '发帖人头像：',
  `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '论坛分类：[0,1000]用来搜索指定类型的论坛帖',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='论坛：';
insert into `forum` values ('1','100','1','小明','1','150','测试标题','关键字1','描述','#','标签','/upload/forum_1.jpg','<h1>fafgwagbagbwgwag</h1>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','http://localhost:5000/upload/jingdian (11)_15.jpg','分类二');
insert into `forum` values ('2','100','2','小明','0','30','测试标题2','关键字2','dec','#','标签','/upload/forum_2.jpg','<p>测试文章内容2</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类一');
insert into `forum` values ('3','100','2','小红','0','42','测试标题3','关键字3','dec2','#','标签','/upload/forum_3.jpg','<p>测试文章内容3</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类二');
insert into `forum` values ('4','100','2','小红','0','22','测试标题4','关键字4','dec3','#','标签','/upload/forum_4.jpg','<p>测试文章内容4</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类三');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论：';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏：';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `student_users`;
CREATE TABLE `student_users`(student_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生用户ID',
`student_name` varchar(64) comment '学生姓名',
`gender` varchar(64) comment '性别',
`department_information` varchar(64) comment '院系信息',
`class_information` varchar(64) comment '班级信息',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生用户';

DROP TABLE IF EXISTS `teacher_user`;
CREATE TABLE `teacher_user`(teacher_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师用户ID',
`teacher_name` varchar(64) comment '教师姓名',
`gender_of_teachers` varchar(64) comment '教师性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师用户';

DROP TABLE IF EXISTS `course_information`;
CREATE TABLE `course_information`(course_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程信息ID',
`course_no` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`cover` varchar(255) comment '封面',
`course_type` varchar(64) comment '课程类型',
`class_time` varchar(64) comment '上课时间',
`class_location` varchar(64) comment '上课地点',
`number_of_people_remaining` int(11) DEFAULT 0 comment '剩余人数',
`teacher_user` int(11) DEFAULT 0 comment '教师用户',
`teacher_name` varchar(64) comment '教师姓名',
`course_introduction` text comment '课程介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`timer_title` varchar(64) DEFAULT NULL comment '计时器标题',
`timing_start_time` datetime DEFAULT NULL COMMENT '计时开始时间',
`timing_end_time` datetime DEFAULT NULL COMMENT '计时结束时间',
`limit_times` int(8) DEFAULT 0 NOT NULL comment '限制次数',
`limit_type` tinyint(2) DEFAULT 2 NOT NULL comment '限制次数类型1-每天次，2-总计次',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程信息';
insert into `course_information` values (1,'课程编号1','课程名称1','/api/upload/1567800992165003265.jpg','课程类型1','上课时间1','上课地点1',1,0,'教师姓名1','此处可上传文字、图片、视频、超链接、表格等内容区1',878,501,0,'计时器标题1','2023-02-12','2024-02-12',0,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (2,'课程编号2','课程名称2','/api/upload/1565548561716740096.jpg','课程类型2','上课时间2','上课地点2',2,0,'教师姓名2','此处可上传文字、图片、视频、超链接、表格等内容区2',182,307,0,'计时器标题2','2023-02-12','2024-02-12',1,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (3,'课程编号3','课程名称3','/api/upload/1567801149845667841.jpg','课程类型3','上课时间3','上课地点3',3,0,'教师姓名3','此处可上传文字、图片、视频、超链接、表格等内容区3',969,469,0,'计时器标题3','2023-02-12','2024-02-12',2,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (4,'课程编号4','课程名称4','/api/upload/1565548409266372609.jpg','课程类型4','上课时间4','上课地点4',4,0,'教师姓名4','此处可上传文字、图片、视频、超链接、表格等内容区4',561,882,0,'计时器标题4','2023-02-12','2024-02-12',3,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (5,'课程编号5','课程名称5','/api/upload/1565548359928774656.jpg','课程类型5','上课时间5','上课地点5',5,0,'教师姓名5','此处可上传文字、图片、视频、超链接、表格等内容区5',278,826,0,'计时器标题5','2023-02-12','2024-02-12',4,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (6,'课程编号6','课程名称6','/api/upload/1565548285026893825.jpg','课程类型6','上课时间6','上课地点6',6,0,'教师姓名6','此处可上传文字、图片、视频、超链接、表格等内容区6',154,463,0,'计时器标题6','2023-02-12','2024-02-12',5,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (7,'课程编号7','课程名称7','/api/upload/1565548223559368704.jpg','课程类型7','上课时间7','上课地点7',7,0,'教师姓名7','此处可上传文字、图片、视频、超链接、表格等内容区7',414,628,0,'计时器标题7','2023-02-12','2024-02-12',6,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_information` values (8,'课程编号8','课程名称8','/api/upload/1565548171524833281.jpg','课程类型8','上课时间8','上课地点8',8,0,'教师姓名8','此处可上传文字、图片、视频、超链接、表格等内容区8',298,951,0,'计时器标题8','2023-02-12','2024-02-12',7,2,'2023-02-12 11:11:49','2023-02-12 11:11:49');

DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type`(course_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程类型ID',
`course_type` varchar(64) comment '课程类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程类型';
insert into `course_type` values (1,'课程类型1',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (2,'课程类型2',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (3,'课程类型3',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (4,'课程类型4',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (5,'课程类型5',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (6,'课程类型6',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (7,'课程类型7',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_type` values (8,'课程类型8',0,'2023-02-12 11:11:49','2023-02-12 11:11:49');

DROP TABLE IF EXISTS `course_schedule`;
CREATE TABLE `course_schedule`(course_schedule_id int(11) NOT NULL AUTO_INCREMENT COMMENT '选课课表ID',
`course_no` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`cover` varchar(255) comment '封面',
`course_type` varchar(64) comment '课程类型',
`class_time` varchar(64) comment '上课时间',
`class_location` varchar(64) comment '上课地点',
`teacher_user` int(11) DEFAULT 0 comment '教师用户',
`teacher_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`confirm_the_number_of_people` varchar(64) comment '确认人数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_schedule_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '选课课表';
insert into `course_schedule` values (1,'课程编号1','课程名称1','/api/upload/1565548359928774656.jpg','课程类型1','上课时间1','上课地点1',0,'教师姓名1',0,'学生姓名1','确认人数1','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (2,'课程编号2','课程名称2','/api/upload/1567800992165003265.jpg','课程类型2','上课时间2','上课地点2',0,'教师姓名2',0,'学生姓名2','确认人数2','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (3,'课程编号3','课程名称3','/api/upload/1565548223559368704.jpg','课程类型3','上课时间3','上课地点3',0,'教师姓名3',0,'学生姓名3','确认人数3','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (4,'课程编号4','课程名称4','/api/upload/1565548409266372609.jpg','课程类型4','上课时间4','上课地点4',0,'教师姓名4',0,'学生姓名4','确认人数4','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (5,'课程编号5','课程名称5','/api/upload/1567801149845667841.jpg','课程类型5','上课时间5','上课地点5',0,'教师姓名5',0,'学生姓名5','确认人数5','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (6,'课程编号6','课程名称6','/api/upload/1565548561716740096.jpg','课程类型6','上课时间6','上课地点6',0,'教师姓名6',0,'学生姓名6','确认人数6','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (7,'课程编号7','课程名称7','/api/upload/1565548285026893825.jpg','课程类型7','上课时间7','上课地点7',0,'教师姓名7',0,'学生姓名7','确认人数7','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');
insert into `course_schedule` values (8,'课程编号8','课程名称8','/api/upload/1565548171524833281.jpg','课程类型8','上课时间8','上课地点8',0,'教师姓名8',0,'学生姓名8','确认人数8','未审核','',0,0,'2023-02-12 11:11:49','2023-02-12 11:11:49');

insert into `auth` values ('1','管理员','学生用户','student_users','学生用户','/student_users/table','','_blank','1','1','1','1','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('2','管理员','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','1','1','1','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('3','管理员','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','1','1','1','1','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('4','管理员','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','1','1','1','1','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('5','管理员','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"figure":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('6','管理员','课程信息','course_information','课程信息详情','/course_information/view','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('7','管理员','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('8','管理员','课程信息','course_information','课程信息详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('9','管理员','课程类型','course_type','课程类型','/course_type/table','','_blank','1','1','1','1','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('10','管理员','课程类型','course_type','课程类型详情','/course_type/view','','_blank','1','1','1','1','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('11','管理员','选课课表','course_schedule','选课课表','/course_schedule/table','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{"examine":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('12','管理员','选课课表','course_schedule','选课课表详情','/course_schedule/view','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('13','管理员','选课课表','course_schedule','选课课表','/course_schedule/edit','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('14','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('15','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('16','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('17','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('19','管理员','论坛','forum','论坛列表','/forum/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('20','管理员','论坛','forum','论坛详情','/forum/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('21','管理员','论坛','forum','学校论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('22','管理员','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('23','管理员','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('24','管理员','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('25','管理员','新闻','article','新闻列表','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('26','管理员','新闻','article','新闻详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('27','管理员','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('28','管理员','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('29','管理员','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('30','管理员','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('31','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('32','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('33','管理员','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('34','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('35','游客','学生用户','student_users','学生用户','/student_users/table','','_blank','1','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('36','游客','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('37','游客','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('38','游客','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('39','游客','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"figure":false,"can_show_comment":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('40','游客','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('41','游客','课程信息','course_information','课程信息','/course_information/list','top','_blank','0','0','0','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('42','游客','课程信息','course_information','课程信息详情','/course_information/details','','_blank','0','0','0','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"can_comment":false,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('43','游客','课程类型','course_type','课程类型','/course_type/table','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('44','游客','课程类型','course_type','课程类型详情','/course_type/view','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('45','游客','选课课表','course_schedule','选课课表','/course_schedule/table','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{"examine":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('46','游客','选课课表','course_schedule','选课课表详情','/course_schedule/view','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('47','游客','选课课表','course_schedule','选课课表','/course_schedule/edit','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('48','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('49','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('50','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('51','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('52','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('53','游客','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('54','游客','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('55','游客','论坛','forum','学校论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('56','游客','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('57','游客','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('58','游客','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('59','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('60','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('61','游客','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('62','游客','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('63','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('64','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('65','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('66','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('67','游客','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('68','游客','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('69','学生用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('70','学生用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('71','学生用户','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('72','学生用户','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('73','学生用户','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"figure":false,"can_show_comment":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('74','学生用户','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('75','学生用户','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('76','学生用户','课程信息','course_information','课程信息详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('77','学生用户','课程类型','course_type','课程类型','/course_type/table','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('78','学生用户','课程类型','course_type','课程类型详情','/course_type/view','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('79','学生用户','选课课表','course_schedule','选课课表','/course_schedule/table','','_blank','0','0','0','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{"examine":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('80','学生用户','选课课表','course_schedule','选课课表详情','/course_schedule/view','','_blank','0','0','0','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('81','学生用户','选课课表','course_schedule','选课课表','/course_schedule/edit','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('82','学生用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('83','学生用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('84','学生用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('85','学生用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('86','学生用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('87','学生用户','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('88','学生用户','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('89','学生用户','论坛','forum','学校论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('90','学生用户','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('91','学生用户','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('92','学生用户','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('93','学生用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('94','学生用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('95','学生用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('96','学生用户','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('97','学生用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('98','学生用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('99','学生用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('100','学生用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('101','学生用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('102','学生用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('103','教师用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('104','教师用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information','student_name,gender,department_information,class_information',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('105','教师用户','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('106','教师用户','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','0','0','0','0','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers','teacher_name,gender_of_teachers',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('107','教师用户','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"figure":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('108','教师用户','课程信息','course_information','课程信息详情','/course_information/view','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('109','教师用户','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('110','教师用户','课程信息','course_information','课程信息详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction','course_no,course_name,cover,course_type,class_time,class_location,number_of_people_remaining,teacher_user,teacher_name,course_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('111','教师用户','课程类型','course_type','课程类型','/course_type/table','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('112','教师用户','课程类型','course_type','课程类型详情','/course_type/view','','_blank','0','0','0','0','course_type','course_type','course_type',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('113','教师用户','选课课表','course_schedule','选课课表','/course_schedule/table','','_blank','0','1','0','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{"examine":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('114','教师用户','选课课表','course_schedule','选课课表详情','/course_schedule/view','','_blank','0','1','0','1','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('115','教师用户','选课课表','course_schedule','选课课表','/course_schedule/edit','','_blank','0','0','0','0','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people','course_no,course_name,cover,course_type,class_time,class_location,teacher_user,teacher_name,student_users,student_name,confirm_the_number_of_people',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('116','教师用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('117','教师用户','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('118','教师用户','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('119','教师用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('120','教师用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('121','教师用户','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('122','教师用户','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('123','教师用户','论坛','forum','学校论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('124','教师用户','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('125','教师用户','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('126','教师用户','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('127','教师用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('128','教师用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('129','教师用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('130','教师用户','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('131','教师用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('132','教师用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('133','教师用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('134','教师用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('135','教师用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `auth` values ('136','教师用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `user_group` values ('3','100','学生用户',null,'student_users','student_users_id','0','3','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `user_group` values ('4','100','教师用户',null,'teacher_user','teacher_user_id','0','0','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1566583052795117568.jpg','540','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1566582988462882817.jpg','986','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1566582883651420161.jpg','350','2023-02-12 11:11:49.0','2023-02-12 11:11:49.0');
insert into `article` values ('1','《星火燎原》：用鲜血和生命写就的红色经典','图书','943','0','2023-02-12 11:11:50.0','2023-02-12 11:11:50.0',null,null,null,'<p class="ql-align-center"><img src="http://www.qstheory.cn/dukan/qs/2019-10/16/1125102433_15710381648931n.jpg"></p><p>没有一部书，像《星火燎原》这样，荟萃了这么多开国将帅和革命前辈的红色记忆。它是光照千秋的东方史诗，鲜血写就的红色家谱，我党我军宝贵的精神财富。</p><p>1956年7月，中央军委批准发起“中国人民解放军三十年”征文活动，广泛征集反映我军在革命战争各个历史时期英勇斗争不朽业绩的文章和珍贵史料，号召当年的老同志和军内外广大干部群众踊跃撰稿。从撰稿作者看，既有开国将帅又有普通战士，既有省部级领导干部又有复转军人，参与面之广、参与人员之多，在新中国出版史上绝无仅有。从文章内容看，展示了我军各个革命时期的斗争生活，既有珍贵的史料价值，又有很高的文学价值，堪称“回忆录之最”。毛泽东亲笔题写书名，朱德作序，刘少奇、周恩来、邓小平等党和国家领导人或题词或修改稿件。该书自1958年至1963年出版8卷，先后被翻译成英、法、德、日等13种文字，在国内外发行近千万册。其中《“朱德的扁担”》、《老山界》、《记一辆纺车》等30余篇文章被选入全国中小学语文课本，《红色娘子军》、《潘虎》等被改编成电影或戏剧作品，被誉为“用红宝石砌成的万里长城，记述中国革命战争的东方史诗”，教育了几代人。</p><p>习近平总书记多次强调，要把红色资源利用好，把红色传统发扬好，把红色基因传承好。在庆祝中华人民共和国成立70周年之际，中央军委政治工作部组织编辑《星火燎原》精选本，从2009年出版的《星火燎原全集》中精选部分文章，通过多种产品形态，浓墨重彩地讲述中国故事、中国共产党故事、人民军队故事，系统呈现我党我军的“红色家谱”，让信仰之火熊熊不息，让红色基因代代相传，让红色精神激发力量。</p><p>学好用好《星火燎原》这一红色经典，决不是为了到历史中采摘耀眼的花朵，而是为了“获取熔岩一般运行奔腾的地火”。</p><p>学习红色经典，铸牢铁心向党的忠诚。从《“八一”的枪声》到《古田会议前后》，从《遵义会议的光芒》到《红日照陕甘》……《星火燎原》告诉我们一条真理：只要跟党走，一定能胜利。今天，实现党在新时代的强军目标、全面建成世界一流军队，首要的是坚持政治建军原则，矢志不渝地听党话、跟党走，增强“四个意识”、坚定“四个自信”、做到“两个维护”，贯彻军委主席负责制。只有全体人民跟党走，才能实现“两个一百年”奋斗目标、实现中华民族伟大复兴。</p><p>学习红色经典，强固坚如磐石的信念。革命理想高于天。崇高的理想信念是全党、全国人民和人民军队勇往直前的精神力量，是我们心中熊熊燃烧的精神火炬。今天，我们依然能从《星火燎原》中汲取精神动力，筑牢信念之基，补足精神之钙，在任何时候任何情况下都要做到理想信念不动摇、革命意志不涣散、奋斗精神不懈怠。</p><p>学习红色经典，锻造骁勇善战的本领。英雄的人民军队，在党领导的22年武装革命斗争中，以无往不胜的英雄气概、坚忍不拔的革命毅力、灵活机动的战略战术、英勇顽强的战斗作风，克服了各种难以想象的艰难困苦，夺取了中国革命的伟大胜利。今天，我们要赢得具有许多新的历史特点的伟大斗争的胜利，依然要像《飞夺泸定桥》那样一往无前，像《陈庄战斗》那样英勇顽强，像《董存瑞》那样奋不顾身……</p><p>学习红色经典，增强创新制胜的智慧。从红军时期的“十六字诀”，到抗日战争时期的“持久战”，再到解放战争时期的“十大军事原则”，人民军队书写了创新制胜的生动史诗。《星火燎原》告诉我们，只有不断创新，才能获得发展进步的生机活力，才能永远立于不败之地。我们要坚持向创新要战斗力、生产力，努力学习新知识、研究新情况、解决新问题，使自己的思想观念、思维方式、工作方法不断与时俱进。</p><p>学习红色经典，保持作风优良的本色。作风优良塑造英雄部队，作风松散搞垮常胜之师。人民军队素以作风优良、纪律严明著称于世。从《“三大纪律 八项注意”》、《一根灯芯》、《大别山一日》等文章可以看出，艰苦奋斗、官兵一致、纪律严明是我军的鲜明特色和政治优势。只有夯实依法治军、从严治军这个强军之基，持之以恒推进作风建设和反腐败斗争，才能保持人民军队的好作风、好样子。学习红色经典，对我们推进党的建设新的伟大工程，保持党的优良作风，也同样具有深远的意义。</p><p>学习红色经典，赓续鱼水情深的传统。谁把人民放在心上，人民就把谁放在心上。人民军队来自人民、为了人民，始终与人民同呼吸、共命运、心连心，完全彻底为人民奋斗。《“红军鞋”》、《一袋干粮》、《淮河风雨舟》等篇章，就是军民团结如一人的生动体现。新时代，我们在治党治国治军各个方面，都要始终把人民放在心中最高的位置，始终同人民想在一起、干在一起。</p><p>“给人以星火者，必怀火炬。”《星火燎原》的主要编纂者黄涛，把自己的信仰和整个生命都融入了《星火燎原》这一鸿篇巨制，是老一代军事新闻出版人的杰出代表。党史、新中国史、军史，是一座取之不尽、用之不竭的精神宝藏，我们要接过前辈手中的火炬，深挖细掘、披沙拣金，自觉承担起举旗帜、聚民心、育新人、兴文化、展形象的使命任务。</p><p>为满足读者特别是广大青少年多元化、智能化的阅读需求，我们在出版《星火燎原》精选本的同时，专门配套制作了一系列融媒体产品，使读者可以扫描二维码“听书”、观看微视频、欣赏沙画和动漫、体验AR和H5，实现了线上阅读与线下阅读、纸质媒体与新媒体的多样式、广覆盖。</p>','/api/upload/1601841035405688832.jpg',null);
insert into `article` values ('2','《增强脚力、眼力、脑力、笔力学习读本》出版','图书','872','0','2023-02-12 11:11:50.0','2023-02-12 11:11:50.0',null,null,null,'<p class="ql-align-center"><img src="http://www.qstheory.cn/books/2019-04/15/1124317534_15541931831011n.jpg"></p><p>《增强脚力、眼力、脑力、笔力学习读本》近日由人民日报出版社出版。不断增强脚力、眼力、脑力、笔力，努力打造一支政治过硬、本领高强、求实创新、能打胜仗的宣传思想工作队伍，是习近平同志对新形势下宣传思想战线队伍建设提出的总要求。该书收录了中央领导同志和部分省委领导同志、中央主要媒体领导同志及业内专家学者的相关文章，按照增强“四力”教育实践工作要求，分为提高政治素质、提升业务本领、锐意创新创造、锤炼优良作风四个专题，深刻阐释了增强“四力”的重要意义、丰富内涵和目标任务，对于宣传思想战线扎实推进增强“四力”教育实践工作具有借鉴意义。</p>','/api/upload/1601841130268262401.jpg',null);
insert into `article` values ('3','中央宣传部等公布“书映百年伟业”好书荐读12月书单','图书','110','0','2023-02-12 11:11:50.0','2023-02-12 11:11:50.0',null,null,null,'<p>“书映百年伟业——庆祝中国共产党成立100周年好书荐读”活动12月书单已公布，欢迎读者收藏学习。</p><p>为庆祝中国共产党成立100周年，引导干部群众学史明理、学史增信、学史崇德、学史力行，中央宣传部联合有关部门和单位共同开展“书映百年伟业——庆祝中国共产党成立100周年好书荐读”活动，于2021年4月至12月，每月公布当月推荐书单。</p><p>推荐书目围绕中国共产党成立100周年这一主题主线，力求满足不同读者群体阅读需求，既有权威读本、史学著作、理论力作，也有大众化分众化读物；既有长篇小说、报告文学，也有画册、连环画等；既有纸质图书，也有融媒体出版物。通过好书荐读活动，大力唱响共产党好、社会主义好、改革开放好、伟大祖国好、各族人民好的时代主旋律。</p><p class="ql-align-center">“书映百年伟业——庆祝中国共产党成立100周年好书荐读”活动12月书单</p><p class="ql-align-center"><img src="http://www.qstheory.cn/books/2021-12/23/1128193457_16402491326291n.jpg"></p><p class="ql-align-center"><img src="http://www.qstheory.cn/books/2021-12/23/1128193457_16402491480881n.jpg"></p><p class="ql-align-center"><img src="http://www.qstheory.cn/books/2021-12/23/1128193457_16402488792961n.jpg"></p><p><br></p>','/api/upload/1601840890593148929.jpg',null);
insert into `article` values ('4','《学习时报》刊发罗文署名文章：我国市场监管事业取得历史性成就发生历史性变革','图书','93','0','2023-02-12 11:11:50.0','2023-02-12 11:11:50.0',null,null,null,'<p><img src="http://img.tszix.org.cn/202212/13fbe4f596438e5.jpg"></p><p>以习近平同志为核心的党中央高度重视市场监管工作。党的十八大以来,习近平总书记多次作出重要指示批示,深刻阐明了新时代市场监管工作一系列重大理论和实践问题,为市场监管工作指明了方向、提供了根本遵循。2018年,党中央印发《深化党和国家机构改革方案》,决定组建市场监管总局,实现了市场综合监管和综合执法,更加突显出市场监管在政府架构中的重要作用。全国各级市场监管部门坚持以习近平新时代中国特色社会主义思想为指导,深入学习和贯彻落实习近平总书记关于市场监管工作的重要论述,全面贯彻落实党中央、国务院决策部署,坚持以人民为中心,坚持稳中求进工作总基调,立足新发展阶段,完整、准确、全面贯彻新发展理念,构建新发展格局,推动高质量发展,统筹疫情防控和经济社会发展,统筹发展和安全,牢记“国之大者”,坚持系统观念,持续深化改革、优化监管、提升服务,纵深推进全面从严治党,着力加强队伍建设,推动市场监管事业取得历史性成就、发生历史性变革,市场主体蓬勃发展,市场环境日益完善,质量强国、知识产权强国建设扎实推进,高效服务现代化经济体系建设加快推进,有力支撑国家经济实力、科技实力、综合国力跃上新台阶,促进人民生活品质显著提升。</p><p>服务构建新发展格局,全国统一大市场建设取得重大成果</p><p>习近平总书记深刻指出,构建新发展格局,迫切需要加快建设高效规范、公平竞争、充分开放的全国统一大市场,建立全国统一的市场制度规则,促进商品要素资源在更大范围内畅通流动;强调要加快完善国内统一大市场,形成供需互促、产销并进的良性循环,塑造市场化、法治化、国际化营商环境;要千方百计把市场主体保护好,激发市场主体活力,弘扬企业家精神,推动企业发挥更大作用实现更大发展,为经济发展积蓄基本力量。我们紧紧围绕加快构建新发展格局,着力完善全国统一的市场制度规则,加强高标准市场体系建设,大力培育充满活力的市场主体,坚决破除妨碍全国统一市场建设的地方保护和市场分割,促进要素资源在更大范围内畅通流动,推动我国市场尽快实现由大到强的历史性转变。</p><p>统一的市场规则逐步完善。关于加快建设全国统一大市场的意见为建设全国统一大市场提供了行动纲领,市场主体登记管理条例第一次全面统一各类市场主体登记制度,关于强化反垄断深入推进公平竞争政策实施的意见第一次形成我国公平竞争顶层设计政策框架。反垄断法、反不正当竞争法及时修订,7部配套规章和8部平台经济、经营者合规等重点行业和领域指南发布实施,构建起由多部法律、法规、规章和指南构成,覆盖线上线下、日趋系统完备的市场公平竞争制度规则体系。</p><p>破除行政垄断和市场垄断成效显著。聚焦民生关切和产业发展重要领域,2018年以来共查处各类垄断案件554件,审结经营者集中案件2696件,查办各类不正当竞争案件4.6万件。推动在全国范围内建立公平竞争审查制度,大力清理和废除妨碍全国统一市场和公平竞争的各种规定和做法,国家、省、市、县四级政府公平竞争审查实现全覆盖,审查政策措施文件493万件,持续强化滥用行政权力排除、限制竞争执法,有力维护市场公平竞争秩序、维护各类市场主体合法权益、维护消费者权益和社会公共利益,促进我国超大规模市场生态持续优化。</p><p>各类市场主体活力充分激发。纵深推进商事制度改革,先后实施注册资本从实缴改为认缴、从“先照后证”到照后减证、从改革注册登记到精简经营许可等一系列改革举措,构建起简约高效、公正透明、宽进严管的行业准营规则体系,市场主体制度性成本持续下降。大力支持市场主体发展,建立扶持个体工商户发展部际联席会议制度,加大对个体工商户的政策支持,加大涉企收费规范治理力度,近五年累计退还企业120亿元。着力完善统筹活力和秩序的事中事后监管措施,以信用监管为基础的新型监管机制基本形成。我国市场主体呈现蓬勃发展势头,从2012年的5500万户快速增长到目前的1.64亿户,增长了近2倍,其中企业和个体工商户分别历史性地跃上5000万户和1亿户的大台阶。</p><p>聚焦高质量发展主题,质量强国建设取得重要进展</p><p>习近平总书记强调指出,要树立质量第一的强烈意识,下最大气力抓全面提高质量,用质量优势对冲成本上升劣势;让提高供给质量的理念深入到每个行业、每个企业心目中,使重视质量、创造质量成为社会风尚。我们深刻把握新时代高质量发展主题,紧扣我国社会主要矛盾深刻变化,坚持以深化供给侧结构性改革为主线,以满足人民日益增长的美好生活需要为根本目的,不断完善质量管理制度措施,积极建设适配现代化经济体系的质量基础设施,全面提高产品和服务质量,着力提升重点产业行业质量竞争力,推动经济发展质量变革、效率变革、动力变革,质量强国建设迈出坚实步伐。</p><p>质量管理顶层设计更加完善。质量强国建设纲要发布实施,明确了质量强国建设的总体目标、基本路径、重大举措。国家标准化发展纲要、计量发展规划等相继出台,标准化、计量等工作政策体系进一步健全。以产品质量法、标准化法、计量法等26部法律法规、142部部门规章为主干的法律体系逐步形成。质量工作责任制落实显著加强,质量工作考核纳入中央组织部对领导班子和领导干部的考核内容。</p><p>质量基础设施建设扎实推进。现代先进测量体系建设取得新进展,发布185项国家计量基准和6.3万余项社会公用计量标准,量值传递溯源体系进一步完善,获得国际承认的校准和测量能力达到1859项,国际排名升至第二。建立政府主导制定与市场自主制定相协同的新型标准体系,发布国家标准4万多项、行业标准7.8万多项、地方标准6万多项,团体标准4.3万项。覆盖一二三产业和社会事业各领域,主要消费品与国际标准一致性程度超过95%,国际标准化贡献率跃居全球第三。建立与国际接轨的认证认可体系,强制性产品认证范围覆盖20大类150多种产品。</p><p>质量竞争力水平明显提高。深入开展质量提升行动,推动企业练好内功、加强全面质量管理和品牌建设,一些地方以技术、标准、品牌、质量、服务为核心的竞争新优势加快形成,涌现出一大批享有国际声誉的优质知名品牌,质量竞争型产业规模不断扩大,产业质量竞争水平持续提升,形成一批先导性、支柱性产业集群。截至2021年,我国制造业产品质量合格率连续6年达到93%以上,处于历史最高水平,制造业质量竞争力指数达到84.91,商贸、旅游、物流等服务质量明显改善,重点服务行业和公共服务质量满意度稳定在“比较满意”区间。</p><p>坚持科技自立自强,知识产权强国建设成效显著</p><p>习近平总书记强调,加强知识产权保护,这是完善产权保护制度最重要的内容,也是提高中国经济竞争力最大的激励;必须从国家战略高度和进入新发展阶段要求出发,全面加强知识产权保护工作,促进建设现代化经济体系,激发全社会创新活力。我们坚持科技自立自强,深入实施创新驱动发展战略,着力完善、深入实施严格的知识产权保护制度,强化全链条知识产权保护,全面提升知识产权创造、运用、保护、管理和服务水平,更大力度加强知识产权保护国际合作,加快知识产权强国建设步伐,推动我国从知识产权引进大国向知识产权创造大国转变、知识产权工作从追求数量向提高质量转变取得显著成效。</p><p>知识产权政策体系日益完善。深入实施国家知识产权战略行动计划(2014—2020年)、关于新形势下加快知识产权强国建设的若干意见、“十三五”国家知识产权保护和运用规划、知识产权强国建设纲要(2021—2035年)、“十四五”国家知识产权保护和运用规划等相继发布实施,明确了知识产权强国建设的原则要求、发展目标、重大举措。31个省(自治区、直辖市)出台配套方案和政策措施。知识产权强国建设顶层设计不断完善,政策体系不断健全,纵向联动、横向协同的工作机制高效运行,全社会关心支持知识产权工作的氛围日益浓厚。</p><p>知识产权公共服务水平大幅提升。目前高价值专利审查周期已压缩至13.0个月,发明专利平均审查周期压减至16.8个月,商标注册平均审查周期稳定在4个月,提前完成国务院提出的五年压减周期目标任务。实现知识产权信息公共服务机构在省级层面和副省级城市全覆盖,建成101家世界知识产权组织技术与创新支持中心(TISC)和80家高校国家知识产权信息服务中心。</p><p>知识产权协同保护进一步加强。专利侵权纠纷行政裁决工作机制不断完善,打击知识产权侵权假冒等违法行为成效明显,知识产权快速协同保护机制建设力度加大。截至目前,布局建设国家级知识产权保护中心60家、全国知识产权快速维权中心35家,筹建国家地理标志产品保护示范区50个。</p><p>知识产权创造数量质量持续双提升。国内专利商标申请量连续多年稳居世界首位,2021年国内(不含港澳台)每万人口高价值发明专利拥有量达到7.5件;知识产权运用效应日益凸显,2021年全国专利商标质押融资总额达到3098亿元,知识产权使用费出口额达到760.2亿元,比上年增长27.1%。知识产权保护已成为实施创新驱动发展战略、塑造我国发展新优势的重要支撑。</p><p>全力以赴保障人民群众生命财产安全,市场监管领域安全监管水平大幅提升</p><p>习近平总书记强调,对直接关系人民群众生命财产安全、公共安全,以及潜在风险大、社会风险高的重点领域,要实施重点监管,防范化解重大风险;食品安全关系人民身体健康和生命安全,必须坚持最严谨的标准、最严格的监管、最严厉的处罚、最严肃的问责;确保药品安全是各级党委和政府义不容辞之责,要始终把人民群众的身体健康放在首位;促进形成公平竞争的市场环境,为各类市场主体特别是中小企业创造广阔的发展空间,更好保护消费者权益。我们深入践行以人民为中心的发展思想,坚持人民至上、生命至上,把增进人民福祉作为推动市场监管的出发点和落脚点,持续加强食品、药品、重点工业产品和特种设备安全监管,加大消费者权益保护工作力度,有效净化了消费环境,有力维护了广大人民群众的切身利益、保障了人民群众生命财产安全,人民群众获得感幸福感安全感显著增强。</p><p>食品安全水平稳步提升。食品安全标准达到1455项,农药兽药残留限量及检测方法标准总数超过1.3万项,基本与国际食品法典标准接轨。大宗食品合格率持续保持高位,粮食加工品、食用油合格率和肉制品、国产婴幼儿配方乳粉抽检合格率分别保持在98%和97%、99%以上。</p><p>药品安全性、有效性、可及性显著增强。持续强化药品研发、生产、流通全链条监管,2018年以来药品国抽合格率均超过97%,其中2021年药品国抽合格率达到99%。深化药品审评审批制度改革,一批新药好药加快上市。积极推动新冠病毒疫苗、治疗药物、防控所需医疗器械研发上市,有力服务保障疫情防控大局。</p><p>工业产品质量安全监管不断强化。建立健全工业产品生产许可目录制度、重点工业品监管目录制度、强制性产品认证制度和监督抽查体系,逐年集中整治一批质量安全突出问题,近年来实施缺陷消费品召回3804次、7977万件。</p><p>特种设备安全形势持续向好。强化特种设备安全风险双重预防机制,持续推进特种设备安全专项整治行动,近五年来万台特种设备死亡率下降73%,万台特种设备死亡率从0.30下降到0.08,特种设备安全状况总体达到中等发达国家水平。</p><p>消费者权益保护全面加强。充分发挥综合执法优势,连续开展民生领域专项执法行动,市场消费环境持续净化。整合优化12315投诉举报平台,构建监管部门与消费者权益保护组织、人民调解组织、仲裁机构、人民法院等衔接协作的消费争议多元化解机制,有效提升维权服务水平,消费纠纷解决效率大幅提高。</p><p>党的十八大以来市场监管事业取得的重大成就,根本在于有以习近平同志为核心的党中央的坚强领导,有习近平新时代中国特色社会主义思想的科学指引。在全面建设社会主义现代化国家新征程上,市场监管系统要更加紧密地团结在以习近平同志为核心的党中央周围,坚持以习近平新时代中国特色社会主义思想为指导,坚决贯彻落实党中央、国务院决策部署,深刻领悟“两个确立”的决定性意义,增强“四个意识”,坚定“四个自信”,做到“两个维护”,弘扬伟大建党精神,牢记“国之大者”,强化责任担当,以“时时放心不下”的责任感、时不我待的紧迫感,踔厉奋发、勇毅前行,讲政治、强监管、促发展、保安全,务实推动全国统一大市场建设,深入实施质量强国和知识产权强国战略,强化法治监管、信用监管、智慧监管,加大食品、药品、工业产品和特种设备安全监管力度,以高效能市场监管服务经济社会高质量发展,更好服务和保障人民群众高品质生活,奋力谱写市场监管事业发展新篇章,以实际行动迎接党的二十大胜利召开。</p>','/api/upload/1601840445720100864.jpg',null);
insert into `article_type` values ('1','100','图书','0',null,null,null,'2023-02-12 11:11:50.0','2023-02-12 11:11:50.0');

UPDATE forum 
SET img = CONCAT('/api',img);
