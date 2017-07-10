DROP DATABASE IF EXISTS test_book;

CREATE DATABASE test_book;
USE test_book;

DROP TABLE IF EXISTS dict;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS password;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS lifeline;
DROP TABLE IF EXISTS log;

/*字典：用来保存项目中的所有常量*/
CREATE TABLE dict (
  dict_id        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,                /*主键*/
  dict_parent_id BIGINT UNSIGNED,                                                 /*父ID*/
  dict_index     BIGINT UNSIGNED,                                                 /*子ID*/
  dict_name      VARCHAR(200),                                           /*名字*/
  dict_value     VARCHAR(100)    NOT NULL,                               /*值*/
  gmt_create     DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  gmt_modified   DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (dict_id)
);

/*用户表：保存用户信息*/
CREATE TABLE user (
  user_id      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,                  /*主键 */
  user_name    CHAR(20)        NOT NULL,
  user_grade   CHAR(4),
  user_qq      CHAR(20),
  gmt_create   DATETIME                 DEFAULT CURRENT_TIMESTAMP,       /*用来表示此行数据的创建时间*  每张表都有这两行，下同/
  gmt_modified DATETIME                 DEFAULT CURRENT_TIMESTAMP,       /*表示此行数据的更改时间*/
  PRIMARY KEY (user_id)
);

/*密码表：保存用户密码*/
CREATE TABLE password (
  password_id      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id          BIGINT UNSIGNED NOT NULL,                             /*外键*/
  password_content CHAR(32)        NOT NULL,
  gmt_create       DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  gmt_modified     DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (password_id)
);

/*书：书的基本信息*/
CREATE TABLE book (
  book_id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_image        BIGINT UNSIGNED,                                    /*此值和 book_id 相等，对于用户上传的图书照片，把它重命名成book_id.png/jpg
                                                                        之后保存到相应的目录下，不往数据库中存*/
  book_name         CHAR(20)        NOT NULL,                           /*图书名称*/
  book_author       CHAR(20)        NOT NULL,                           /*图书作者*/
  user_id           BIGINT UNSIGNED NOT NULL,                           /*外键  图书的拥有者*/
  book_summary      VARCHAR(5000),                                      /*图书介绍*/
  book_status       TINYINT UNSIGNED         DEFAULT 1,                 /*图书状态:  1：正常  2：下线*/
  book_borrow_times INT UNSIGNED,                                       /*图书的借阅次数*/
  gmt_create        DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  gmt_modified      DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id)
);

/*分类表：一本书对应一个分类*/
CREATE TABLE category (
  book_id      BIGINT UNSIGNED NOT NULL,                                 /*外键  分类和图书是多对多的关系*/
  dict_id      BIGINT UNSIGNED NOT NULL,                                 /*外键*/
  gmt_create   DATETIME DEFAULT CURRENT_TIMESTAMP,
  gmt_modified DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id, dict_id)
);

/*评论表：书的评论*/
CREATE TABLE comment (
  comment_id      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_id         BIGINT UNSIGNED NOT NULL,                              /*外键 哪本书*/
  comment_content VARCHAR(5000)   NOT NULL,
  user_id         BIGINT UNSIGNED NOT NULL,                              /*外键 谁评论的*/
  comment_time    DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  gmt_create   DATETIME DEFAULT CURRENT_TIMESTAMP,
  gmt_modified DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (comment_id)
);

/*生命线：表示一次借阅的过程，一本书的多条借阅过程构成这本书的生命线*/
CREATE TABLE lifeline (
  lifeline_id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_id       BIGINT UNSIGNED NOT NULL,                                /*外键*/
  lifeline_from BIGINT UNSIGNED NOT NULL,                                /*外键*/
  lifeline_to   BIGINT UNSIGNED NOT NULL,                                /*外键*/
  lifeline_time DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  gmt_create   DATETIME DEFAULT CURRENT_TIMESTAMP,
  gmt_modified DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (lifeline_id)
);

/*日志表：记录的日志包括 增加图书、借书、添加评论等*/
CREATE TABLE log (
  log_id      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  log_time    DATETIME                 DEFAULT CURRENT_TIMESTAMP,
  log_content VARCHAR(5000)   NOT NULL,
  gmt_create   DATETIME DEFAULT CURRENT_TIMESTAMP,
  gmt_modified DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (log_id)
);

/*下面是所有的外键约束*/
alter table dict add constraint FK_super_child_dict foreign key (dict_parent_id)
      references dict (dict_id) on delete restrict on update restrict;

alter table password add constraint FK_password_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table book add constraint FK_book_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table category add constraint FK_category_book foreign key (book_id)
      references book (book_id) on delete restrict on update restrict;

alter table category add constraint FK_category_dict foreign key (dict_id)
      references dict (dict_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_book foreign key (book_id)
      references book (book_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table lifeline add constraint FK_lifeline_book foreign key (book_id)
      references book (book_id) on delete restrict on update restrict;

alter table lifeline add constraint FK_lifeline_from foreign key (lifeline_from)
      references user (user_id) on delete restrict on update restrict;

alter table lifeline add constraint FK_lifeline_to foreign key (lifeline_to)
      references user (user_id) on delete restrict on update restrict;