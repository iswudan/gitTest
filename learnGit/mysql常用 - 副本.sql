1.添加primary key(主键索引)
alter   table  表名   add  primary   key(列名);

2.添加unique(唯一索引)
alter  table  表名  add  unique(列名);

3.添加index(普通索引)
alter  table  表名  add  index  索引名(index_name)  (列名);

4.添加fulltext(全文索引)
alter  table  表名  add  fulltext  (列名);

5.添加多列索引
alter  table  表名  add  index  索引名(index_name)  (列名1，列名2.......);

DROP PRIMARY KEY ON 表名; --：表示删除表中的主键。一个表只有一个主键，主键也是一个索引。
DROP INDEX index_name  ON 表名; --：表示删除名称为 index_name 的索引。
DROP FOREIGN KEY fk_symbol  ON 表名;  --：表示删除外键

-- 增加主键自增索引
ALTER TABLE table_name MODIFY id ing AUTO_INCREMENT PRIMARY KEY;
-- 添加普通索引
ALTER TABLE tb_shop ADD INDEX idx_tb_shop_name (NAME);
-- order by 不走索引
EXPLAIN SELECT * FROM tb_shop t ORDER BY t.name;
-- order by 走强制索引
EXPLAIN SELECT * FROM tb_shop t FORCE INDEX(idx_tb_shop_name) ORDER BY t.name;


SHOW VARIABLES LIKE 'slow_query_log' ; -- 查询慢查询  日志

SHOW VARIABLES LIKE '%version%';
SHOW VARIABLES LIKE 'slow_query_log_file' ; -- D:soft-workmysql-8.0.25sql_log
SET GLOBAL log_queries_not_using_indexes = ON ; -- 开启慢查询
SET  long_query_time = 2 ;  -- 定义多久是慢查询
SET GLOBAL  slow_query_log_file = 'D:soft-work\mysql-8.0.25\sql_log' ;
SHOW VARIABLES LIKE 'slow_query_log_file' ;

SHOW VARIABLES LIKE '%log%' ;
SHOW VARIABLES LIKE 'long_query_time';



DROP PROCEDURE test123;

DELIMITER $$
CREATE PROCEDURE test123()
BEGIN
	DECLARE i INT;
	SET i = 0 ;
	WHILE i<10000 DO 
	INSERT INTO test01.`stu` VALUES(i,'test'); 
	SET i = i+1 ;
	END WHILE ;
END$$
DELIMITER ;

//  # 结束定义语句
CALL test123();    # 调用存储过程
SELECT * FROM stu t ;
SELECT * FROM stu t WHERE t.id = 1;
INSERT INTO test01.`stu` VALUES(1,'test'); 

DELETE FROM stu t ;

rank()是跳跃排序，有两个第一名时接下来就是第三名，
dense_rank()是连续排序，有两个第一名时仍然跟着第二名







