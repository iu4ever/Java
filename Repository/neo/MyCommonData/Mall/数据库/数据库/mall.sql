/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2020-02-26 10:34:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(1) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '����ͼ��',
  `help_count` int(11) DEFAULT NULL COMMENT 'ר������',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report` (
  `id` bigint(20) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL COMMENT '�ٱ����ͣ�0->��Ʒ���ۣ�1->�������ݣ�2->�û�����',
  `report_member_name` varchar(100) DEFAULT NULL COMMENT '�ٱ���',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL COMMENT '�ٱ�״̬��0->δ����1->�Ѵ���',
  `handle_status` int(1) DEFAULT NULL COMMENT '��������0->��Ч��1->��Ч��2->����',
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û��ٱ���';

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT 'չʾͼƬ',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��ѡר��';

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES ('1', '�����ʸ�����', '���ʲ����� �����ֳ���', null, null, '1');
INSERT INTO `cms_prefrence_area` VALUES ('2', '�����ʸ�����22', '�����ʸ�����22', null, null, null);
INSERT INTO `cms_prefrence_area` VALUES ('3', '�����ʸ�����33', null, null, null, null);
INSERT INTO `cms_prefrence_area` VALUES ('4', '�����ʸ�����44', null, null, null, null);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='��ѡר���Ͳ�Ʒ��ϵ��';

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('1', '1', '12');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('2', '1', '13');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('3', '1', '14');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('4', '1', '18');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('5', '1', '7');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('6', '2', '7');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('7', '1', '22');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('24', '1', '23');

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT 'ר����ͼ',
  `product_count` int(11) DEFAULT NULL COMMENT '������Ʒ����',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '����ͼƬ�ö��ŷָ�',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '��ʾ״̬��0->����ʾ��1->��ʾ',
  `content` text,
  `forward_count` int(11) DEFAULT NULL COMMENT 'ת����',
  `category_name` varchar(200) DEFAULT NULL COMMENT 'ר���������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='ר���';

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES ('1', '1', 'polo������Ҳʱ��', null, null, null, '2018-11-11 13:26:55', null, null, null, null, null, null, null, null, '��װר��');
INSERT INTO `cms_subject` VALUES ('2', '2', '�����ֻ��ͼ���', null, null, null, '2018-11-12 13:27:00', null, null, null, null, null, null, null, null, '�ֻ�ר��');
INSERT INTO `cms_subject` VALUES ('3', '2', '����845��Ʒ����', null, null, null, '2018-11-13 13:27:05', null, null, null, null, null, null, null, null, '�ֻ�ר��');
INSERT INTO `cms_subject` VALUES ('4', '1', '����Ӧ�ô�ʲô', null, null, null, '2018-11-01 13:27:09', null, null, null, null, null, null, null, null, '��װר��');
INSERT INTO `cms_subject` VALUES ('5', '1', '�ļ���ѡ', null, null, null, '2018-11-06 13:27:18', null, null, null, null, null, null, null, null, '��װר��');
INSERT INTO `cms_subject` VALUES ('6', '2', 'Ʒ���ֻ�����', null, null, null, '2018-11-07 13:27:21', null, null, null, null, null, null, null, null, '�ֻ�ר��');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '����ͼ��',
  `subject_count` int(11) DEFAULT NULL COMMENT 'ר������',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ר������';

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES ('1', '��װר��', null, null, null, null);
INSERT INTO `cms_subject_category` VALUES ('2', '�ֻ�ר��', null, null, null, null);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ר�����۱�';

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='ר����Ʒ��ϵ��';

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES ('1', '1', '12');
INSERT INTO `cms_subject_product_relation` VALUES ('2', '1', '13');
INSERT INTO `cms_subject_product_relation` VALUES ('3', '1', '14');
INSERT INTO `cms_subject_product_relation` VALUES ('4', '1', '18');
INSERT INTO `cms_subject_product_relation` VALUES ('5', '1', '7');
INSERT INTO `cms_subject_product_relation` VALUES ('6', '2', '7');
INSERT INTO `cms_subject_product_relation` VALUES ('7', '1', '22');
INSERT INTO `cms_subject_product_relation` VALUES ('29', '1', '23');
INSERT INTO `cms_subject_product_relation` VALUES ('30', '4', '23');
INSERT INTO `cms_subject_product_relation` VALUES ('31', '5', '23');
INSERT INTO `cms_subject_product_relation` VALUES ('41', '2', '26');
INSERT INTO `cms_subject_product_relation` VALUES ('42', '3', '26');
INSERT INTO `cms_subject_product_relation` VALUES ('43', '6', '26');

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int(11) DEFAULT NULL COMMENT '��������',
  `attention_count` int(11) DEFAULT NULL COMMENT '��ע����',
  `read_count` int(11) DEFAULT NULL,
  `award_name` varchar(100) DEFAULT NULL COMMENT '��Ʒ����',
  `attend_type` varchar(100) DEFAULT NULL COMMENT '���뷽ʽ',
  `content` text COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '����ͼ��',
  `subject_count` int(11) DEFAULT NULL COMMENT 'ר������',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ר�����۱�';

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_sku_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '��������',
  `price` decimal(10,2) DEFAULT NULL COMMENT '��ӵ����ﳵ�ļ۸�',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '��Ʒ��ͼ',
  `product_name` varchar(500) DEFAULT NULL COMMENT '��Ʒ����',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '��Ʒ�����⣨���㣩',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '��Ʒsku����',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '��Ա�ǳ�',
  `create_date` datetime DEFAULT NULL COMMENT '����ʱ��',
  `modify_date` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `delete_status` int(1) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '��Ʒ����',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '��Ʒ��������:[{"key":"��ɫ","value":"��ɫ"},{"key":"����","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='���ﳵ��';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES ('12', '26', '90', '1', '1', '3788.00', null, '��Ϊ HUAWEI P20', 'AI�ǻ�ȫ���� 6GB +64GB ����ɫ ȫ��ͨ�� �ƶ���ͨ����4G�ֻ� ˫��˫���ֻ� ˫��˫��', '201806070026001', 'windir', '2018-08-27 16:53:44', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('13', '27', '98', '1', '3', '2699.00', null, 'С��8', '����845����������������������AI�佹˫�㣬AI��������С��6X����1299���������', '201808270027001', 'windir', '2018-08-27 17:11:53', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('14', '28', '102', '1', '1', '649.00', null, '����5A', '8�쳬��������137g���ɻ�����ͨ����������С��6X����1299���������', '201808270028001', 'windir', '2018-08-27 17:18:02', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('15', '28', '103', '1', '1', '699.00', null, '����5A', '8�쳬��������137g���ɻ�����ͨ����������С��6X����1299���������', '201808270028001', 'windir', '2018-08-28 10:22:45', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('16', '29', '106', '1', '1', '5499.00', null, 'Apple iPhone 8 Plus', '����ʱ����������Apple��Ʒ���п񻶽ڣ����ﾡ�������ǻۣ����� >> ��ѡ[���Ϸ���][ԭ����2��]�����AppleCare+ȫ��λ����ƻ���ԭ���ӱ��ۺ����ǡ�', '201808270029001', 'windir', '2018-08-28 10:50:50', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('19', '36', '163', '1', '3', '100.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '202002210036001', 'windir', '2020-02-25 15:51:59', null, '1', '29', 'NIKE', '6799345', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `oms_cart_item` VALUES ('20', '36', '164', '1', '2', '120.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '202002210036001', 'windir', '2020-02-25 15:54:23', null, '1', '29', 'NIKE', '6799345', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `oms_cart_item` VALUES ('21', '36', '164', '1', '2', '120.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '202002210036001', 'windir', '2020-02-25 16:49:53', null, '1', '29', 'NIKE', '6799345', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '��ַ����',
  `send_status` int(1) DEFAULT NULL COMMENT 'Ĭ�Ϸ�����ַ��0->��1->��',
  `receive_status` int(1) DEFAULT NULL COMMENT '�Ƿ�Ĭ���ջ���ַ��0->��1->��',
  `name` varchar(64) DEFAULT NULL COMMENT '�շ���������',
  `phone` varchar(64) DEFAULT NULL COMMENT '�ջ��˵绰',
  `province` varchar(64) DEFAULT NULL COMMENT 'ʡ/ֱϽ��',
  `city` varchar(64) DEFAULT NULL COMMENT '��',
  `region` varchar(64) DEFAULT NULL COMMENT '��',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '��ϸ��ַ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='��˾�շ�����ַ��';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES ('1', '���ڷ�����', '1', '1', '����', '18000000000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰');
INSERT INTO `oms_company_address` VALUES ('2', '����������', '0', '0', '����', '18000000000', '������', null, '��ɽ��', '���˿�ѧ԰');
INSERT INTO `oms_company_address` VALUES ('3', '�Ͼ�������', '0', '0', '����', '18000000000', '����ʡ', '�Ͼ���', '��ɽ��', '���˿�ѧ԰');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '�������',
  `create_time` datetime DEFAULT NULL COMMENT '�ύʱ��',
  `member_username` varchar(64) DEFAULT NULL COMMENT '�û��ʺ�',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '�����ܽ��',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT 'Ӧ����ʵ��֧����',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '�˷ѽ��',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '�����Ż��������ۡ����������ݼۣ�',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '���ֵֿ۽��',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '�Ż�ȯ�ֿ۽��',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '����Ա��̨��������ʹ�õ��ۿ۽��',
  `pay_type` int(1) DEFAULT NULL COMMENT '֧����ʽ��0->δ֧����1->֧������2->΢��',
  `source_type` int(1) DEFAULT NULL COMMENT '������Դ��0->PC������1->app����',
  `status` int(1) DEFAULT NULL COMMENT '����״̬��0->�����1->��������2->�ѷ�����3->����ɣ�4->�ѹرգ�5->��Ч����',
  `order_type` int(1) DEFAULT NULL COMMENT '�������ͣ�0->����������1->��ɱ����',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '������˾(���ͷ�ʽ)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '��������',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '�Զ�ȷ��ʱ�䣨�죩',
  `integration` int(11) DEFAULT NULL COMMENT '���Ի�õĻ���',
  `growth` int(11) DEFAULT NULL COMMENT '���Ի�ĳɳ�ֵ',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '���Ϣ',
  `bill_type` int(1) DEFAULT NULL COMMENT '��Ʊ���ͣ�0->������Ʊ��1->���ӷ�Ʊ��2->ֽ�ʷ�Ʊ',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '��Ʊ̧ͷ',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '��Ʊ����',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '��Ʊ�˵绰',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '��Ʊ������',
  `receiver_name` varchar(100) NOT NULL COMMENT '�ջ�������',
  `receiver_phone` varchar(32) NOT NULL COMMENT '�ջ��˵绰',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '�ջ����ʱ�',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT 'ʡ��/ֱϽ��',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '����',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '��',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '��ϸ��ַ',
  `note` varchar(500) DEFAULT NULL COMMENT '������ע',
  `confirm_status` int(1) DEFAULT NULL COMMENT 'ȷ���ջ�״̬��0->δȷ�ϣ�1->��ȷ��',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT 'ɾ��״̬��0->δɾ����1->��ɾ��',
  `use_integration` int(11) DEFAULT NULL COMMENT '�µ�ʱʹ�õĻ���',
  `payment_time` datetime DEFAULT NULL COMMENT '֧��ʱ��',
  `delivery_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `receive_time` datetime DEFAULT NULL COMMENT 'ȷ���ջ�ʱ��',
  `comment_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `modify_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES ('12', '1', '2', '201809150101000001', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '20.00', '2344.25', '0.00', '10.00', '10.00', '0', '1', '4', '0', '', '', '15', '13284', '13284', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '����ʡ', '������', '������', '�����ֵ�', '111', '0', '0', null, null, null, null, null, '2019-11-09 16:50:28');
INSERT INTO `oms_order` VALUES ('13', '1', '2', '201809150102000002', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '1', '0', '', '', '15', '13284', '13284', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', '1000', '2018-10-11 14:04:19', null, null, null, null);
INSERT INTO `oms_order` VALUES ('14', '1', '2', '201809130101000001', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', '˳����', '201707196398345', '15', '13284', '13284', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, '2018-10-13 13:44:04', '2018-10-16 13:43:41', null, null, null);
INSERT INTO `oms_order` VALUES ('15', '1', '2', '201809130102000002', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '3', '0', '˳����', '201707196398346', '15', '13284', '13284', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '1', '0', null, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', null, null);
INSERT INTO `oms_order` VALUES ('16', '1', '2', '201809140101000001', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '13284', '13284', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('17', '1', '2', '201809150101000003', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0', '1', '4', '0', '˳����', '201707196398345', '15', null, null, '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, '2018-10-12 14:01:28', null, null, null);
INSERT INTO `oms_order` VALUES ('18', '1', '2', '201809150102000004', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '1', '0', 'Բͨ���', 'xx', '15', null, null, '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', '1000', null, '2018-10-16 14:42:17', null, null, null);
INSERT INTO `oms_order` VALUES ('19', '1', '2', '201809130101000003', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', null, null, '15', null, null, '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('20', '1', '2', '201809130102000004', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '3', '0', null, null, '15', null, null, '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('21', '1', '2', '201809140101000002', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '18682', '18682', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '1', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('22', '1', '2', '201809150101000005', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0', '1', '4', '0', '˳����', '201707196398345', '15', '0', '0', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, '2018-10-12 14:01:28', null, null, null);
INSERT INTO `oms_order` VALUES ('23', '1', '2', '201809150102000006', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '1', '0', '˳����', 'xxx', '15', '0', '0', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', '1000', null, '2018-10-16 14:41:28', null, null, null);
INSERT INTO `oms_order` VALUES ('24', '1', '2', '201809130101000005', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', null, null, '15', '18682', '18682', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('25', '1', '2', '201809130102000006', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '10.00', '2344.25', '0.00', '10.00', '5.00', '1', '1', '4', '0', null, null, '15', '18682', '18682', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����22', '18033441849', '518000', '������', '��������', '������', '���ǽֵ�', 'xxx', '0', '0', null, null, null, null, null, '2018-10-30 15:08:31');
INSERT INTO `oms_order` VALUES ('26', '1', '2', '201809140101000003', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '18682', '18682', '��Ʒ����,�����Żݣ���3������7.50��,�����Żݣ���1000.00Ԫ����120.00Ԫ,�����Żݣ���1000.00Ԫ����120.00Ԫ,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '������', '�����ֵ�', null, '0', '1', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('27', '1', null, '202002250100000001', '2020-02-25 15:59:20', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1', '0', '0', null, null, null, '0', '0', '���Ż�,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰', null, '0', '1', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('28', '1', null, '202002250100000002', '2020-02-25 16:05:47', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1', '0', '0', null, null, null, '0', '0', '���Ż�,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰', null, '0', '1', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('29', '1', null, '202002250100000003', '2020-02-25 16:07:58', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1', '0', '0', null, null, null, '0', '0', '���Ż�,���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('30', '1', null, '202002250100000004', '2020-02-25 16:50:13', 'test', '240.00', '240.00', '20.00', '0.00', '0.00', '0.00', '10.00', '0', '1', '2', '0', '˳����', '12333333', null, '0', '0', '���Ż�', null, null, null, null, null, '����', '18033441849', '518000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰', null, '0', '0', null, '2020-02-25 16:53:29', '2020-02-25 16:54:03', null, null, '2020-02-25 16:52:51');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '����id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '�������',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '���ۼ۸�',
  `product_quantity` int(11) DEFAULT NULL COMMENT '��������',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '��Ʒsku���',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '��Ʒsku����',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '��Ʒ����id',
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '��Ʒ��������',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '��Ʒ�����ֽ���',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '�Ż�ȯ�Żݷֽ���',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '�����Żݷֽ���',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '����Ʒ�����Żݺ�ķֽ���',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '��Ʒ��������:[{"key":"��ɫ","value":"��ɫ"},{"key":"����","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='����������������Ʒ';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES ('21', '12', '201809150101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '6946605', '3788.00', '1', '90', '201806070026001', '19', '��Ʒ����', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('22', '12', '201809150101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '7437788', '2699.00', '3', '98', '201808270027001', '19', '�����Żݣ���3������7.50��', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('23', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '649.00', '1', '102', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('24', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '699.00', '1', '103', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('25', '12', '201809150101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'ƻ��', '7437799', '5499.00', '1', '106', '201808270029001', '19', '���Ż�', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('26', '13', '201809150102000002', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '6946605', '3788.00', '1', '90', '201806070026001', '19', '��Ʒ����', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('27', '13', '201809150102000002', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '7437788', '2699.00', '3', '98', '201808270027001', '19', '�����Żݣ���3������7.50��', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('28', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '649.00', '1', '102', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('29', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '699.00', '1', '103', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('30', '13', '201809150102000002', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'ƻ��', '7437799', '5499.00', '1', '106', '201808270029001', '19', '���Ż�', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('31', '14', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '6946605', '3788.00', '1', '90', '201806070026001', '19', '��Ʒ����', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('32', '14', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '7437788', '2699.00', '3', '98', '201808270027001', '19', '�����Żݣ���3������7.50��', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('33', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '649.00', '1', '102', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('34', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '699.00', '1', '103', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('35', '14', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'ƻ��', '7437799', '5499.00', '1', '106', '201808270029001', '19', '���Ż�', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('36', '15', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '6946605', '3788.00', '1', '90', '201806070026001', '19', '��Ʒ����', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('37', '15', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '7437788', '2699.00', '3', '98', '201808270027001', '19', '�����Żݣ���3������7.50��', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('38', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '649.00', '1', '102', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('39', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '699.00', '1', '103', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('40', '15', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'ƻ��', '7437799', '5499.00', '1', '106', '201808270029001', '19', '���Ż�', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('41', '16', '201809140101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '6946605', '3788.00', '1', '90', '201806070026001', '19', '��Ʒ����', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('42', '16', '201809140101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '7437788', '2699.00', '3', '98', '201808270027001', '19', '�����Żݣ���3������7.50��', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('43', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '649.00', '1', '102', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('44', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '7437789', '699.00', '1', '103', '201808270028001', '19', '�����Żݣ���1000.00Ԫ����120.00Ԫ', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('45', '16', '201809140101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'ƻ��', '7437799', '5499.00', '1', '106', '201808270029001', '19', '���Ż�', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('46', '27', '202002250100000001', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '100.00', '0', '0', null);
INSERT INTO `oms_order_item` VALUES ('47', '27', '202002250100000001', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '120.00', '0', '0', null);
INSERT INTO `oms_order_item` VALUES ('48', '28', '202002250100000002', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '100.00', '0', '0', null);
INSERT INTO `oms_order_item` VALUES ('49', '28', '202002250100000002', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '120.00', '0', '0', null);
INSERT INTO `oms_order_item` VALUES ('50', '29', '202002250100000003', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '100.00', '0', '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `oms_order_item` VALUES ('51', '29', '202002250100000003', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '120.00', '0', '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `oms_order_item` VALUES ('52', '30', '202002250100000004', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '���Ż�', '0.00', '0.00', '0.00', '120.00', '0', '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '����id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '�����ˣ��û���ϵͳ����̨����Ա',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `order_status` int(1) DEFAULT NULL COMMENT '����״̬��0->�����1->��������2->�ѷ�����3->����ɣ�4->�ѹرգ�5->��Ч����',
  `note` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='����������ʷ��¼';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES ('5', '12', '��̨����Ա', '2018-10-12 14:01:29', '2', '��ɷ���');
INSERT INTO `oms_order_operate_history` VALUES ('6', '13', '��̨����Ա', '2018-10-12 14:01:29', '2', '��ɷ���');
INSERT INTO `oms_order_operate_history` VALUES ('7', '12', '��̨����Ա', '2018-10-12 14:13:10', '4', '�����ر�:����˻�');
INSERT INTO `oms_order_operate_history` VALUES ('8', '13', '��̨����Ա', '2018-10-12 14:13:10', '4', '�����ر�:����˻�');
INSERT INTO `oms_order_operate_history` VALUES ('9', '22', '��̨����Ա', '2018-10-15 16:31:48', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('10', '22', '��̨����Ա', '2018-10-15 16:35:08', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('11', '22', '��̨����Ա', '2018-10-15 16:35:59', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('12', '17', '��̨����Ա', '2018-10-15 16:43:40', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('13', '25', '��̨����Ա', '2018-10-15 16:52:14', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('14', '26', '��̨����Ա', '2018-10-15 16:52:14', '4', '�����ر�:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('15', '23', '��̨����Ա', '2018-10-16 14:41:28', '2', '��ɷ���');
INSERT INTO `oms_order_operate_history` VALUES ('16', '13', '��̨����Ա', '2018-10-16 14:42:17', '2', '��ɷ���');
INSERT INTO `oms_order_operate_history` VALUES ('17', '18', '��̨����Ա', '2018-10-16 14:42:17', '2', '��ɷ���');
INSERT INTO `oms_order_operate_history` VALUES ('18', '26', '��̨����Ա', '2018-10-30 14:37:44', '4', '�����ر�:�رն���');
INSERT INTO `oms_order_operate_history` VALUES ('19', '25', '��̨����Ա', '2018-10-30 15:07:01', '0', '�޸��ջ�����Ϣ');
INSERT INTO `oms_order_operate_history` VALUES ('20', '25', '��̨����Ա', '2018-10-30 15:08:13', '0', '�޸ķ�����Ϣ');
INSERT INTO `oms_order_operate_history` VALUES ('21', '25', '��̨����Ա', '2018-10-30 15:08:31', '0', '�޸ı�ע��Ϣ��xxx');
INSERT INTO `oms_order_operate_history` VALUES ('22', '25', '��̨����Ա', '2018-10-30 15:08:39', '4', '�����ر�:2222');
INSERT INTO `oms_order_operate_history` VALUES ('23', '12', '��̨����Ա', '2019-11-09 16:50:28', '4', '�޸ı�ע��Ϣ��111');
INSERT INTO `oms_order_operate_history` VALUES ('24', '30', '��̨����Ա', '2020-02-25 16:52:37', '0', '�޸ķ�����Ϣ');
INSERT INTO `oms_order_operate_history` VALUES ('25', '30', '��̨����Ա', '2020-02-25 16:52:51', '0', '�޸ķ�����Ϣ');
INSERT INTO `oms_order_operate_history` VALUES ('26', '30', '��̨����Ա', '2020-02-25 16:54:03', '2', '��ɷ���');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '����id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '�ջ���ַ��id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '�˻���Ʒid',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '�������',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `member_username` varchar(64) DEFAULT NULL COMMENT '��Ա�û���',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '�˿���',
  `return_name` varchar(100) DEFAULT NULL COMMENT '�˻�������',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '�˻��˵绰',
  `status` int(1) DEFAULT NULL COMMENT '����״̬��0->������1->�˻��У�2->����ɣ�3->�Ѿܾ�',
  `handle_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '��ƷͼƬ',
  `product_name` varchar(200) DEFAULT NULL COMMENT '��Ʒ����',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '��ƷƷ��',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '��Ʒ�������ԣ���ɫ����ɫ�����룺xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '�˻�����',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '��Ʒ����',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '��Ʒʵ��֧������',
  `reason` varchar(200) DEFAULT NULL COMMENT 'ԭ��',
  `description` varchar(500) DEFAULT NULL COMMENT '����',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT 'ƾ֤ͼƬ���Զ��Ÿ���',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '����ע',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '������Ա',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '�ջ���',
  `receive_time` datetime DEFAULT NULL COMMENT '�ջ�ʱ��',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '�ջ���ע',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='�����˻�����';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES ('3', '12', null, '26', '201809150101000001', '2018-10-17 14:34:57', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('4', '12', '2', '27', '201809150101000001', '2018-10-17 14:40:21', 'test', '3585.98', '����', '18000000000', '1', '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', '�Ѿ�������', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('5', '12', '3', '28', '201809150101000001', '2018-10-17 14:44:18', 'test', '3585.98', '����', '18000000000', '2', '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', '�Ѿ�������', 'admin', 'admin', '2018-10-18 13:55:58', '�Ѿ�������');
INSERT INTO `oms_order_return_apply` VALUES ('8', '13', null, '28', '201809150102000002', '2018-10-17 14:44:18', 'test', null, '����', '18000000000', '3', '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', '���ɲ������', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('9', '14', '2', '26', '201809130101000001', '2018-10-17 14:34:57', 'test', '3500.00', '����', '18000000000', '2', '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', '�Ǻ�', 'admin', 'admin', '2018-10-24 15:46:35', '�ջ���');
INSERT INTO `oms_order_return_apply` VALUES ('10', '14', null, '27', '201809130101000001', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '3', '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', '���ǲ���', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('11', '14', '2', '28', '201809130101000001', '2018-10-17 14:44:18', 'test', '591.05', '����', '18000000000', '1', '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', '�����˿�', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('12', '15', '3', '26', '201809130102000002', '2018-10-17 14:34:57', 'test', '3500.00', '����', '18000000000', '2', '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', '�˻���', 'admin', 'admin', '2018-10-24 17:23:06', '�ջ���');
INSERT INTO `oms_order_return_apply` VALUES ('13', '15', null, '27', '201809130102000002', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '3', '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', '�޷��˻�', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('15', '16', null, '26', '201809140101000001', '2018-10-17 14:34:57', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('16', '16', null, '27', '201809140101000001', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('17', '16', null, '28', '201809140101000001', '2018-10-17 14:44:18', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('18', '17', null, '26', '201809150101000003', '2018-10-17 14:34:57', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('19', '17', null, '27', '201809150101000003', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('20', '17', null, '28', '201809150101000003', '2018-10-17 14:44:18', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('21', '18', null, '26', '201809150102000004', '2018-10-17 14:34:57', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('22', '18', null, '27', '201809150102000004', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('23', '18', null, '28', '201809150102000004', '2018-10-17 14:44:18', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('24', '19', null, '26', '201809130101000003', '2018-10-17 14:34:57', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '��Ϊ HUAWEI P20', '��Ϊ', '��ɫ����ɫ;�ڴ棺16G', '1', '3788.00', '3585.98', '��������', '���ǿ�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('25', '19', null, '27', '201809130101000003', '2018-10-17 14:40:21', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'С��8', 'С��', '��ɫ����ɫ;�ڴ棺32G', '1', '2699.00', '2022.81', '��������', '�����߶�', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('26', '19', null, '28', '201809130101000003', '2018-10-17 14:44:18', 'test', null, '����', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '����5A', 'С��', '��ɫ����ɫ;�ڴ棺16G', '1', '649.00', '591.05', '��������', '��ɫ̫��', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '�˻�����',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '״̬��0->�����ã�1->����',
  `create_time` datetime DEFAULT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='�˻�ԭ���';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES ('1', '��������', '1', '1', '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES ('2', '����̫��', '1', '1', '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES ('3', '��ɫ��ϲ��', '1', '1', '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES ('4', '7���������˻�', '1', '1', '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES ('5', '�۸�����', '1', '0', '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES ('12', '��Ʊ����', '0', '1', '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES ('13', '��������', '0', '1', '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES ('14', '��������', '0', '1', '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES ('15', '�ۺ�����', '0', '1', '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '��ɱ������ʱ�ر�ʱ��(��)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '����������ʱʱ��(��)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '�������Զ�ȷ���ջ�ʱ�䣨�죩',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '�Զ���ɽ���ʱ�䣬���������ۺ��죩',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '������ɺ��Զ�����ʱ�䣨�죩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�������ñ�';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES ('1', '60', '120', '15', '7', '7');

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ͼƬ��';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '����ĸ',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '�Ƿ�ΪƷ�������̣�0->���ǣ�1->��',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '��Ʒ����',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '��Ʒ��������',
  `logo` varchar(255) DEFAULT NULL COMMENT 'Ʒ��logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT 'ר����ͼ',
  `brand_story` text COMMENT 'Ʒ�ƹ���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='Ʒ�Ʊ�';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES ('1', '���', 'W', '0', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret�Ĺ���');
INSERT INTO `pms_brand` VALUES ('2', '����', 'S', '100', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', null, '���ǵĹ���');
INSERT INTO `pms_brand` VALUES ('3', '��Ϊ', 'H', '100', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (2).jpg', null, 'Victoria\'s Secret�Ĺ���');
INSERT INTO `pms_brand` VALUES ('4', '����', 'G', '30', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', null, 'Victoria\'s Secret�Ĺ���');
INSERT INTO `pms_brand` VALUES ('5', '��̫', 'F', '20', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', null, 'Victoria\'s Secret�Ĺ���');
INSERT INTO `pms_brand` VALUES ('6', 'С��', 'M', '500', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5a912944N474afb7a.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', 'С���ֻ��Ĺ���');
INSERT INTO `pms_brand` VALUES ('21', 'OPPO', 'O', '0', '1', '1', '88', '500', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES ('49', '��ƥ��', 'S', '200', '1', '1', '77', '400', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/1522738681.jpg', null, 'BOOB�Ĺ���');
INSERT INTO `pms_brand` VALUES ('50', '����֮��', 'H', '200', '1', '1', '66', '300', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/LOGO1024.png', '', '����֮�ҵĹ���');
INSERT INTO `pms_brand` VALUES ('51', 'ƻ��', 'A', '200', '1', '1', '55', '200', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', null, 'ƻ���Ĺ���');
INSERT INTO `pms_brand` VALUES ('58', 'NIKE', 'N', '0', '1', '1', '33', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE�Ĺ���');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '����������0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '���۵�ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '����ʱ����Ʒ����',
  `collect_couont` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `content` text,
  `pics` varchar(1000) DEFAULT NULL COMMENT '�ϴ�ͼƬ��ַ���Զ��Ÿ���',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '�����û�ͷ��',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ���۱�';

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '������Ա���ͣ�0->��Ա��1->����Ա',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ���ۻظ���';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '�Ʒ�����:0->��������1->������',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '����kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '�׷ѣ�Ԫ��',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT 'Ŀ�ĵأ�ʡ���У�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�˷�ģ��';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '��Ա�۸�',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='��Ʒ��Ա�۸��';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES ('26', '7', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('27', '8', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('28', '9', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('29', '10', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('30', '11', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('31', '12', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('32', '13', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('33', '14', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('37', '18', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('44', '7', '2', '480.00', null);
INSERT INTO `pms_member_price` VALUES ('45', '7', '3', '450.00', null);
INSERT INTO `pms_member_price` VALUES ('52', '22', '1', null, null);
INSERT INTO `pms_member_price` VALUES ('53', '22', '2', null, null);
INSERT INTO `pms_member_price` VALUES ('54', '22', '3', null, null);
INSERT INTO `pms_member_price` VALUES ('58', '24', '1', null, null);
INSERT INTO `pms_member_price` VALUES ('59', '24', '2', null, null);
INSERT INTO `pms_member_price` VALUES ('60', '24', '3', null, null);
INSERT INTO `pms_member_price` VALUES ('112', '23', '1', '88.00', '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('113', '23', '2', '88.00', '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('114', '23', '3', '66.00', '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('142', '31', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('143', '31', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('144', '31', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('148', '32', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('149', '32', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('150', '32', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('154', '33', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('155', '33', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('156', '33', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('175', '34', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('176', '34', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('177', '34', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('178', '30', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('179', '30', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('180', '30', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('192', '27', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('193', '27', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('194', '27', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('195', '28', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('196', '28', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('197', '28', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('198', '29', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('199', '29', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('200', '29', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('201', '26', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('202', '26', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('203', '26', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('246', '36', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('247', '36', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('248', '36', '3', null, '��ʯ��Ա');
INSERT INTO `pms_member_price` VALUES ('249', '35', '1', null, '�ƽ��Ա');
INSERT INTO `pms_member_price` VALUES ('250', '35', '2', null, '�׽��Ա');
INSERT INTO `pms_member_price` VALUES ('251', '35', '3', null, '��ʯ��Ա');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `product_sn` varchar(64) NOT NULL COMMENT '����',
  `delete_status` int(1) DEFAULT NULL COMMENT 'ɾ��״̬��0->δɾ����1->��ɾ��',
  `publish_status` int(1) DEFAULT NULL COMMENT '�ϼ�״̬��0->�¼ܣ�1->�ϼ�',
  `new_status` int(1) DEFAULT NULL COMMENT '��Ʒ״̬:0->������Ʒ��1->��Ʒ',
  `recommand_status` int(1) DEFAULT NULL COMMENT '�Ƽ�״̬��0->���Ƽ���1->�Ƽ�',
  `verify_status` int(1) DEFAULT NULL COMMENT '���״̬��0->δ��ˣ�1->���ͨ��',
  `sort` int(11) DEFAULT NULL COMMENT '����',
  `sale` int(11) DEFAULT NULL COMMENT '����',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '�����۸�',
  `gift_growth` int(11) DEFAULT '0' COMMENT '���͵ĳɳ�ֵ',
  `gift_point` int(11) DEFAULT '0' COMMENT '���͵Ļ���',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '����ʹ�õĻ�����',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '������',
  `description` text COMMENT '��Ʒ����',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '�г���',
  `stock` int(11) DEFAULT NULL COMMENT '���',
  `low_stock` int(11) DEFAULT NULL COMMENT '���Ԥ��ֵ',
  `unit` varchar(16) DEFAULT NULL COMMENT '��λ',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '��Ʒ������Ĭ��Ϊ��',
  `preview_status` int(1) DEFAULT NULL COMMENT '�Ƿ�ΪԤ����Ʒ��0->���ǣ�1->��',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '�Զ��ŷָ�Ĳ�Ʒ����1->�����˻���2->�����˿3->��Ѱ���',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(255) DEFAULT NULL COMMENT '����ͼƬ������ƷͼƬ����Ϊ5�ţ��Զ��ŷָ�',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` text,
  `detail_html` text COMMENT '��Ʒ������ҳ����',
  `detail_mobile_html` text COMMENT '�ƶ�����ҳ����',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '������ʼʱ��',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '��޹�����',
  `promotion_type` int(1) DEFAULT NULL COMMENT '�������ͣ�0->û�д���ʹ��ԭ��;1->ʹ�ô����ۣ�2->ʹ�û�Ա�ۣ�3->ʹ�ý��ݼ۸�4->ʹ�������۸�5->��ʱ��',
  `brand_name` varchar(255) DEFAULT NULL COMMENT 'Ʒ������',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '��Ʒ��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='��Ʒ��Ϣ';

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES ('1', '49', '7', '0', '0', '��ɫ��â������ɴ�׿�', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1', '1', '1', '1', '100', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, null, null, '0', '��ƥ��', '����');
INSERT INTO `pms_product` VALUES ('2', '49', '7', '0', '0', '��ɫ��â������ɴ�׿�2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', '1', '1', '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�2', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '<p>��ɫ��â������ɴ�׿�</p>', '<p>��ɫ��â������ɴ�׿�</p>', null, null, null, '0', '��ƥ��', '����');
INSERT INTO `pms_product` VALUES ('3', '1', '7', '0', '0', '��ɫ��â������ɴ�׿�3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', '1', '1', '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�3', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, null, null, '0', '���', '����');
INSERT INTO `pms_product` VALUES ('4', '1', '7', '0', '0', '��ɫ��â������ɴ�׿�4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', '1', '1', '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�4', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, null, null, '0', '���', '����');
INSERT INTO `pms_product` VALUES ('5', '1', '7', '0', '0', '��ɫ��â������ɴ�׿�5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', '1', '0', '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�5', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, null, null, '0', '���', '����');
INSERT INTO `pms_product` VALUES ('6', '1', '7', '0', '0', '��ɫ��â������ɴ�׿�6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', '1', '1', '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '��', '1000.00', '0', null, '��ɫ��â������ɴ�׿�6', '��ɫ��â������ɴ�׿�', null, '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', '��ɫ��â������ɴ�׿�', null, null, null, '0', '���', '����');
INSERT INTO `pms_product` VALUES ('7', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('8', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('9', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('10', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('11', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1', '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('12', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1', '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('13', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1', '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('14', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('18', '1', '7', '0', '1', 'Ůʽ��������ë�˶�����3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0', '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '���ļ��ã������ʵ�', '���ļ��ã������ʵ�', '299.00', '100', '0', '��', '0.00', '0', 'string', 'Ůʽ��������ë�˶�����', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '���', '����');
INSERT INTO `pms_product` VALUES ('22', '6', '7', '0', '1', 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', '1', '1', '0', '0', '0', '0', '0', '0.00', null, '0', '0', '0', 'test', '', '0.00', '100', '0', '', '0.00', '1', '1,2', '', '', '', '', '', '', '', null, null, '0', '0', 'С��', '����');
INSERT INTO `pms_product` VALUES ('23', '6', '19', '0', '1', 'ë������', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', '1', '1', '1', '1', '0', '0', '0', '99.00', null, '99', '99', '1000', 'ë������11', 'xxx', '109.00', '100', '0', '��', '1000.00', '1', '1,2,3', 'ë������', 'ë������', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'ë������', 'ë������', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP��¼bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP��¼����.jpg\" width=\"500\" height=\"500\" /></p>', '', null, null, '0', '2', 'С��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('24', '6', '7', '0', null, 'xxx', '', '', '1', '0', '0', '0', '0', '0', '0', '0.00', null, '0', '0', '0', 'xxx', '', '0.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'С��', '����');
INSERT INTO `pms_product` VALUES ('26', '3', '19', '0', '3', '��Ϊ HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', '0', '1', '1', '1', '0', '100', '0', '3788.00', null, '3788', '3788', '0', 'AI�ǻ�ȫ���� 6GB +64GB ����ɫ ȫ��ͨ�� �ƶ���ͨ����4G�ֻ� ˫��˫���ֻ� ˫��˫��', '', '4288.00', '1000', '0', '��', '0.00', '1', '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', null, null, '0', '1', '��Ϊ', '�ֻ�ͨѶ');
INSERT INTO `pms_product` VALUES ('27', '6', '19', '0', '3', 'С��8 ȫ������Ϸ�����ֻ� 6GB+64GB ��ɫ ȫ��ͨ4G ˫��˫��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', '0', '1', '1', '1', '0', '0', '0', '2699.00', null, '2699', '2699', '0', '����845����������������������AI�佹˫�㣬AI��������С��6X����1299���������', 'С��8 ȫ������Ϸ�����ֻ� 6GB+64GB ��ɫ ȫ��ͨ4G ˫��˫��', '2699.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', null, null, '0', '3', 'С��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('28', '6', '19', '0', '3', 'С�� ����5A ȫ��ͨ�� 3GB+32GB ���Ľ� �ƶ���ͨ����4G�ֻ� ˫��˫��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', '0', '1', '1', '1', '0', '0', '0', '649.00', null, '649', '649', '0', '8�쳬��������137g���ɻ�����ͨ����������С��6X����1299���������', '', '649.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '4', 'С��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('29', '51', '19', '0', '3', 'Apple iPhone 8 Plus 64GB ��ɫ�ر�� �ƶ���ͨ����4G�ֻ�', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', '0', '1', '1', '1', '0', '0', '0', '5499.00', null, '5499', '5499', '0', '����ʱ����������Apple��Ʒ���п񻶽ڣ����ﾡ�������ǻۣ����� >> ��ѡ[���Ϸ���][ԭ����2��]�����AppleCare+ȫ��λ����ƻ���ԭ���ӱ��ۺ����ǡ�', '', '5499.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'ƻ��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('30', '50', '8', '0', '1', 'HLA����֮�Ҽ�Լ����ӡ������T��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', '0', '1', '1', '1', '0', '0', '0', '98.00', null, '0', '0', '0', '2018�ļ���Ʒ΢�������¿��T���� 6��6��-6��20�գ���300��30�����뻥��Ӯ��Ԫ��ȯ����������Ӯ��', '', '98.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '����֮��', 'T��');
INSERT INTO `pms_product` VALUES ('31', '50', '8', '0', '1', 'HLA����֮�����һ���Բ����֯������T��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', '0', '1', '0', '0', '0', '0', '0', '98.00', null, '0', '0', '0', '2018�ļ���Ʒ����T����HNTBJ2E080A ���һ���80 175/92A/L80A ���һ���80 175/92A/L', '', '98.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '����֮��', 'T��');
INSERT INTO `pms_product` VALUES ('32', '50', '8', '0', null, 'HLA����֮�Ҷ���T���л�����', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', '0', '1', '0', '0', '0', '0', '0', '68.00', null, '0', '0', '0', 'HLA����֮�Ҷ���T���л������ԼԲ��HNTBJ2E153A����(F3)175/92A(50)', '', '68.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '����֮��', 'T��');
INSERT INTO `pms_product` VALUES ('33', '6', '35', '0', null, 'С�ף�MI��С�׵���4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', '0', '1', '0', '0', '0', '0', '0', '2499.00', null, '0', '0', '0', 'С�ף�MI��С�׵���4A 55Ӣ�� L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K������ �˹���������Һ��ƽ�����', '', '2499.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'С��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('34', '6', '35', '0', null, 'С�ף�MI��С�׵���4A 65Ӣ��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', '0', '1', '0', '0', '0', '0', '0', '3999.00', null, '0', '0', '0', ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K������ �˹���������Һ��ƽ�����', '', '3999.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'С��', '�ֻ�����');
INSERT INTO `pms_product` VALUES ('35', '58', '29', '0', '11', '�Ϳ�NIKE ���� ����Ь ROSHE RUN �˶�Ь 511881-010��ɫ41��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', '0', '1', '0', '0', '0', '0', '0', '369.00', null, '0', '0', '0', '�Ϳ�NIKE ���� ����Ь ROSHE RUN �˶�Ь 511881-010��ɫ41��', '', '369.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'NIKE', '��Ь');
INSERT INTO `pms_product` VALUES ('36', '58', '29', '0', '11', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', '0', '1', '1', '1', '0', '0', '0', '499.00', null, '0', '0', '0', '�Ϳ�NIKE ���� ���� ����Ь AIR MAX 90 ESSENTIAL �˶�Ь AJ1285-101��ɫ41��', '', '499.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', 'NIKE', '��Ь');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '����ѡ�����ͣ�0->Ψһ��1->��ѡ��2->��ѡ',
  `input_type` int(1) DEFAULT NULL COMMENT '����¼�뷽ʽ��0->�ֹ�¼�룻1->���б���ѡȡ',
  `input_list` varchar(255) DEFAULT NULL COMMENT '��ѡֵ�б��Զ��Ÿ���',
  `sort` int(11) DEFAULT NULL COMMENT '�����ֶΣ���ߵĿ��Ե����ϴ�ͼƬ',
  `filter_type` int(1) DEFAULT NULL COMMENT '����ɸѡ��ʽ��1->��ͨ��1->��ɫ',
  `search_type` int(1) DEFAULT NULL COMMENT '�������ͣ�0->����Ҫ���м�����1->�ؼ��ּ�����2->��Χ����',
  `related_status` int(1) DEFAULT NULL COMMENT '��ͬ���Բ�Ʒ�Ƿ������0->��������1->����',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '�Ƿ�֧���ֶ�������0->��֧�֣�1->֧��',
  `type` int(1) DEFAULT NULL COMMENT '���Ե����ͣ�0->���1->����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='��Ʒ���Բ�����';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES ('1', '1', '�ߴ�', '2', '1', 'M,X,XL,2XL,3XL,4XL', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('7', '1', '��ɫ', '2', '1', '��ɫ,��ɫ,��ɫ,��ɫ', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('13', '0', '�������', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('14', '0', '�������1', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('15', '0', '�������2', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('16', '0', '�������3', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('17', '0', '�������4', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('18', '0', '�������5', '1', '1', '2013��,2014��,2015��,2016��,2017��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('19', '0', '���ö���', '1', '1', '����Ů��,����Ů��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('20', '0', '���ö���1', '2', '1', '����Ů��,����Ů��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('21', '0', '���ö���3', '2', '1', '����Ů��,����Ů��', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('24', '1', '��Ʒ���', '1', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('25', '1', '���ü���', '1', '1', '����,�ļ�,�＾,����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('32', '2', '������Ⱥ', '0', '1', '����,����,����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('33', '2', '���', '0', '1', '�������,��������,������װ', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('35', '2', '��ɫ', '0', '0', '', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('37', '1', '������Ⱥ', '1', '1', '��ͯ,����,����,����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('38', '1', '����ʱ��', '1', '1', '2017����,2017�궬,2018�괺,2018����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('39', '1', '�䳤', '1', '1', '����,����,����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('40', '2', '����', '0', '1', '29,30,31,32,33,34', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('41', '2', '���ó���', '0', '1', '�Ӽ�,�˶�,��װ', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('42', '2', '����ʱ��', '0', '1', '2018�괺,2018����', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('43', '3', '��ɫ', '0', '0', '', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('44', '3', '����', '0', '1', '16G,32G,64G,128G', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('45', '3', '��Ļ�ߴ�', '0', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('46', '3', '����', '0', '1', '3G,4G', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('47', '3', 'ϵͳ', '0', '1', 'Android,IOS', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('48', '3', '�������', '0', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('49', '11', '��ɫ', '0', '1', '��ɫ,��ɫ,��ɫ', '0', '1', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('50', '11', '�ߴ�', '0', '1', '38,39,40', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('51', '11', '���', '0', '1', '�ļ�,�＾', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '��������',
  `param_count` int(11) DEFAULT '0' COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='��Ʒ���Է����';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES ('1', '��װ-T��', '2', '5');
INSERT INTO `pms_product_attribute_category` VALUES ('2', '��װ-��װ', '2', '4');
INSERT INTO `pms_product_attribute_category` VALUES ('3', '�ֻ�����-�ֻ�ͨѶ', '2', '4');
INSERT INTO `pms_product_attribute_category` VALUES ('4', '���', '0', '0');
INSERT INTO `pms_product_attribute_category` VALUES ('5', '�Ӽ�', '0', '0');
INSERT INTO `pms_product_attribute_category` VALUES ('6', 'ϴ��', '0', '0');
INSERT INTO `pms_product_attribute_category` VALUES ('10', '���Է���', '0', '0');
INSERT INTO `pms_product_attribute_category` VALUES ('11', '��װ-Ьñ', '3', '0');

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '�ֶ���ӹ��������ֵ��������ֵ������ж��ʱ�Զ��Ÿ���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='�洢��Ʒ������Ϣ�ı�';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES ('1', '9', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('2', '10', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('3', '11', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('4', '12', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('5', '13', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('6', '14', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('7', '18', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('8', '7', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('9', '7', '1', 'XL');
INSERT INTO `pms_product_attribute_value` VALUES ('10', '7', '1', 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES ('11', '22', '7', 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES ('12', '22', '24', 'no110');
INSERT INTO `pms_product_attribute_value` VALUES ('13', '22', '25', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('14', '22', '37', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('15', '22', '38', '2018�괺');
INSERT INTO `pms_product_attribute_value` VALUES ('16', '22', '39', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('124', '23', '7', '�װ�ɫ,ǳ��ɫ');
INSERT INTO `pms_product_attribute_value` VALUES ('125', '23', '24', 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES ('126', '23', '25', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('127', '23', '37', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('128', '23', '38', '2018�괺');
INSERT INTO `pms_product_attribute_value` VALUES ('129', '23', '39', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('130', '1', '13', null);
INSERT INTO `pms_product_attribute_value` VALUES ('131', '1', '14', null);
INSERT INTO `pms_product_attribute_value` VALUES ('132', '1', '15', null);
INSERT INTO `pms_product_attribute_value` VALUES ('133', '1', '16', null);
INSERT INTO `pms_product_attribute_value` VALUES ('134', '1', '17', null);
INSERT INTO `pms_product_attribute_value` VALUES ('135', '1', '18', null);
INSERT INTO `pms_product_attribute_value` VALUES ('136', '1', '19', null);
INSERT INTO `pms_product_attribute_value` VALUES ('137', '1', '20', null);
INSERT INTO `pms_product_attribute_value` VALUES ('138', '1', '21', null);
INSERT INTO `pms_product_attribute_value` VALUES ('139', '2', '13', null);
INSERT INTO `pms_product_attribute_value` VALUES ('140', '2', '14', null);
INSERT INTO `pms_product_attribute_value` VALUES ('141', '2', '15', null);
INSERT INTO `pms_product_attribute_value` VALUES ('142', '2', '16', null);
INSERT INTO `pms_product_attribute_value` VALUES ('143', '2', '17', null);
INSERT INTO `pms_product_attribute_value` VALUES ('144', '2', '18', null);
INSERT INTO `pms_product_attribute_value` VALUES ('145', '2', '19', null);
INSERT INTO `pms_product_attribute_value` VALUES ('146', '2', '20', null);
INSERT INTO `pms_product_attribute_value` VALUES ('147', '2', '21', null);
INSERT INTO `pms_product_attribute_value` VALUES ('183', '31', '24', null);
INSERT INTO `pms_product_attribute_value` VALUES ('184', '31', '25', '�ļ�');
INSERT INTO `pms_product_attribute_value` VALUES ('185', '31', '37', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('186', '31', '38', '2018����');
INSERT INTO `pms_product_attribute_value` VALUES ('187', '31', '39', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('198', '30', '24', null);
INSERT INTO `pms_product_attribute_value` VALUES ('199', '30', '25', '�ļ�');
INSERT INTO `pms_product_attribute_value` VALUES ('200', '30', '37', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('201', '30', '38', '2018����');
INSERT INTO `pms_product_attribute_value` VALUES ('202', '30', '39', '����');
INSERT INTO `pms_product_attribute_value` VALUES ('213', '27', '43', '��ɫ,��ɫ');
INSERT INTO `pms_product_attribute_value` VALUES ('214', '27', '45', '5.8');
INSERT INTO `pms_product_attribute_value` VALUES ('215', '27', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('216', '27', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('217', '27', '48', '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES ('218', '28', '43', '��ɫ,��ɫ');
INSERT INTO `pms_product_attribute_value` VALUES ('219', '28', '45', '5.0');
INSERT INTO `pms_product_attribute_value` VALUES ('220', '28', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('221', '28', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('222', '28', '48', '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES ('223', '29', '43', '��ɫ,��ɫ');
INSERT INTO `pms_product_attribute_value` VALUES ('224', '29', '45', '4.7');
INSERT INTO `pms_product_attribute_value` VALUES ('225', '29', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('226', '29', '47', 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES ('227', '29', '48', '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES ('228', '26', '43', '��ɫ,��ɫ');
INSERT INTO `pms_product_attribute_value` VALUES ('229', '26', '45', '5.0');
INSERT INTO `pms_product_attribute_value` VALUES ('230', '26', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('231', '26', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('232', '26', '48', '3000');

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '�ϻ�����ı�ţ�0��ʾһ������',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '���༶��0->1����1->2��',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '�Ƿ���ʾ�ڵ�������0->����ʾ��1->��ʾ',
  `show_status` int(1) DEFAULT NULL COMMENT '��ʾ״̬��0->����ʾ��1->��ʾ',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT 'ͼ��',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='��Ʒ����';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES ('1', '0', '��װ', '0', '100', '��', '1', '1', '1', null, '��װ', '��װ����');
INSERT INTO `pms_product_category` VALUES ('2', '0', '�ֻ�����', '0', '100', '��', '1', '1', '1', null, '�ֻ�����', '�ֻ�����');
INSERT INTO `pms_product_category` VALUES ('3', '0', '���õ���', '0', '100', '��', '1', '1', '1', null, '���õ���', '���õ���');
INSERT INTO `pms_product_category` VALUES ('4', '0', '�Ҿ߼�װ', '0', '100', '��', '1', '1', '1', null, '�Ҿ߼�װ', '�Ҿ߼�װ');
INSERT INTO `pms_product_category` VALUES ('5', '0', '������Ʒ', '0', '100', '��', '1', '1', '1', null, '������Ʒ', '������Ʒ');
INSERT INTO `pms_product_category` VALUES ('7', '1', '����', '1', '100', '��', '1', '1', '0', '', '����', '����');
INSERT INTO `pms_product_category` VALUES ('8', '1', 'T��', '1', '100', '��', '1', '1', '0', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'T��', 'T��');
INSERT INTO `pms_product_category` VALUES ('9', '1', '���п�', '1', '100', '��', '1', '1', '0', null, '���п�', '���п�');
INSERT INTO `pms_product_category` VALUES ('10', '1', 'ţ�п�', '1', '100', '��', '1', '1', '0', null, 'ţ�п�', 'ţ�п�');
INSERT INTO `pms_product_category` VALUES ('11', '1', '����', '1', '100', '��', '1', '1', '0', null, '����', '��������');
INSERT INTO `pms_product_category` VALUES ('13', '12', '�ҵ��ӷ���1', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES ('14', '12', '�ҵ��ӷ���2', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES ('19', '2', '�ֻ�ͨѶ', '1', '0', '��', '0', '0', '0', '', '�ֻ�ͨѶ', '�ֻ�ͨѶ');
INSERT INTO `pms_product_category` VALUES ('29', '1', '��Ь', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('30', '2', '�ֻ����', '1', '0', '', '0', '0', '0', '', '�ֻ����', '�ֻ����');
INSERT INTO `pms_product_category` VALUES ('31', '2', '��Ӱ����', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('32', '2', 'Ӱ������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('33', '2', '�������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('34', '2', '�����豸', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('35', '3', '����', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('36', '3', '�յ�', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('37', '3', 'ϴ�»�', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('38', '3', '����', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('39', '3', '�������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('40', '3', '����С��', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('41', '3', '�������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('42', '3', '��������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('43', '4', '������ԡ', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('44', '4', '��������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('45', '4', '��𹤾�', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('46', '4', '���ҼҾ�', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('47', '4', '�����Ҿ�', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('48', '5', 'ȫ������', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('49', '5', '���ص���', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('50', '5', 'ά�ޱ���', '1', '0', '', '0', '0', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('51', '5', '����װ��', '1', '0', '', '0', '0', '0', '', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='��Ʒ�ķ�������ԵĹ�ϵ���������÷���ɸѡ������ֻ֧��һ�����ࣩ';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES ('1', '24', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('5', '26', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('7', '28', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('9', '25', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('10', '25', '25');

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='��Ʒ������(ֻ���ͬ��Ʒ)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES ('1', '7', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('2', '8', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('3', '9', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('4', '10', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('5', '11', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('6', '12', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('7', '13', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('8', '14', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('9', '18', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('10', '7', '200.00', '50.00');
INSERT INTO `pms_product_full_reduction` VALUES ('11', '7', '300.00', '100.00');
INSERT INTO `pms_product_full_reduction` VALUES ('14', '22', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('16', '24', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('34', '23', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('44', '31', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('46', '32', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('48', '33', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('55', '34', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('56', '30', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('59', '27', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('60', '28', '500.00', '50.00');
INSERT INTO `pms_product_full_reduction` VALUES ('61', '28', '1000.00', '120.00');
INSERT INTO `pms_product_full_reduction` VALUES ('62', '29', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('63', '26', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('78', '36', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('79', '35', '0.00', '0.00');

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '�������Ʒ����',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '�ۿ�',
  `price` decimal(10,2) DEFAULT NULL COMMENT '�ۺ�۸�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='��Ʒ���ݼ۸��(ֻ���ͬ��Ʒ)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES ('1', '7', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('2', '8', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('3', '9', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('4', '10', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('5', '11', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('6', '12', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('7', '13', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('8', '14', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('12', '18', '3', '0.70', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('14', '7', '4', '0.60', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('15', '7', '5', '0.50', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('18', '22', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('20', '24', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('38', '23', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('48', '31', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('50', '32', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('52', '33', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('59', '34', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('60', '30', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('64', '27', '2', '0.80', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('65', '27', '3', '0.75', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('66', '28', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('67', '29', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('68', '26', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('83', '36', '0', '0.00', '0.00');
INSERT INTO `pms_product_ladder` VALUES ('84', '35', '0', '0.00', '0.00');

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int(11) DEFAULT NULL COMMENT '���͵Ļ���',
  `gift_point_new` int(11) DEFAULT NULL,
  `use_point_limit_old` int(11) DEFAULT NULL,
  `use_point_limit_new` int(11) DEFAULT NULL,
  `operate_man` varchar(64) DEFAULT NULL COMMENT '������',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '�����',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='��Ʒ��˼�¼';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES ('1', '1', '2018-04-27 16:36:41', 'test', '1', '��֤ͨ��');
INSERT INTO `pms_product_vertify_record` VALUES ('2', '2', '2018-04-27 16:36:41', 'test', '1', '��֤ͨ��');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) NOT NULL COMMENT 'sku����',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '���',
  `low_stock` int(11) DEFAULT NULL COMMENT 'Ԥ�����',
  `pic` varchar(255) DEFAULT NULL COMMENT 'չʾͼƬ',
  `sale` int(11) DEFAULT NULL COMMENT '����',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '��Ʒ�����۸�',
  `lock_stock` int(11) DEFAULT '0' COMMENT '�������',
  `sp_data` varchar(500) DEFAULT NULL COMMENT '��Ʒ�������ԣ�json��ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='sku�Ŀ��';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES ('98', '27', '201808270027001', '2699.00', '97', null, null, null, null, '-24', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('99', '27', '201808270027002', '2999.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('100', '27', '201808270027003', '2699.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('101', '27', '201808270027004', '2999.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('102', '28', '201808270028001', '649.00', '99', null, null, null, null, '-8', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('103', '28', '201808270028002', '699.00', '99', null, null, null, null, '-8', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('104', '28', '201808270028003', '649.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('105', '28', '201808270028004', '699.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('106', '29', '201808270029001', '5499.00', '99', null, null, null, null, '-8', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('107', '29', '201808270029002', '6299.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('108', '29', '201808270029003', '5499.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('109', '29', '201808270029004', '6299.00', '100', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('110', '26', '201806070026001', '3788.00', '499', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('111', '26', '201806070026002', '3999.00', '500', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('112', '26', '201806070026003', '3788.00', '500', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('113', '26', '201806070026004', '3999.00', '500', null, null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"����\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES ('163', '36', '202002210036001', '100.00', '100', '25', null, null, null, '9', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('164', '36', '202002210036002', '120.00', '98', '20', null, null, null, '6', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('165', '36', '202002210036003', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('166', '36', '202002210036004', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('167', '36', '202002210036005', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('168', '36', '202002210036006', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('169', '36', '202002210036007', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('170', '36', '202002210036008', '100.00', '100', '20', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('171', '35', '202002250035001', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('172', '35', '202002250035002', '240.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('173', '35', '202002250035003', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('174', '35', '202002250035004', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('175', '35', '202002250035005', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('176', '35', '202002250035006', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"38\"},{\"key\":\"���\",\"value\":\"�＾\"}]');
INSERT INTO `pms_sku_stock` VALUES ('177', '35', '202002250035007', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�ļ�\"}]');
INSERT INTO `pms_sku_stock` VALUES ('178', '35', '202002250035008', '200.00', '100', '50', null, null, null, '0', '[{\"key\":\"��ɫ\",\"value\":\"��ɫ\"},{\"key\":\"�ߴ�\",\"value\":\"39\"},{\"key\":\"���\",\"value\":\"�＾\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '�Żݾ����ͣ�0->ȫ����ȯ��1->��Ա��ȯ��2->������ȯ��3->ע����ȯ',
  `name` varchar(100) DEFAULT NULL,
  `platform` int(1) DEFAULT NULL COMMENT 'ʹ��ƽ̨��0->ȫ����1->�ƶ���2->PC',
  `count` int(11) DEFAULT NULL COMMENT '����',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '���',
  `per_limit` int(11) DEFAULT NULL COMMENT 'ÿ����������',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT 'ʹ���ż���0��ʾ���ż�',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int(1) DEFAULT NULL COMMENT 'ʹ�����ͣ�0->ȫ��ͨ�ã�1->ָ�����ࣻ2->ָ����Ʒ',
  `note` varchar(200) DEFAULT NULL COMMENT '��ע',
  `publish_count` int(11) DEFAULT NULL COMMENT '��������',
  `use_count` int(11) DEFAULT NULL COMMENT '��ʹ������',
  `receive_count` int(11) DEFAULT NULL COMMENT '��ȡ����',
  `enable_time` datetime DEFAULT NULL COMMENT '������ȡ������',
  `code` varchar(64) DEFAULT NULL COMMENT '�Ż���',
  `member_level` int(1) DEFAULT NULL COMMENT '����ȡ�Ļ�Ա���ͣ�0->����ʱ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='�Żݾ��';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES ('2', '0', 'ȫƷ��ͨ��ȯ', '0', '92', '10.00', '1', '100.00', '2018-08-27 16:40:47', '2018-11-23 16:40:47', '0', '��100��10', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('3', '0', 'С���ֻ�ר��ȯ', '0', '92', '50.00', '1', '1000.00', '2018-08-27 16:40:47', '2018-11-16 16:40:47', '2', 'С���ֻ�ר���Ż�ȯ', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('4', '0', '�ֻ�Ʒ��ר��ȯ', '0', '92', '300.00', '1', '2000.00', '2018-08-27 16:40:47', '2018-09-15 16:40:47', '1', '�ֻ�����ר���Ż�ȯ', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('7', '0', 'T������ר���Ż�ȯ', '0', '93', '50.00', '1', '500.00', '2018-08-27 16:40:47', '2018-08-15 16:40:47', '1', '��500��50', '100', '0', '7', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('8', '0', '���Ż�ȯ', '0', '100', '100.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-27 00:00:00', '0', '����', '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('9', '0', 'ȫƷ��ͨ��ȯ', '0', '100', '5.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('10', '0', 'ȫƷ��ͨ��ȯ', '0', '100', '15.00', '1', '200.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('11', '0', 'ȫƷ��ͨ��ȯ', '0', '1000', '50.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '1000', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('12', '0', '�ƶ���ȫƷ��ͨ��ȯ', '1', '1', '10.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('19', '0', '�ֻ�����ר��', '0', '100', '100.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-17 00:00:00', '1', '�ֻ�����ר��', '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('20', '0', 'С���ֻ�ר��', '0', '100', '200.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-24 00:00:00', '2', 'С���ֻ�ר��', '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('21', '0', 'xxx', '0', '100', '10.00', '1', '100.00', '2018-11-09 00:00:00', '2018-11-30 00:00:00', '2', null, '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('22', '0', 'string', '0', '0', '0.00', '0', '0.00', '2019-08-18 15:36:11', '2019-08-18 15:36:11', '0', 'string', '0', '0', '0', '2019-08-18 15:36:11', 'string', '0');
INSERT INTO `sms_coupon` VALUES ('23', '0', '��Ч�ڲ���', '0', '100', '10.00', '1', '100.00', '2019-10-05 00:00:00', '2019-10-09 00:00:00', '0', null, '100', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `member_nickname` varchar(64) DEFAULT NULL COMMENT '��ȡ���ǳ�',
  `get_type` int(1) DEFAULT NULL COMMENT '��ȡ���ͣ�0->��̨���ͣ�1->������ȡ',
  `create_time` datetime DEFAULT NULL,
  `use_status` int(1) DEFAULT NULL COMMENT 'ʹ��״̬��0->δʹ�ã�1->��ʹ�ã�2->�ѹ���',
  `use_time` datetime DEFAULT NULL COMMENT 'ʹ��ʱ��',
  `order_id` bigint(20) DEFAULT NULL COMMENT '�������',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='�Ż�ȯʹ�á���ȡ��ʷ��';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES ('2', '2', '1', '4931048380330002', 'windir', '1', '2018-08-29 14:04:12', '1', '2018-11-12 14:38:47', '12', '201809150101000001');
INSERT INTO `sms_coupon_history` VALUES ('3', '3', '1', '4931048380330003', 'windir', '1', '2018-08-29 14:04:29', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('4', '4', '1', '4931048380330004', 'windir', '1', '2018-08-29 14:04:32', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('11', '7', '1', '4931048380330001', 'windir', '1', '2018-09-04 16:21:50', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('12', '2', '4', '0340981248320004', 'zhensan', '1', '2018-11-12 14:16:50', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('13', '3', '4', '0342977234360004', 'zhensan', '1', '2018-11-12 14:17:10', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('14', '4', '4', '0343342928830004', 'zhensan', '1', '2018-11-12 14:17:13', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('15', '2', '5', '0351883832180005', 'lisi', '1', '2018-11-12 14:18:39', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('16', '3', '5', '0352201672680005', 'lisi', '1', '2018-11-12 14:18:42', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('17', '4', '5', '0352505810180005', 'lisi', '1', '2018-11-12 14:18:45', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('18', '2', '6', '0356114588380006', 'wangwu', '1', '2018-11-12 14:19:21', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('19', '3', '6', '0356382856920006', 'wangwu', '1', '2018-11-12 14:19:24', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('20', '4', '6', '0356656798470006', 'wangwu', '1', '2018-11-12 14:19:27', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('21', '2', '3', '0363644984620003', 'windy', '1', '2018-11-12 14:20:36', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('22', '3', '3', '0363932820300003', 'windy', '1', '2018-11-12 14:20:39', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('23', '4', '3', '0364238275840003', 'windy', '1', '2018-11-12 14:20:42', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('24', '2', '7', '0385034833070007', 'lion', '1', '2018-11-12 14:24:10', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('25', '3', '7', '0385350208650007', 'lion', '1', '2018-11-12 14:24:13', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('26', '4', '7', '0385632733900007', 'lion', '1', '2018-11-12 14:24:16', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('27', '2', '8', '0388779132990008', 'shari', '1', '2018-11-12 14:24:48', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('28', '3', '8', '0388943658810008', 'shari', '1', '2018-11-12 14:24:49', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('29', '4', '8', '0389069398320008', 'shari', '1', '2018-11-12 14:24:51', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('30', '2', '9', '0390753935250009', 'aewen', '1', '2018-11-12 14:25:08', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('31', '3', '9', '0390882954470009', 'aewen', '1', '2018-11-12 14:25:09', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('32', '4', '9', '0391025542810009', 'aewen', '1', '2018-11-12 14:25:10', '0', null, null, null);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_category_name` varchar(200) DEFAULT NULL COMMENT '��Ʒ��������',
  `parent_category_name` varchar(200) DEFAULT NULL COMMENT '����������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='�Ż�ȯ�Ͳ�Ʒ�����ϵ��';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES ('4', '19', '30', '�ֻ����', '�ֻ�����');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL COMMENT '��Ʒ����',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '��Ʒ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='�Ż�ȯ�Ͳ�Ʒ�Ĺ�ϵ��';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES ('9', '21', '33', 'С�ף�MI��С�׵���4A ', '4609652');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '��ʼ����',
  `end_date` date DEFAULT NULL COMMENT '��������',
  `status` int(1) DEFAULT NULL COMMENT '������״̬',
  `create_time` datetime DEFAULT NULL COMMENT '��ɱʱ�������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='��ʱ����';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES ('2', '�����ҵ�Ҿ߷����ɱ1', '2018-11-12', '2018-11-23', '1', '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES ('3', '�ֻ�����', '2018-11-03', '2018-11-10', '1', '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES ('4', '�����ҵ�Ҿ߷����ɱ3', '2018-11-24', '2018-11-25', '1', '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES ('5', '�����ҵ�Ҿ߷����ɱ4', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES ('6', '�����ҵ�Ҿ߷����ɱ5', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES ('7', '�����ҵ�Ҿ߷����ɱ6', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:35');
INSERT INTO `sms_flash_promotion` VALUES ('8', '�����ҵ�Ҿ߷����ɱ7', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:39');
INSERT INTO `sms_flash_promotion` VALUES ('9', '�����ҵ�Ҿ߷����ɱ8', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES ('13', '����', '2018-11-01', '2018-11-30', '0', '2018-11-19 10:34:24');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `member_phone` varchar(64) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '��Ա����ʱ��',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʱ��֪ͨ��¼';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '���',
  `flash_promotion_id` bigint(20) DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) DEFAULT NULL COMMENT '���',
  `product_id` bigint(20) DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '��ʱ���۸�',
  `flash_promotion_count` int(11) DEFAULT NULL COMMENT '��ʱ������',
  `flash_promotion_limit` int(11) DEFAULT NULL COMMENT 'ÿ���޹�����',
  `sort` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='��Ʒ��ʱ������Ʒ��ϵ��';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('1', '2', '1', '26', '3000.00', '10', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('2', '2', '1', '27', '2000.00', '10', '1', '20');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('3', '2', '1', '28', '599.00', '19', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('4', '2', '1', '29', '4999.00', '10', '1', '100');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('9', '2', '2', '26', '2999.00', '100', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('10', '2', '2', '27', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('11', '2', '2', '28', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('12', '2', '2', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('13', '2', '2', '30', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('14', '2', '3', '31', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('15', '2', '3', '32', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('16', '2', '4', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('17', '2', '4', '34', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('18', '2', '5', '36', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('19', '2', '6', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('20', '2', '6', '34', null, null, null, null);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(200) DEFAULT NULL COMMENT '��������',
  `start_time` time DEFAULT NULL COMMENT 'ÿ�տ�ʼʱ��',
  `end_time` time DEFAULT NULL COMMENT 'ÿ�ս���ʱ��',
  `status` int(1) DEFAULT NULL COMMENT '����״̬��0->�����ã�1->����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='��ʱ�����α�';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES ('1', '8:00', '08:00:29', '09:00:33', '1', '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES ('2', '10:00', '10:00:33', '11:00:33', '1', '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('3', '12:00', '12:00:00', '13:00:22', '1', '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES ('4', '14:00', '14:00:00', '15:00:00', '1', '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES ('5', '16:00', '16:00:00', '17:00:00', '1', '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES ('6', '18:00', '18:00:00', '19:00:00', '1', '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('7', '20:00', '20:00:33', '21:00:33', '0', '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '�ֲ�λ�ã�0->PC��ҳ�ֲ���1->app��ҳ�ֲ�',
  `pic` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '������״̬��0->���ߣ�1->����',
  `click_count` int(11) DEFAULT NULL COMMENT '�����',
  `order_count` int(11) DEFAULT NULL COMMENT '�µ���',
  `url` varchar(500) DEFAULT NULL COMMENT '���ӵ�ַ',
  `note` varchar(500) DEFAULT NULL COMMENT '��ע',
  `sort` int(11) DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='��ҳ�ֲ�����';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES ('2', '�ļ����ȴ���', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', '1', '0', '0', null, '�ļ����ȴ���', '0');
INSERT INTO `sms_home_advertise` VALUES ('3', '�ļ����ȴ���1', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '0', '0', '0', null, '�ļ����ȴ���1', '0');
INSERT INTO `sms_home_advertise` VALUES ('4', '�ļ����ȴ���2', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '1', '0', '0', null, '�ļ����ȴ���2', '0');
INSERT INTO `sms_home_advertise` VALUES ('9', '��Ӱ�Ƽ����', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'www.baidu.com', '��Ӱ�Ƽ����', '100');
INSERT INTO `sms_home_advertise` VALUES ('10', '�����������', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'xxx', null, '99');
INSERT INTO `sms_home_advertise` VALUES ('11', '�����Ƽ����', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', '1', '0', '0', 'xxx', null, '98');

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='��ҳ�Ƽ�Ʒ�Ʊ�';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES ('1', '1', '���', '1', '200');
INSERT INTO `sms_home_brand` VALUES ('2', '2', '����', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('6', '6', 'С��', '1', '300');
INSERT INTO `sms_home_brand` VALUES ('8', '5', '��̫', '1', '100');
INSERT INTO `sms_home_brand` VALUES ('31', '49', '��ƥ��', '0', '0');
INSERT INTO `sms_home_brand` VALUES ('32', '50', '����֮��', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('33', '51', 'ƻ��', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('34', '2', '����', '0', '0');
INSERT INTO `sms_home_brand` VALUES ('35', '3', '��Ϊ', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('36', '4', '����', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('37', '5', '��̫', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('38', '1', '���', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('39', '21', 'OPPO', '1', '0');

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='���ʺ����';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES ('2', '27', 'С��8 ȫ������Ϸ�����ֻ� 6GB+64GB ��ɫ ȫ��ͨ4G ˫��˫��', '1', '200');
INSERT INTO `sms_home_new_product` VALUES ('8', '26', '��Ϊ HUAWEI P20 ', '0', '0');
INSERT INTO `sms_home_new_product` VALUES ('9', '27', 'С��8 ȫ������Ϸ�����ֻ� 6GB+64GB ��ɫ ȫ��ͨ4G ˫��˫��', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('10', '28', 'С�� ����5A ȫ��ͨ�� 3GB+32GB ���Ľ� �ƶ���ͨ����4G�ֻ� ˫��˫��', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('11', '29', 'Apple iPhone 8 Plus 64GB ��ɫ�ر�� �ƶ���ͨ����4G�ֻ�', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('12', '30', 'HLA����֮�Ҽ�Լ����ӡ������T��', '1', '0');

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='�����Ƽ���Ʒ��';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES ('3', '26', '��Ϊ HUAWEI P20 ', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('4', '27', 'С��8 ȫ������Ϸ�����ֻ� 6GB+64GB ��ɫ ȫ��ͨ4G ˫��˫��', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('5', '28', 'С�� ����5A ȫ��ͨ�� 3GB+32GB ���Ľ� �ƶ���ͨ����4G�ֻ� ˫��˫��', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('6', '29', 'Apple iPhone 8 Plus 64GB ��ɫ�ر�� �ƶ���ͨ����4G�ֻ�', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('7', '30', 'HLA����֮�Ҽ�Լ����ӡ������T��', '1', '100');

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='��ҳ�Ƽ�ר���';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES ('14', '1', 'polo������Ҳʱ��', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('15', '2', '�����ֻ��ͼ���', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('16', '3', '����845��Ʒ����', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('17', '4', '����Ӧ�ô�ʲô', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('18', '5', '�ļ���ѡ', '1', '100');
INSERT INTO `sms_home_recommend_subject` VALUES ('19', '6', 'Ʒ���ֻ�����', '1', '0');

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT 'ͷ��',
  `email` varchar(100) DEFAULT NULL COMMENT '����',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '�ǳ�',
  `note` varchar(500) DEFAULT NULL COMMENT '��ע��Ϣ',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `login_time` datetime DEFAULT NULL COMMENT '����¼ʱ��',
  `status` int(1) DEFAULT '1' COMMENT '�ʺ�����״̬��0->���ã�1->����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='��̨�û���';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES ('1', 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'test@qq.com', '�����˺�', null, '2018-09-29 13:55:30', '2018-09-29 13:55:39', '1');
INSERT INTO `ums_admin` VALUES ('3', 'admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'admin@163.com', 'ϵͳ����Ա', 'ϵͳ����Ա', '2018-10-08 13:32:47', '2019-04-20 12:45:16', '1');
INSERT INTO `ums_admin` VALUES ('4', 'macro', '$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa', 'string', 'macro@qq.com', 'macro', 'macroר��', '2019-10-06 15:53:51', '2020-02-03 14:55:55', '1');
INSERT INTO `ums_admin` VALUES ('6', 'productAdmin', '$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm', null, 'product@qq.com', '��Ʒ����Ա', 'ֻ����ƷȨ��', '2020-02-07 16:15:08', null, '1');
INSERT INTO `ums_admin` VALUES ('7', 'orderAdmin', '$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.', null, 'order@qq.com', '��������Ա', 'ֻ�ж�������Ȩ��', '2020-02-07 16:15:50', null, '1');

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '�������¼����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='��̨�û���¼��־��';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES ('1', '3', '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('2', '3', '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('3', '3', '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('4', '3', '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('5', '3', '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('6', '3', '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('7', '3', '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('8', '3', '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('9', '3', '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('10', '3', '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('11', '3', '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('12', '3', '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('13', '3', '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('14', '3', '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('15', '3', '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('16', '3', '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('17', '3', '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('18', '3', '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('19', '3', '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('20', '3', '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('21', '3', '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('22', '3', '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('23', '3', '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('24', '3', '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('25', '3', '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('26', '3', '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('27', '3', '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('28', '3', '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('29', '3', '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('30', '3', '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('31', '1', '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('32', '1', '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('33', '3', '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('34', '3', '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('35', '3', '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('36', '3', '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('37', '3', '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('38', '3', '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('39', '4', '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('40', '4', '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('41', '4', '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('42', '4', '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('43', '4', '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('44', '3', '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('45', '3', '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('46', '3', '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('47', '3', '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('48', '3', '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('49', '3', '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('50', '3', '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('51', '6', '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('52', '3', '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('53', '3', '2019-11-30 21:25:30', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('54', '3', '2019-11-30 21:27:54', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('55', '3', '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('56', '3', '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('57', '3', '2020-01-04 16:00:54', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('58', '3', '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('59', '3', '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('60', '3', '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('61', '3', '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('62', '3', '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('63', '3', '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('64', '3', '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('65', '3', '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('66', '3', '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('67', '3', '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('68', '3', '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('69', '3', '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('70', '3', '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('71', '3', '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('72', '3', '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('73', '3', '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('74', '3', '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('75', '3', '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('76', '3', '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('77', '3', '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('78', '3', '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('79', '3', '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('80', '3', '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('81', '3', '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('82', '3', '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('83', '3', '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('84', '3', '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('85', '3', '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('86', '3', '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('87', '3', '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('88', '3', '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('89', '3', '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('90', '3', '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('91', '3', '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('92', '3', '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('93', '3', '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('94', '3', '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('95', '3', '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('96', '3', '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('97', '3', '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('98', '3', '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('99', '3', '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('100', '3', '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('101', '3', '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('102', '3', '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('103', '3', '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('104', '3', '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('105', '3', '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('106', '3', '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('107', '3', '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('108', '3', '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('109', '3', '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('110', '3', '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('111', '3', '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('112', '3', '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('113', '3', '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('114', '3', '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('115', '3', '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('116', '3', '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('117', '3', '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('118', '5', '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('119', '5', '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('120', '5', '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('121', '3', '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('122', '5', '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('123', '3', '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('124', '3', '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('125', '5', '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('126', '3', '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('127', '1', '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('128', '3', '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('129', '3', '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('130', '3', '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('131', '3', '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('132', '3', '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('133', '4', '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('134', '3', '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('135', '3', '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('136', '3', '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('137', '3', '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('138', '1', '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('139', '3', '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('140', '3', '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('141', '3', '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('142', '3', '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('143', '3', '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('144', '3', '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('145', '3', '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('146', '6', '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('147', '7', '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('148', '3', '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('149', '7', '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('150', '3', '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('151', '3', '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('152', '3', '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('153', '3', '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('154', '3', '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('155', '3', '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('156', '3', '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('157', '3', '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('158', '3', '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('159', '3', '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('160', '3', '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('161', '3', '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('162', '3', '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('163', '3', '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('164', '6', '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('165', '6', '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('166', '6', '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('167', '6', '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('168', '3', '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('169', '6', '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('170', '3', '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('171', '3', '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('172', '3', '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('173', '3', '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('174', '3', '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('175', '3', '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('176', '3', '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('177', '3', '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('178', '3', '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('179', '3', '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('180', '6', '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('181', '6', '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('182', '3', '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('183', '3', '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('184', '8', '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('185', '8', '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('186', '8', '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('187', '8', '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('188', '8', '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('189', '8', '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('190', '8', '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('191', '8', '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('192', '8', '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('193', '3', '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('194', '3', '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('195', '3', '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', null, null);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��̨�û���Ȩ�޹�ϵ��(����ɫ�ж����Ȩ������ļӼ�Ȩ��)';

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='��̨�û��ͽ�ɫ��ϵ��';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES ('26', '3', '5');
INSERT INTO `ums_admin_role_relation` VALUES ('27', '6', '1');
INSERT INTO `ums_admin_role_relation` VALUES ('28', '7', '2');
INSERT INTO `ums_admin_role_relation` VALUES ('29', '1', '5');
INSERT INTO `ums_admin_role_relation` VALUES ('30', '4', '5');

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '�ı����ͣ�0->���ӣ�1->����',
  `change_count` int(11) DEFAULT NULL COMMENT '���ָı�����',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '������Ա',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '������ע',
  `source_type` int(1) DEFAULT NULL COMMENT '������Դ��0->���1->����Ա�޸�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�ɳ�ֵ�仯��ʷ��¼��';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES ('1', '1', '2018-08-29 17:16:35', '0', '1000', 'test', '����ʹ��', '1');

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '�ı����ͣ�0->���ӣ�1->����',
  `change_count` int(11) DEFAULT NULL COMMENT '���ָı�����',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '������Ա',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '������ע',
  `source_type` int(1) DEFAULT NULL COMMENT '������Դ��0->���1->����Ա�޸�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ֱ仯��ʷ��¼��';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) DEFAULT NULL COMMENT 'ÿһԪ��Ҫ�ֿ۵Ļ�������',
  `max_percent_per_order` int(11) DEFAULT NULL COMMENT 'ÿ�ʶ�����ߵ��ðٷֱ�',
  `use_unit` int(11) DEFAULT NULL COMMENT 'ÿ��ʹ�û�����С��λ100',
  `coupon_status` int(1) DEFAULT NULL COMMENT '�Ƿ���Ժ��Ż�ȯͬ�ã�0->�����ԣ�1->����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='������������';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES ('1', '100', '50', '100', '1');

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '�û���',
  `password` varchar(64) DEFAULT NULL COMMENT '����',
  `nickname` varchar(64) DEFAULT NULL COMMENT '�ǳ�',
  `phone` varchar(64) DEFAULT NULL COMMENT '�ֻ�����',
  `status` int(1) DEFAULT NULL COMMENT '�ʺ�����״̬:0->���ã�1->����',
  `create_time` datetime DEFAULT NULL COMMENT 'ע��ʱ��',
  `icon` varchar(500) DEFAULT NULL COMMENT 'ͷ��',
  `gender` int(1) DEFAULT NULL COMMENT '�Ա�0->δ֪��1->�У�2->Ů',
  `birthday` date DEFAULT NULL COMMENT '����',
  `city` varchar(64) DEFAULT NULL COMMENT '��������',
  `job` varchar(100) DEFAULT NULL COMMENT 'ְҵ',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '����ǩ��',
  `source_type` int(1) DEFAULT NULL COMMENT '�û���Դ',
  `integration` int(11) DEFAULT NULL COMMENT '����',
  `growth` int(11) DEFAULT NULL COMMENT '�ɳ�ֵ',
  `luckey_count` int(11) DEFAULT NULL COMMENT 'ʣ��齱����',
  `history_integration` int(11) DEFAULT NULL COMMENT '��ʷ��������',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='��Ա��';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES ('1', '4', 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windir', '18061581849', '1', '2018-08-02 10:35:44', null, '1', '2009-06-01', '�Ϻ�', 'ѧ��', 'test', null, '5000', null, null, null);
INSERT INTO `ums_member` VALUES ('3', '4', 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', '1', '2018-08-03 16:46:38', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('4', '4', 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', '1', '2018-11-12 14:12:04', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('5', '4', 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', '1', '2018-11-12 14:12:38', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('6', '4', 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', '1', '2018-11-12 14:13:09', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('7', '4', 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', '1', '2018-11-12 14:21:39', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('8', '4', 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', '1', '2018-11-12 14:22:00', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('9', '4', 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', '1', '2018-11-12 14:22:55', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '�Ƿ�ΪĬ�ϵȼ���0->���ǣ�1->��',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '���˷ѱ�׼',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT 'ÿ�����ۻ�ȡ�ĳɳ�ֵ',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '�Ƿ���������Ȩ',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '�Ƿ���ǩ����Ȩ',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '�Ƿ������ۻ�����Ȩ',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '�Ƿ���ר����Ȩ',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '�Ƿ��л�Ա�۸���Ȩ',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '�Ƿ���������Ȩ',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��Ա�ȼ���';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES ('1', '�ƽ��Ա', '1000', '0', '199.00', '5', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('2', '�׽��Ա', '5000', '0', '99.00', '10', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('3', '��ʯ��Ա', '15000', '0', '69.00', '15', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('4', '��ͨ��Ա', '1', '1', '199.00', '20', '1', '1', '1', '1', '0', '0', null);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '��¼���ͣ�0->PC��1->android;2->ios;3->С����',
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա��¼��¼';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û��ͱ�ǩ��ϵ��';

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա���Ʒ�����ϵ���û�ϲ���ķ��ࣩ';

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '�ջ�������',
  `phone_number` varchar(64) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '�Ƿ�ΪĬ��',
  `post_code` varchar(100) DEFAULT NULL COMMENT '��������',
  `province` varchar(100) DEFAULT NULL COMMENT 'ʡ��/ֱϽ��',
  `city` varchar(100) DEFAULT NULL COMMENT '����',
  `region` varchar(100) DEFAULT NULL COMMENT '��',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '��ϸ��ַ(�ֵ�)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��Ա�ջ���ַ��';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES ('1', '1', '����', '18033441849', '0', '518000', '�㶫ʡ', '������', '��ɽ��', '���˿�ѧ԰');
INSERT INTO `ums_member_receive_address` VALUES ('3', '1', '����', '18033441849', '0', '518000', '�㶫ʡ', '������', '������', '��ˮ�ӽֵ�');
INSERT INTO `ums_member_receive_address` VALUES ('4', '1', '����', '18033441849', '1', '518000', '�㶫ʡ', '������', '������', '�����ֵ�');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) DEFAULT NULL COMMENT '����ǩ������',
  `continue_sign_point` int(11) DEFAULT NULL COMMENT '����ǩ����������',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT 'ÿ���Ѷ���Ԫ��ȡ1����',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '��ͻ�ȡ�����Ķ������',
  `max_point_per_order` int(11) DEFAULT NULL COMMENT 'ÿ�ʶ�����߻�ȡ����',
  `type` int(1) DEFAULT NULL COMMENT '���ͣ�0->���ֹ���1->�ɳ�ֵ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա���ֳɳ������';

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '�ۼ����ѽ��',
  `order_count` int(11) DEFAULT NULL COMMENT '��������',
  `coupon_count` int(11) DEFAULT NULL COMMENT '�Ż�ȯ����',
  `comment_count` int(11) DEFAULT NULL COMMENT '������',
  `return_order_count` int(11) DEFAULT NULL COMMENT '�˻�����',
  `login_count` int(11) DEFAULT NULL COMMENT '��¼����',
  `attend_count` int(11) DEFAULT NULL COMMENT '��ע����',
  `fans_count` int(11) DEFAULT NULL COMMENT '��˿����',
  `collect_product_count` int(11) DEFAULT NULL,
  `collect_subject_count` int(11) DEFAULT NULL,
  `collect_topic_count` int(11) DEFAULT NULL,
  `collect_comment_count` int(11) DEFAULT NULL,
  `invite_friend_count` int(11) DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '���һ���¶���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Աͳ����Ϣ';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `finish_order_count` int(11) DEFAULT NULL COMMENT '�Զ����ǩ��ɶ�������',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '�Զ����ǩ��ɶ������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���ǩ��';

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth` int(11) DEFAULT NULL COMMENT '���ͳɳ�ֵ',
  `intergration` int(11) DEFAULT NULL COMMENT '���ͻ���',
  `type` int(1) DEFAULT NULL COMMENT '�������ͣ�0->��������1->�ճ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա�����';

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '����ID',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `title` varchar(100) DEFAULT NULL COMMENT '�˵�����',
  `level` int(4) DEFAULT NULL COMMENT '�˵�����',
  `sort` int(4) DEFAULT NULL COMMENT '�˵�����',
  `name` varchar(100) DEFAULT NULL COMMENT 'ǰ������',
  `icon` varchar(200) DEFAULT NULL COMMENT 'ǰ��ͼ��',
  `hidden` int(1) DEFAULT NULL COMMENT 'ǰ������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='��̨�˵���';

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES ('1', '0', '2020-02-02 14:50:36', '��Ʒ', '0', '0', 'pms', 'product', '0');
INSERT INTO `ums_menu` VALUES ('2', '1', '2020-02-02 14:51:50', '��Ʒ�б�', '1', '0', 'product', 'product-list', '0');
INSERT INTO `ums_menu` VALUES ('3', '1', '2020-02-02 14:52:44', '�����Ʒ', '1', '0', 'addProduct', 'product-add', '0');
INSERT INTO `ums_menu` VALUES ('4', '1', '2020-02-02 14:53:51', '��Ʒ����', '1', '0', 'productCate', 'product-cate', '0');
INSERT INTO `ums_menu` VALUES ('5', '1', '2020-02-02 14:54:51', '��Ʒ����', '1', '0', 'productAttr', 'product-attr', '0');
INSERT INTO `ums_menu` VALUES ('6', '1', '2020-02-02 14:56:29', 'Ʒ�ƹ���', '1', '0', 'brand', 'product-brand', '0');
INSERT INTO `ums_menu` VALUES ('7', '0', '2020-02-02 16:54:07', '����', '0', '0', 'oms', 'order', '0');
INSERT INTO `ums_menu` VALUES ('8', '7', '2020-02-02 16:55:18', '�����б�', '1', '0', 'order', 'product-list', '0');
INSERT INTO `ums_menu` VALUES ('9', '7', '2020-02-02 16:56:46', '��������', '1', '0', 'orderSetting', 'order-setting', '0');
INSERT INTO `ums_menu` VALUES ('10', '7', '2020-02-02 16:57:39', '�˻����봦��', '1', '0', 'returnApply', 'order-return', '0');
INSERT INTO `ums_menu` VALUES ('11', '7', '2020-02-02 16:59:40', '�˻�ԭ������', '1', '0', 'returnReason', 'order-return-reason', '0');
INSERT INTO `ums_menu` VALUES ('12', '0', '2020-02-04 16:18:00', 'Ӫ��', '0', '0', 'sms', 'sms', '0');
INSERT INTO `ums_menu` VALUES ('13', '12', '2020-02-04 16:19:22', '��ɱ��б�', '1', '0', 'flash', 'sms-flash', '0');
INSERT INTO `ums_menu` VALUES ('14', '12', '2020-02-04 16:20:16', '�Ż�ȯ�б�', '1', '0', 'coupon', 'sms-coupon', '0');
INSERT INTO `ums_menu` VALUES ('16', '12', '2020-02-07 16:22:38', 'Ʒ���Ƽ�', '1', '0', 'homeBrand', 'product-brand', '0');
INSERT INTO `ums_menu` VALUES ('17', '12', '2020-02-07 16:23:14', '��Ʒ�Ƽ�', '1', '0', 'homeNew', 'sms-new', '0');
INSERT INTO `ums_menu` VALUES ('18', '12', '2020-02-07 16:26:38', '�����Ƽ�', '1', '0', 'homeHot', 'sms-hot', '0');
INSERT INTO `ums_menu` VALUES ('19', '12', '2020-02-07 16:28:16', 'ר���Ƽ�', '1', '0', 'homeSubject', 'sms-subject', '0');
INSERT INTO `ums_menu` VALUES ('20', '12', '2020-02-07 16:28:42', '����б�', '1', '0', 'homeAdvertise', 'sms-ad', '0');
INSERT INTO `ums_menu` VALUES ('21', '0', '2020-02-07 16:29:13', 'Ȩ��', '0', '0', 'ums', 'ums', '0');
INSERT INTO `ums_menu` VALUES ('22', '21', '2020-02-07 16:29:51', '�û��б�', '1', '0', 'admin', 'ums-admin', '0');
INSERT INTO `ums_menu` VALUES ('23', '21', '2020-02-07 16:30:13', '��ɫ�б�', '1', '0', 'role', 'ums-role', '0');
INSERT INTO `ums_menu` VALUES ('24', '21', '2020-02-07 16:30:53', '�˵��б�', '1', '0', 'menu', 'ums-menu', '0');
INSERT INTO `ums_menu` VALUES ('25', '21', '2020-02-07 16:31:13', '��Դ�б�', '1', '0', 'resource', 'ums-resource', '0');

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '����Ȩ��id',
  `name` varchar(100) DEFAULT NULL COMMENT '����',
  `value` varchar(200) DEFAULT NULL COMMENT 'Ȩ��ֵ',
  `icon` varchar(500) DEFAULT NULL COMMENT 'ͼ��',
  `type` int(1) DEFAULT NULL COMMENT 'Ȩ�����ͣ�0->Ŀ¼��1->�˵���2->��ť���ӿڰ�Ȩ�ޣ�',
  `uri` varchar(200) DEFAULT NULL COMMENT 'ǰ����Դ·��',
  `status` int(1) DEFAULT NULL COMMENT '����״̬��0->���ã�1->����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `sort` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='��̨�û�Ȩ�ޱ�';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES ('1', '0', '��Ʒ', null, null, '0', null, '1', '2018-09-29 16:15:14', '0');
INSERT INTO `ums_permission` VALUES ('2', '1', '��Ʒ�б�', 'pms:product:read', null, '1', '/pms/product/index', '1', '2018-09-29 16:17:01', '0');
INSERT INTO `ums_permission` VALUES ('3', '1', '�����Ʒ', 'pms:product:create', null, '1', '/pms/product/add', '1', '2018-09-29 16:18:51', '0');
INSERT INTO `ums_permission` VALUES ('4', '1', '��Ʒ����', 'pms:productCategory:read', null, '1', '/pms/productCate/index', '1', '2018-09-29 16:23:07', '0');
INSERT INTO `ums_permission` VALUES ('5', '1', '��Ʒ����', 'pms:productAttribute:read', null, '1', '/pms/productAttr/index', '1', '2018-09-29 16:24:43', '0');
INSERT INTO `ums_permission` VALUES ('6', '1', 'Ʒ�ƹ���', 'pms:brand:read', null, '1', '/pms/brand/index', '1', '2018-09-29 16:25:45', '0');
INSERT INTO `ums_permission` VALUES ('7', '2', '�༭��Ʒ', 'pms:product:update', null, '2', '/pms/product/updateProduct', '1', '2018-09-29 16:34:23', '0');
INSERT INTO `ums_permission` VALUES ('8', '2', 'ɾ����Ʒ', 'pms:product:delete', null, '2', '/pms/product/delete', '1', '2018-09-29 16:38:33', '0');
INSERT INTO `ums_permission` VALUES ('9', '4', '�����Ʒ����', 'pms:productCategory:create', null, '2', '/pms/productCate/create', '1', '2018-09-29 16:43:23', '0');
INSERT INTO `ums_permission` VALUES ('10', '4', '�޸���Ʒ����', 'pms:productCategory:update', null, '2', '/pms/productCate/update', '1', '2018-09-29 16:43:55', '0');
INSERT INTO `ums_permission` VALUES ('11', '4', 'ɾ����Ʒ����', 'pms:productCategory:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:44:38', '0');
INSERT INTO `ums_permission` VALUES ('12', '5', '�����Ʒ����', 'pms:productAttribute:create', null, '2', '/pms/productAttr/create', '1', '2018-09-29 16:45:25', '0');
INSERT INTO `ums_permission` VALUES ('13', '5', '�޸���Ʒ����', 'pms:productAttribute:update', null, '2', '/pms/productAttr/update', '1', '2018-09-29 16:48:08', '0');
INSERT INTO `ums_permission` VALUES ('14', '5', 'ɾ����Ʒ����', 'pms:productAttribute:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:48:44', '0');
INSERT INTO `ums_permission` VALUES ('15', '6', '���Ʒ��', 'pms:brand:create', null, '2', '/pms/brand/add', '1', '2018-09-29 16:49:34', '0');
INSERT INTO `ums_permission` VALUES ('16', '6', '�޸�Ʒ��', 'pms:brand:update', null, '2', '/pms/brand/update', '1', '2018-09-29 16:50:55', '0');
INSERT INTO `ums_permission` VALUES ('17', '6', 'ɾ��Ʒ��', 'pms:brand:delete', null, '2', '/pms/brand/delete', '1', '2018-09-29 16:50:59', '0');
INSERT INTO `ums_permission` VALUES ('18', '0', '��ҳ', null, null, '0', null, '1', '2018-09-29 16:51:57', '0');

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `name` varchar(200) DEFAULT NULL COMMENT '��Դ����',
  `url` varchar(200) DEFAULT NULL COMMENT '��ԴURL',
  `description` varchar(500) DEFAULT NULL COMMENT '����',
  `category_id` bigint(20) DEFAULT NULL COMMENT '��Դ����ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='��̨��Դ��';

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES ('1', '2020-02-04 17:04:55', '��ƷƷ�ƹ���', '/brand/**', null, '1');
INSERT INTO `ums_resource` VALUES ('2', '2020-02-04 17:05:35', '��Ʒ���Է������', '/productAttribute/**', null, '1');
INSERT INTO `ums_resource` VALUES ('3', '2020-02-04 17:06:13', '��Ʒ���Թ���', '/productAttribute/**', null, '1');
INSERT INTO `ums_resource` VALUES ('4', '2020-02-04 17:07:15', '��Ʒ�������', '/productCategory/**', null, '1');
INSERT INTO `ums_resource` VALUES ('5', '2020-02-04 17:09:16', '��Ʒ����', '/product/**', null, '1');
INSERT INTO `ums_resource` VALUES ('6', '2020-02-04 17:09:53', '��Ʒ������', '/sku/**', null, '1');
INSERT INTO `ums_resource` VALUES ('8', '2020-02-05 14:43:37', '��������', '/order/**', '', '2');
INSERT INTO `ums_resource` VALUES ('9', '2020-02-05 14:44:22', ' �����˻��������', '/returnApply/**', '', '2');
INSERT INTO `ums_resource` VALUES ('10', '2020-02-05 14:45:08', '�˻�ԭ�����', '/returnReason/**', '', '2');
INSERT INTO `ums_resource` VALUES ('11', '2020-02-05 14:45:43', '�������ù���', '/orderSetting/**', '', '2');
INSERT INTO `ums_resource` VALUES ('12', '2020-02-05 14:46:23', '�ջ���ַ����', '/companyAddress/**', '', '2');
INSERT INTO `ums_resource` VALUES ('13', '2020-02-07 16:37:22', '�Ż�ȯ����', '/coupon/**', '', '3');
INSERT INTO `ums_resource` VALUES ('14', '2020-02-07 16:37:59', '�Ż�ȯ��ȡ��¼����', '/couponHistory/**', '', '3');
INSERT INTO `ums_resource` VALUES ('15', '2020-02-07 16:38:28', '��ʱ�������', '/flash/**', '', '3');
INSERT INTO `ums_resource` VALUES ('16', '2020-02-07 16:38:59', '��ʱ����Ʒ��ϵ����', '/flashProductRelation/**', '', '3');
INSERT INTO `ums_resource` VALUES ('17', '2020-02-07 16:39:22', '��ʱ�����ι���', '/flashSession/**', '', '3');
INSERT INTO `ums_resource` VALUES ('18', '2020-02-07 16:40:07', '��ҳ�ֲ�������', '/home/advertise/**', '', '3');
INSERT INTO `ums_resource` VALUES ('19', '2020-02-07 16:40:34', '��ҳƷ�ƹ���', '/home/brand/**', '', '3');
INSERT INTO `ums_resource` VALUES ('20', '2020-02-07 16:41:06', '��ҳ��Ʒ����', '/home/newProduct/**', '', '3');
INSERT INTO `ums_resource` VALUES ('21', '2020-02-07 16:42:16', '��ҳ�����Ƽ�����', '/home/recommendProduct/**', '', '3');
INSERT INTO `ums_resource` VALUES ('22', '2020-02-07 16:42:48', '��ҳר���Ƽ�����', '/home/recommendSubject/**', '', '3');
INSERT INTO `ums_resource` VALUES ('23', '2020-02-07 16:44:56', ' ��Ʒ��ѡ����', '/prefrenceArea/**', '', '5');
INSERT INTO `ums_resource` VALUES ('24', '2020-02-07 16:45:39', '��Ʒר�����', '/subject/**', '', '5');
INSERT INTO `ums_resource` VALUES ('25', '2020-02-07 16:47:34', '��̨�û�����', '/admin/**', '', '4');
INSERT INTO `ums_resource` VALUES ('26', '2020-02-07 16:48:24', '��̨�û���ɫ����', '/role/**', '', '4');
INSERT INTO `ums_resource` VALUES ('27', '2020-02-07 16:48:48', '��̨�˵�����', '/menu/**', '', '4');
INSERT INTO `ums_resource` VALUES ('28', '2020-02-07 16:49:18', '��̨��Դ�������', '/resourceCategory/**', '', '4');
INSERT INTO `ums_resource` VALUES ('29', '2020-02-07 16:49:45', '��̨��Դ����', '/resource/**', '', '4');

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `name` varchar(200) DEFAULT NULL COMMENT '��������',
  `sort` int(4) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='��Դ�����';

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES ('1', '2020-02-05 10:21:44', '��Ʒģ��', '0');
INSERT INTO `ums_resource_category` VALUES ('2', '2020-02-05 10:22:34', '����ģ��', '0');
INSERT INTO `ums_resource_category` VALUES ('3', '2020-02-05 10:22:48', 'Ӫ��ģ��', '0');
INSERT INTO `ums_resource_category` VALUES ('4', '2020-02-05 10:23:04', 'Ȩ��ģ��', '0');
INSERT INTO `ums_resource_category` VALUES ('5', '2020-02-07 16:34:27', '����ģ��', '0');
INSERT INTO `ums_resource_category` VALUES ('6', '2020-02-07 16:35:49', '����ģ��', '0');

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '����',
  `description` varchar(500) DEFAULT NULL COMMENT '����',
  `admin_count` int(11) DEFAULT NULL COMMENT '��̨�û�����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `status` int(1) DEFAULT '1' COMMENT '����״̬��0->���ã�1->����',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='��̨�û���ɫ��';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES ('1', '��Ʒ����Ա', 'ֻ�ܲ鿴��������Ʒ', '0', '2020-02-03 16:50:37', '1', '0');
INSERT INTO `ums_role` VALUES ('2', '��������Ա', 'ֻ�ܲ鿴����������', '0', '2018-09-30 15:53:45', '1', '0');
INSERT INTO `ums_role` VALUES ('5', '��������Ա', 'ӵ�����в鿴�Ͳ�������', '0', '2020-02-02 15:11:05', '1', '0');

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '�˵�ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='��̨��ɫ�˵���ϵ��';

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES ('33', '1', '1');
INSERT INTO `ums_role_menu_relation` VALUES ('34', '1', '2');
INSERT INTO `ums_role_menu_relation` VALUES ('35', '1', '3');
INSERT INTO `ums_role_menu_relation` VALUES ('36', '1', '4');
INSERT INTO `ums_role_menu_relation` VALUES ('37', '1', '5');
INSERT INTO `ums_role_menu_relation` VALUES ('38', '1', '6');
INSERT INTO `ums_role_menu_relation` VALUES ('53', '2', '7');
INSERT INTO `ums_role_menu_relation` VALUES ('54', '2', '8');
INSERT INTO `ums_role_menu_relation` VALUES ('55', '2', '9');
INSERT INTO `ums_role_menu_relation` VALUES ('56', '2', '10');
INSERT INTO `ums_role_menu_relation` VALUES ('57', '2', '11');
INSERT INTO `ums_role_menu_relation` VALUES ('72', '5', '1');
INSERT INTO `ums_role_menu_relation` VALUES ('73', '5', '2');
INSERT INTO `ums_role_menu_relation` VALUES ('74', '5', '3');
INSERT INTO `ums_role_menu_relation` VALUES ('75', '5', '4');
INSERT INTO `ums_role_menu_relation` VALUES ('76', '5', '5');
INSERT INTO `ums_role_menu_relation` VALUES ('77', '5', '6');
INSERT INTO `ums_role_menu_relation` VALUES ('78', '5', '7');
INSERT INTO `ums_role_menu_relation` VALUES ('79', '5', '8');
INSERT INTO `ums_role_menu_relation` VALUES ('80', '5', '9');
INSERT INTO `ums_role_menu_relation` VALUES ('81', '5', '10');
INSERT INTO `ums_role_menu_relation` VALUES ('82', '5', '11');
INSERT INTO `ums_role_menu_relation` VALUES ('83', '5', '12');
INSERT INTO `ums_role_menu_relation` VALUES ('84', '5', '13');
INSERT INTO `ums_role_menu_relation` VALUES ('85', '5', '14');
INSERT INTO `ums_role_menu_relation` VALUES ('86', '5', '16');
INSERT INTO `ums_role_menu_relation` VALUES ('87', '5', '17');
INSERT INTO `ums_role_menu_relation` VALUES ('88', '5', '18');
INSERT INTO `ums_role_menu_relation` VALUES ('89', '5', '19');
INSERT INTO `ums_role_menu_relation` VALUES ('90', '5', '20');
INSERT INTO `ums_role_menu_relation` VALUES ('91', '5', '21');
INSERT INTO `ums_role_menu_relation` VALUES ('92', '5', '22');
INSERT INTO `ums_role_menu_relation` VALUES ('93', '5', '23');
INSERT INTO `ums_role_menu_relation` VALUES ('94', '5', '24');
INSERT INTO `ums_role_menu_relation` VALUES ('95', '5', '25');

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='��̨�û���ɫ��Ȩ�޹�ϵ��';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES ('1', '1', '1');
INSERT INTO `ums_role_permission_relation` VALUES ('2', '1', '2');
INSERT INTO `ums_role_permission_relation` VALUES ('3', '1', '3');
INSERT INTO `ums_role_permission_relation` VALUES ('4', '1', '7');
INSERT INTO `ums_role_permission_relation` VALUES ('5', '1', '8');
INSERT INTO `ums_role_permission_relation` VALUES ('6', '2', '4');
INSERT INTO `ums_role_permission_relation` VALUES ('7', '2', '9');
INSERT INTO `ums_role_permission_relation` VALUES ('8', '2', '10');
INSERT INTO `ums_role_permission_relation` VALUES ('9', '2', '11');
INSERT INTO `ums_role_permission_relation` VALUES ('10', '3', '5');
INSERT INTO `ums_role_permission_relation` VALUES ('11', '3', '12');
INSERT INTO `ums_role_permission_relation` VALUES ('12', '3', '13');
INSERT INTO `ums_role_permission_relation` VALUES ('13', '3', '14');
INSERT INTO `ums_role_permission_relation` VALUES ('14', '4', '6');
INSERT INTO `ums_role_permission_relation` VALUES ('15', '4', '15');
INSERT INTO `ums_role_permission_relation` VALUES ('16', '4', '16');
INSERT INTO `ums_role_permission_relation` VALUES ('17', '4', '17');

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '��ԴID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COMMENT='��̨��ɫ��Դ��ϵ��';

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES ('103', '2', '8');
INSERT INTO `ums_role_resource_relation` VALUES ('104', '2', '9');
INSERT INTO `ums_role_resource_relation` VALUES ('105', '2', '10');
INSERT INTO `ums_role_resource_relation` VALUES ('106', '2', '11');
INSERT INTO `ums_role_resource_relation` VALUES ('107', '2', '12');
INSERT INTO `ums_role_resource_relation` VALUES ('142', '5', '1');
INSERT INTO `ums_role_resource_relation` VALUES ('143', '5', '2');
INSERT INTO `ums_role_resource_relation` VALUES ('144', '5', '3');
INSERT INTO `ums_role_resource_relation` VALUES ('145', '5', '4');
INSERT INTO `ums_role_resource_relation` VALUES ('146', '5', '5');
INSERT INTO `ums_role_resource_relation` VALUES ('147', '5', '6');
INSERT INTO `ums_role_resource_relation` VALUES ('148', '5', '8');
INSERT INTO `ums_role_resource_relation` VALUES ('149', '5', '9');
INSERT INTO `ums_role_resource_relation` VALUES ('150', '5', '10');
INSERT INTO `ums_role_resource_relation` VALUES ('151', '5', '11');
INSERT INTO `ums_role_resource_relation` VALUES ('152', '5', '12');
INSERT INTO `ums_role_resource_relation` VALUES ('153', '5', '13');
INSERT INTO `ums_role_resource_relation` VALUES ('154', '5', '14');
INSERT INTO `ums_role_resource_relation` VALUES ('155', '5', '15');
INSERT INTO `ums_role_resource_relation` VALUES ('156', '5', '16');
INSERT INTO `ums_role_resource_relation` VALUES ('157', '5', '17');
INSERT INTO `ums_role_resource_relation` VALUES ('158', '5', '18');
INSERT INTO `ums_role_resource_relation` VALUES ('159', '5', '19');
INSERT INTO `ums_role_resource_relation` VALUES ('160', '5', '20');
INSERT INTO `ums_role_resource_relation` VALUES ('161', '5', '21');
INSERT INTO `ums_role_resource_relation` VALUES ('162', '5', '22');
INSERT INTO `ums_role_resource_relation` VALUES ('163', '5', '23');
INSERT INTO `ums_role_resource_relation` VALUES ('164', '5', '24');
INSERT INTO `ums_role_resource_relation` VALUES ('165', '5', '25');
INSERT INTO `ums_role_resource_relation` VALUES ('166', '5', '26');
INSERT INTO `ums_role_resource_relation` VALUES ('167', '5', '27');
INSERT INTO `ums_role_resource_relation` VALUES ('168', '5', '28');
INSERT INTO `ums_role_resource_relation` VALUES ('169', '5', '29');
INSERT INTO `ums_role_resource_relation` VALUES ('170', '1', '1');
INSERT INTO `ums_role_resource_relation` VALUES ('171', '1', '2');
INSERT INTO `ums_role_resource_relation` VALUES ('172', '1', '3');
INSERT INTO `ums_role_resource_relation` VALUES ('173', '1', '4');
INSERT INTO `ums_role_resource_relation` VALUES ('174', '1', '5');
INSERT INTO `ums_role_resource_relation` VALUES ('175', '1', '6');
INSERT INTO `ums_role_resource_relation` VALUES ('176', '1', '23');
INSERT INTO `ums_role_resource_relation` VALUES ('177', '1', '24');