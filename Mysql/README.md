# Mysql的一点学习总结

- 来自于SQL必知必会（第四版）针对Mysql略有不同、网上乱七八糟 

##  mysql数据库
- 安装完mysql之后使用的命令，在cmd中 mysql -uroot -p 回车后输入密码，进入数据库。
- 首先要新建数据库，通过show databases;来查看已拥有的数据库。新建一个名字不同的数据库 CREATE DATABASE name;
- 然后使用我们新建的数据库，use name。列出数据库中有的所有表，show tables;查看表的结构DESC 表名;
- 接着是对于表的操作，如新建CREATE TABLE 表名；删除DROP TABLE 表名
修改ALTER TABLE 表名(命令有ADD/DROP/CHANGE COLUMN 列名)
- 对于已有的数据导入，首先新建数据库，再use该数据库，利用source 到文件存放位置（无需分号结尾，否则会报错），完成数据的导入。
- 插入或替换 REPLACE INTO 语句（无则插入，有则替换，带主键）
- 插入或更新 INSERT INTO 表（列） VALUES（值） ON DUPLICATE KEY(有则更新，无则插入)
- 插入或忽略 INSERT INTO 表（列） VALUES（值） （无则插入，有则忽略）
- 将某个表另存的操作（快照） CREATE TABLE 名1 SELECT * FROM 名2;
- - tip:关于数据库中文出现乱码解决，show variables like '%char%';再set character_set_database=utf8;
## 常用命令
- 检索表SELECT */列名（以,分开） FROM 表名 WHERE 列名＋条件（对行进行过滤）GROUP BY 列名（一般是一列然后是聚集函数，当然聚集函数不用写在group by之后） HAVING 列名+条件 （也是过滤，可对分组进行过滤搭配group by使用) LIMIT x OFFSET y (取x个跳y个) ORDER BY 列名（用于排序）
- - SELECT DISTINCT 列名 则为不重复的检索，对所有列都生效。
- - ORDER BY可指定多个，先按第一个排再按下一个以此类推；（后面跟数字的为检索出的列中的相对位置，从1（第一个)开始。）；每个排序列名后可指定DESC进行降序排列，默认升序，每个列都必须指定。
- - LIMIT另外写法如LIMIT 1,3 相当于LIMIT 3 OFFSET 1。
- - WHERE的条件可以是简单的条件如xxx > 5 也可以是范围值检查利用BETWEEN x AND y 检查空值利用 xxx IS NULL 以及复杂的过滤采用AND（与）和OR（或）多个结合进行高级过滤。注意AND优先级高于OR 故复杂过滤结果不符合预期时可以采用()来得到想要的优先级计算。
- - WHERE中还有 IN()操作符，用于判断条件是否在（）中，相当于多个OR。NOT（非）操作符，即条件取反，可与 IN 联用。
- - 利用通配符进行过滤（文本) WHERE xxx LIKE '%yyy%' 其中的%为通配符代替任意多个字符即筛选上述为xxx列中间文字为yyy的行。WHERE xxx LIKE '_____' _通配符为任意的一个字符所以该语句为筛选五个字符的条件。WHERE xxx LIKE '[abc]%' [ ]通配符为匹配带有'a','b','c'开头的字符串。
- - 计算字段，一般在SELECT中创建SELECT x+y AS z ,z不是真实在表内的字段而是临时创建的;拼接字段CONCAT(string1,string2,...);去除空格TRIM（）;UPPER,LOWER等文本处理函数；ABS，COS，SQRT等数值处理函数（具体参考函数表：https://my.oschina.net/c3gen/blog/802184。）
- - 聚集函数：通过聚集函数来对列进行汇总，AVG，SUM，COUNT，MAX，MIN。
例子：SELECT MAX(id) FROM 表名(where,group等均可加入)；
- - 子查询：采用嵌套方式，嵌套的一层（内层）只能检索一列。
- - 完全限定列名，即列名写法为 表名.列名 的方式。