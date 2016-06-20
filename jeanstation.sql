

use demo

create database jeanstation
use jeanstation
drop table product

select * from product

create table product(
pid int identity(1,1) Primary key,
pname nvarchar(80),
pcat nvarchar(20) NOT NULL CHECK(pcat IN('Jeans','Tshirts','Trousers','Shirts')),
pdesc nvarchar(400),
price money,
img nvarchar(150),
pstatus nvarchar(20) NOT NULL CHECK(pstatus IN('Available','N/A')),
)

drop table product

select top 1 pid from product order by pid desc 

select*from product
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Numero Uno Denim jeans','Jeans','best jeans in the market',3200,'jeans1.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Newport Blue Slim Fit Jeans','Jeans','best jeans in the market',2500,'jeans2.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Wrangler jeans','Jeans','best jeans in the market',4500,'jeans3.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Newport Blue Slim Jeans','Jeans','best jeans in the market',2700,'jeans4.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('John Player jeans','Jeans','best jeans in the market',3500,'jeans5.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Flying Machine Green Tshirts','Tshirts','best Tshirts in the market',1200,'tshirt1.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Indian Terrain Black Tshirts','Tshirts','best Tshirts in the market',1500,'tshirt2.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Mufti Brown Tshirts','Tshirts','best Tshirts in the market',999,'tshirt3.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Provogue Dual Color Tshirts','Tshirts','best Tshirts in the market',1099,'tshirt4.jpg','Available');

insert into product(pname,pcat,pdesc,price,img,pstatus) values('Peter England Men Formal','Shirts','best Shirts in the market',1799,'shirt1.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Indian Terrain Men Casual','Shirts','best Shirts in the market',1500,'shirt2.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Van Heusen Men Formal','Shirts','best Shirts in the market',1300,'shirt3.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('John Player Black Men Casual','Shirts','best Shirts in the market',1800,'shirt4.jpg','Available');

insert into product(pname,pcat,pdesc,price,img,pstatus) values('John Player Grey Trouser','Trousers','best Trouser in the market',3500,'trouser1.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Levis Casual Trouser','Trousers','best Trouser in the market',2599,'trouser2.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Provogue Yellow Trouser','Trousers','best Trouser in the market',2099,'trouser3.jpg','Available');
insert into product(pname,pcat,pdesc,price,img,pstatus) values('Allen Solly  Casual Trouser','Trousers','best Trouser in the market',3099,'trouser4.jpg','Available');

 
select top 4*from  product where pcat='Jeans' order by pid desc

update product set pname='UCB V-Neck Tshirts' where pid=26

select*from product where pname like '%bei%'

delete from product where pid=18
 
select pname,price,img from product where pid=1

select*from product where pid=1	

select top 5*from  product order by pid desc 

select*from where 

 create table users(
 usrid int identity(1,1),
 username nvarchar(20),
 email nvarchar(40) not null primary key,
 mobile nvarchar(15),
 pswd nvarchar(30),
 )
 


 select*from users
 
 insert into users(username,email,mobile,pswd) values('Naseem Khan','n.skhan1988@gmail.com','9810731504','password')
 
 drop table users

 delete from users where email='info.installhunt@gmail.com'
 
 drop table users
 select email from users

 select*from users where usrid=1



 create table orderdet(
 ordno int identity(450642,3) primary key,
 pid int,
 pname nvarchar(80),
 quantity int,
 price int,
 tprice int,
 psize nvarchar(20),
 saddress nvarchar(200),
 pincode nvarchar(10),
 city nvarchar(20),
 email nvarchar(30),
 usrname nvarchar(20),
 mobile nvarchar(15),
 ordstatus nvarchar(20) NOT NULL CHECK(ordstatus IN('Undelivered','Delivered')),	
 )
 drop table orderdet
 
 select top 1*from orderdet where email='shamshuddeenmohammad@gmail.com' order by ordno desc


 select top 5*from  orderdet  order by ordno desc



 select*from orderdet

 select*from orderdet where ordstatus='Undelivered'


 create table admin(
 usrname nvarchar(20),
 pass nvarchar(30),
 )
 drop table admin

 select*from admin
 insert into admin values('shamshu','domnic@123')


 create table onlineuser(
 id int identity(1,1) not null primary key,
 username nvarchar(30),
 )

 drop table onlineuser
 select*from onlineuser