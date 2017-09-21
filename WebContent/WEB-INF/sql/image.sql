create table image1(
imageno number not null,
name varchar(30) not null,
title varchar(50) not null,
content varchar(30) not null,
passwd varchar(30) not null,
mdate date not null,
fname varchar(30) default 'main.png',
grpno number(10) default 0,
ansnum number(10) default 0,
refnum number(10) default 0,
indent number(10) default 0,
primary key(imageno)


);


