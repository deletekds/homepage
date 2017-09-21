CREATE table member1 (
id varchar(10) not null,
passwd varchar(20) not null,
mname varchar(20) not null,
tel varchar(20)  null,
email varchar(50) not null unique,
zipcode varchar(7)  null,
address1 varchar(150)  null,
address2 varchar(50)  null,
fname varchar(50) default 'main.png',
primary key(id)

);

 

 





