use booksystem;
/*bookSystem 的初始化 */
/*初始化所有的分类，但是分类后续还可以添加，继续完善 */
/*整体上是一个树形的结构 */
/*  如图                       根
                 ------------------------
                |                       |
             图书分类        ...        待添加
                |
      -------------------------
    |          |        |     |
  编程语言   数据结构   算法    软件工程 ...
*/

insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('1',       '1'       ,      '1'     ,         '根',         '0');

insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('2',       '1'       ,      '1'     ,         '图书分类',         '0');

insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('3',       '2'       ,      '1'     ,         '编程语言',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('4',       '2'       ,      '2'     ,         '数据结构',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('5',       '2'       ,      '3'     ,         '算法',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('6',       '2'       ,      '4'     ,         '软件工程',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('7',       '2'       ,      '5'     ,         '操作系统',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('8',       '2'       ,      '6'     ,         '数据库',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('9',       '2'       ,      '7'     ,         '计算机网络',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('10',       '2'       ,      '8'     ,        '计算机安全',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('11',       '2'       ,      '9'     ,        '计算机图形',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('12',      '2'       ,      '10'     ,        'GUN/Linux',         '0');

insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('13',      '3'       ,      '1'     ,         'C',                 '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('14',      '3'       ,      '2'     ,         'C++',               '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('15',      '3'       ,      '3'     ,         'Java',              '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('16',      '3'       ,      '4'     ,         'Python',             '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('17',       '6'       ,      '1'     ,        '设计模式',            '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('18',       '6'       ,      '2'     ,        'UML',                '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('19',       '7'       ,      '1'     ,         'Linux',             '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('20',       '7'       ,      '2'     ,         'LinuxKernel',        '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('21',       '7'       ,      '3'     ,         'Windows',            '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('22',       '8'       ,      '1'     ,         '数据库设计',          '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('23',       '8'       ,      '2'     ,         'SQL',                '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('24',       '8'       ,      '3'     ,         'NoSQL',              '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('25',       '9'       ,      '1'     ,         '网络配置',            '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('26',       '9'       ,      '2'     ,         'TCP',                '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('27',       '9'       ,      '3'     ,         'IP',                 '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('28',       '10'       ,      '1'     ,         '数据安全',           '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('29',       '10'       ,      '2'     ,         'Web安全',           '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('30',       '10'       ,      '3'     ,         '加密解密',          '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('31',       '11'       ,      '1'     ,         '图形学基础',         '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('32',       '11'       ,      '2'     ,         'OpenGL',           '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('33',       '12'       ,      '1'     ,         '开源文化',          '0');


insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('34',       '23'       ,      '1'     ,          'MySQL' ,        '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('35',       '24'       ,      '1'     ,          'Redis' ,        '0');
insert dict(dict_id, dict_parent_id, dict_index, dict_name, dict_value) values('36',       '24'       ,      '2'     ,          'Memcached' ,     '0');


/*user 初始化 添加两个用户*/
insert user(user_id, user_name, user_grade, user_mail) values('1','杨博东','2014','ybd@xiyoulinux.org');
insert user(user_id, user_name, user_grade, user_mail) values('2','小明','2014','xiaoming@xiyoulinux.org');

/*password 初始化 */
insert password(password_id, user_id, password_content) values('1','1',"123");
insert password(password_id, user_id, password_content) values('2','2',"123");


/*book 初始化 添加一本 c++ primer*/
insert book(book_id, book_image, book_name, book_author, user_id, book_summary, book_status, book_borrow_times)
    values('1','1.jpeg','C++ Primer','Stanley Lippman','1','久负盛名的C++经典教程','1','12');

/*category 初始化 c++ Primer属于两个类别 一个是编程语言 一个是C++ */
insert category(book_id, dict_id) values('1','3');
insert category(book_id, dict_id) values('1','14');

/*comment 初始化一条对c++ primer的评论*/
insert comment(comment_id, book_id, comment_content, user_id) values('1','1','这本书讲的十分详细，建议第一次阅读时候不要太细，需要多读几遍','1');

/*lifeline 初始化一条借书记录*/
insert lifeline(lifeline_id, book_id, lifeline_from, lifeline_to) values('1','1','1','2');

/*log 初始化两条借书log*/
insert log(log_content) values('杨博东添加了图书《C++ Primer》');
insert log(log_content) values('小明向杨博东借了图书《C++ Primer》');
