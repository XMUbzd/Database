# My Answer for sql50

1. 查询“01”课程比“02”课程成绩高的所有学生的学号
```sql
-- 思路：子查询 
SELECT s1.sid from 
(SELECT sid,score from SC where cid=01) AS s1,
(SELECT sid,score from SC where cid=02) AS s2
where s1.score > s2.score and s1.sid=s2.sid;
-- 做题卡住点
-- 1. Column 'sid' in field list is ambiguous
-- 没有解决查询sid的具体所指
-- 2. s2后不能再加,
-- 3. 连结表的使用
-- 4. 查询语句(同时查询多个表，不能出现所查询的字段同时出现在多个表中?)
-- 5. 外部链接 LEFT OUTTER JOIN
SELECT 
```
- 参考
    - [图解SQL中各种JOIN(知乎)]