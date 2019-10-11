# sql 经典50题
# 原地址
- [SQLTest/sql.md](https://github.com/shenlujie/SQLTest/blob/master/sql.md)

## 建表

```sql
create table Student(sid varchar(10),sname varchar(10),sage datetime,ssex nvarchar(10));
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('08' , '王菊' , '1990-01-20' , '女');
create table Course(cid varchar(10),cname varchar(10),tid varchar(10));
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');
create table Teacher(tid varchar(10),tname varchar(10));
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');
create table SC(sid varchar(10),cid varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);
```

## 表结构：

- 学生表 Student

SId 学生编号 Sname 学生姓名 Sage 出生年月 Ssex 学生性别

- 课程表 Course

CId 课程编号 Cname 课程名称 TId 教师编号

- 教师表 Teacher

TId 教师编号 Tname 教师姓名

- 成绩表 SC

SId 学生编号 CId 课程编号 score 分数


## Mysql Docker 使用
```shell
docker pull mysql:5.6
docker run --name mysqldb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
docker exec -it mysqldb bash
# 传本地文件到docker
docker cp create.sql 8c06:/   # 8c06 换成对应的container的ID
mysql -uroot -p
CREATE DATABASE sql50;
show DATABASES;
use sql50;
source /create.sql
show tables;
# docker stop xxx  xxx 为container的编号
# docker 重启
docker restart xxx
```