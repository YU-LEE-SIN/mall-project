create database if not exists store;
drop database if exists store;
use store;
drop table if exists tb_brand;
create table tb_brand( pk_id int primary key auto_increment not null comment '品牌id',
                       brand_name varchar(50) not null comment '品牌名称',
                       brand_image varchar(200) DEFAULT '' COMMENT '品牌图片地址',
                       letter char(1) DEFAULT '' COMMENT '品牌的首字母'
                     )comment '品牌表，一个品牌下有多个商品（spu），一对多关系';

insert into `tb_brand` VALUES (111,'华为(HUAWEI)','', 'H');
insert into`tb_brand` VALUES (112,'OPPO', '', 'O');
insert into`tb_brand` VALUES (113,'小米(MI)', '', 'M');
insert into`tb_brand` VALUES (114,'微软(Microsoft)', '', 'W');
insert into`tb_brand` VALUES (115,'华硕(华硕(ASUS))', '', 'H');

drop table if exists tb_category;
create table tb_category(
                            pk_id int primary key auto_increment not null comment '类目id',
                            category_name varchar(15) not null comment '类目名称',
                            parent_id int(10) default 0 NOT NULL COMMENT '父类目id,顶级类目填0',
                            is_parent tinyint(1) default 1 NOT NULL COMMENT '是否为父节点，0为否，1为是',
                            sort int(4) NOT NULL COMMENT '排序指数，越小越靠前'
) comment '商品类目,类目和商品(spu)是一对多关系，类目与品牌是多对多关系,可以自己外键自己';

INSERT INTO `tb_category` VALUES ('1', '手机', '0', '1', '1');
INSERT INTO `tb_category` VALUES ('2', '手机通讯', '1', '1', '1');
INSERT INTO `tb_category` VALUES ('3', '手机', '2', '0', '1');

INSERT INTO `tb_category` VALUES ('4', '电脑办公', '0', '1', '2');
INSERT INTO `tb_category` VALUES ('5', '电脑整机', '4', '1', '1');
INSERT INTO `tb_category` VALUES ('6', '笔记本', '5', '0', '1');
INSERT INTO `tb_category` VALUES ('7', '超极本', '5', '0', '2');
INSERT INTO `tb_category` VALUES ('8', '游戏本', '5', '0', '3');
INSERT INTO `tb_category` VALUES ('9', '平板电脑', '5', '0', '4');
INSERT INTO `tb_category`(pk_id, category_name, sort) VALUES ('10', 'test1', '4');
INSERT INTO `tb_category`(pk_id, category_name, sort) VALUES ('11', 'test2', '4');
INSERT INTO `tb_category`(pk_id, category_name, sort) VALUES ('12', 'test3', '4');

drop table if exists tb_category_brand;
create table tb_category_brand(
                                  category_id int not null comment '商品类目id',
                                  brand_id int not null comment '品牌id'
)comment '商品分类和品牌的中间表，两者是多对多关系';
INSERT INTO `tb_category_brand` VALUES (3,111);
INSERT INTO `tb_category_brand` VALUES (3,112);
INSERT INTO `tb_category_brand` VALUES (3,113);
INSERT INTO `tb_category_brand` VALUES (4,112);
INSERT INTO `tb_category_brand` VALUES (5,113);
INSERT INTO `tb_category_brand` VALUES (8,114);
INSERT INTO `tb_category_brand` VALUES (8,115);
INSERT INTO `tb_category_brand` VALUES (9,114);
INSERT INTO `tb_category_brand` VALUES (9,115);
INSERT INTO `tb_category_brand` VALUES (10,114);
INSERT INTO `tb_category_brand` VALUES (10,114);

DROP TABLE IF EXISTS `tb_spu`;
CREATE TABLE `tb_spu` (
                          pk_id int primary key auto_increment not null comment 'id',
                          title varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
                          sub_title varchar(255) DEFAULT '' COMMENT '子标题',
                          spu_image varchar(1000) default '' comment '主图',
                          cid int(5) not null comment '类目id',
                          brand_id int(10) NOT NULL COMMENT '商品所属品牌id',
                          pricing decimal(10,2) default '0' comment '商品定价',
                          is_saleable tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架，0下架，1上架',
                          create_time datetime DEFAULT current_timestamp COMMENT '添加时间',
                          last_update_time datetime on update current_timestamp COMMENT '最后修改时间'
)COMMENT='spu表，该表描述的是一个抽象性的商品，比如 iphone8 一个品牌下有多个商品（spu），
一对多关系, 类目和商品(spu)是一对多关系，类目与品牌是多对多关系;';

insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (1,'华为 P10 蓝色 移动联通电信4G手机 双卡双待',
                            '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-1.jpg',
                           3,111,'2999',1 );
insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (2,'华为 P20 蓝色 移动联通电信4G手机 双卡双待',
                           '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-1.jpg',
                           3,111,'3999',1  );
insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (3,'华为 P30 蓝色 移动联通电信4G手机 双卡双待',
                           '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-2.jpg',
                           3,111,'3999',1 );
insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (4,'华为 P40 蓝色 移动联通电信4G手机 双卡双待',
                           '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-2.jpg',
                           3,111,'5999',1 );
insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (5,'华为 P50 蓝色 移动联通电信4G手机 双卡双待',
                           '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-3.jpg',
                           3,111,'6999',1 );
insert into tb_spu(pk_id, title, sub_title, spu_image, cid,
                   brand_id, pricing, is_saleable) values (6,'华为 P60 蓝色 移动联通电信4G手机 双卡双待',
                           '【白条6期免息】wifi双天线设计！徕卡人像摄影！徕卡双摄拍照，低至3988元！','p30-3.jpg',
                           3,111,'7359',1 );

DROP TABLE IF EXISTS `tb_sku`;
CREATE TABLE `tb_sku` (
                          pk_id int primary key auto_increment not null comment'id',
                          spu_id int not null comment 'spu表的id',
                          title varchar(255) not null comment '商品标题',
                          images varchar(1000) default '' COMMENT '商品的图片，多个图片以‘,’分割',
                          price decimal(10,2) not null default '0' comment '销售价格',
                          own_spec varchar(1000) default '' COMMENT 'sku的特有规格参数键值对，json格式，反序列化时请使用linkedHashMap，保证有序',
                          stock int(10) default '100' not null comment '库存',
                          is_enable tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效，0无效，1有效',
                          create_time datetime DEFAULT current_timestamp COMMENT '添加时间',
                          last_update_time datetime on update current_timestamp COMMENT '最后修改时间'

)comment 'sku表，,该表表示具体的商品实体,如黑色的 128g的 hwaweiP30';

insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
 values('1','华为 P10 蓝色 移动联通电信4G手机 双卡双待','p30-1.jpg','5498',
                          '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
 values ('1', '华为 P10 白色 移动联通电信4G手机 双卡双待', 'p30-1.jpg', '5990',
                           '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values('2','华为 P20 蓝色 移动联通电信4G手机 双卡双待','p30-1.jpg','5498',
       '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values ('2', '华为 P20 白色 移动联通电信4G手机 双卡双待', 'p30-2.jpg', '5990',
        '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values('3','华为 P30 蓝色 移动联通电信4G手机 双卡双待','p30-2.jpg','5498',
       '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable, create_time, last_update_time)
values ('3', '华为 P30 白色 移动联通电信4G手机 双卡双待', 'p30-2.jpg', '5990',
        '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1',
        '2019-11-21 15:55:14', '2019-11-21 15:55:14');


insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values('4','华为 P40 蓝色 移动联通电信4G手机 双卡双待','p30-1.jpg','5498',
       '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values ('4', '华为 P40 白色 移动联通电信4G手机 双卡双待', 'p30-1.jpg', '5990',
        '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values('5','华为 P50 蓝色 移动联通电信4G手机 双卡双待','p30-3.jpg','5498',
       '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values ('5', '华为 P50 白色 移动联通电信4G手机 双卡双待', 'p30-3.jpg', '5990',
        '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable)
values('6','华为 P60 蓝色 移动联通电信4G手机 双卡双待','p30-2.jpg','5498',
       '{"机身颜色":"蓝色","内存":"8GB","机身存储":"256GB"}','100', '1');
insert into tb_sku(spu_id, title, images, price, own_spec, stock, is_enable, create_time, last_update_time)
values ('6', '华为 P60 白色 移动联通电信4G手机 双卡双待', 'p30-2.jpg', '5990',
        '{"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}','100', '1',
        '2019-11-21 15:55:14', '2019-11-21 15:55:14');


DROP TABLE IF EXISTS tb_attribute_key;
CREATE TABLE tb_attribute_key(
                                 pk_id int primary key auto_increment not null comment'id',
                                 cid int(5) not null comment '类目id',
                                 attribute_name varchar(15) comment '属性名称'
)comment '属性key表';
insert into tb_attribute_key values ('1',1,'机身颜色');
insert into tb_attribute_key values ('2',1,'内存');
insert into tb_attribute_key values ('3',1,'机身存储');


DROP TABLE IF EXISTS tb_attribute_value;
CREATE TABLE tb_attribute_value(
                                  pk_id int primary key auto_increment not null comment'id',
                                   attribute_id int(5) not null comment '属性id',
                                  attribute_value varchar(15) comment '属性值'
)comment '属性value表';

insert into tb_attribute_value values ('1',1,'白色');
insert into tb_attribute_value values ('2',1,'蓝色');
insert into tb_attribute_value values ('3',2,'8GB');
insert into tb_attribute_value values ('4',3,'256GB');

drop table if exists tb_cart;
create table tb_cart(
    pk_id int primary key auto_increment not null comment'id',
    userId int not null comment '用户id',
    skuId int not null comment '具体商品id',
    count int not null default 0 comment '商品数量',
    status tinyint(1) default 1 comment '0，无效，1有效'
)comment '购物车';

drop table if exists tb_order;
create table tb_order(
    pk_id int primary key auto_increment not null comment'id',
    order_number varchar(300)NULL DEFAULT NULL COMMENT '订单编号',
    userId int not null comment '用户id',
    price decimal(10,2) not null comment '商品总价,付款金额',
    create_time datetime DEFAULT current_timestamp COMMENT '订单生成的时间',
   -- product_number int(11) NULL DEFAULT NULL COMMENT '该笔订单中包含的所有商品数量',
    status tinyint(4) NULL DEFAULT NULL COMMENT '订单的状态，默认0未支付未发货，1则表示支付未发货，2表示已发货未收货，3 表示已完成交易，4表示订单取消，5表示删除订单',
    address varchar(300)  NULL COMMENT '订单的收获地址'
)comment '订单表';

drop table if exists tb_order_item;
create table tb_order_item(
    pk_id int primary key auto_increment not null comment'id',
    order_id int not null comment'订单id',
    product_id int(11) NULL DEFAULT NULL COMMENT '商品id',
    num int(11) NULL DEFAULT NULL COMMENT '商品数量',
    price decimal(10,2)  NULL DEFAULT NULL COMMENT '商品小计'
)comment '订单详情表';

drop table if exists tb_pay_info;
CREATE TABLE tb_pay_info(
    pk_id int primary key auto_increment not null comment'id',
    user_id int(11)      DEFAULT NULL COMMENT '用户id',
    order_no  varchar(300)   DEFAULT NULL COMMENT '订单号',
    pay_platform   int(10)      DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
    platform_number varchar(200) DEFAULT NULL COMMENT '支付宝支付流水号',
    platform_status varchar(20)  DEFAULT NULL COMMENT '支付宝支付状态',
    create_time  datetime     DEFAULT NULL COMMENT '创建时间',
    update_time  datetime     DEFAULT NULL COMMENT '更新时间'
)comment '支付表';


DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
                        `id` varchar(20) NOT NULL,
                        `name` varchar(20) NOT NULL,
                        `is_parent` tinyint(1) ,
                        `pid` int(11) NOT NULL,
                        `uri` varchar(500) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) comment '菜单表';
insert into menu values ('1','品牌管理',0,0,'/admin/index');
insert into menu values ('2','分类管理',0,0,'/admin/category');
insert into menu values ('3','商品管理',0,0,'/admin/product');


DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT,
                           `username` varchar(50) NOT NULL COMMENT '用户名',
                           `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
                           `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
                           `created` datetime default current_timestamp COMMENT '创建时间',
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `username` (`username`) USING BTREE
) COMMENT='用户表,后台暂时共用';

INSERT INTO tb_user VALUES ('1', 'yu', 'yu', '13688666688', '2019-12-01 09:31:33');
INSERT INTO tb_user VALUES ('2', 'admin', 'admin', '13800880088', '2019-12-01 09:31:33');


