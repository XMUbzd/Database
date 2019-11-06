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

2. 查询平均成绩大于60分的同学的学号和平均成绩；
```sql
-- 查询结果为学号和平均成绩
SELECT sid,AVG(score) AS AC 
FROM SC
GROUP BY sid 
HAVING score > 60;
-- 问题
-- 1. groupy by 和 order by 的区别
-- 1.1 GROUP BY 与聚集函数一起使用
-- 2. HAVING 和 WHERE 的区别
-- 2.1 过滤分组使用的是HAVING
-- 知识点
-- 1.聚集函数
-- 1.1 SUM(),AVG(),COUNT(),MAX(),MIN()
-- 2.分组数据
-- 2.1 goupy by 分组计算字段
-- 2.2 HAVING 过滤分组数据
```
3. 查询所有同学的学号、姓名、选课数、总成绩
```sql
-- 分析
-- sid,sname,count(sid),SUM(score) goupy by 
-- 汇总数据，分组数据
-- 联结表
-- 
SELECT Student.sid AS sd,sname,COUNT(Student.sid) AS cc, SUM(score) AS sc
FROM Student,SC
WHERE Student.sid = SC.sid
group by sd;
-- 出现问题
-- Column 'sid' in field list is ambiguous
-- 解决：查询中的sid 不知道指的是哪一个 应该加具体表的名称
-- 他人的答案
SELECT Student.sid,Student.sname,COUNT(DISTINCT cid),SUM(DISTINCT score)
FROM Student LEFT JOIN SC
ON Student.sid = SC.sid
GROUP BY Student.sid,Student.sid
-- 分析
-- 他使用了LEFT JOIN ON
-- 问题
-- 为什么使用DISTINCT
-- 我的方法 默认用户每条记录都是独立的课程，看sid 出现几次就是相当于选了几次课
-- 道理来说这个地方应该用 DISTINCT cid
```