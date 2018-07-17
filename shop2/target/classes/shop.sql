create table shopmember(
	 userid varchar2(20) primary key
	,password varchar(20) not null
	,username varchar(20) not null
	,address varchar(100)
	,phone varchar(50)
);

select * from shopmember;

create table book(
	 bookcode number primary key
	,title varchar(50) not null
	,price number default 0
	,quantity number default 0
);

create sequence bookseq;

create table sale(
	 userid varchar2(20) not null, constraint userid_fk foreign key(userid) references shopmember(userid)
	,bookcode number not null, constraint bookcode_fk foreign key(bookcode) references book(bookcode)
	,purchasecnt number default 0
	,purchasedate date default sysdate
);

create table wishlist(
	 userid varchar2(20) not null, constraint userid_fk_wh foreign key(userid) references shopmember(userid)
	,bookcode number not null, constraint bookcode_fk_wh foreign key(bookcode) references book(bookcode)
);

insert into BOOK(bookcode, title, price, quantity) values(bookseq.nextval, 'java 1.9 따라하기', 10000, 10);
insert into BOOK(bookcode, title, price, quantity) values(bookseq.nextval, 'C로 배우는 자료구조', 12000, 10);
insert into BOOK(bookcode, title, price, quantity) values(bookseq.nextval, 'HTML5_CSS3', 9000, 10);
insert into BOOK(bookcode, title, price, quantity) values(bookseq.nextval, '자바 디자인 패턴', 15000, 10);
insert into BOOK(bookcode, title, price, quantity) values(bookseq.nextval, '안드로이드 프로그래밍', 20000, 10);

select * from book;

select bookcode, max(sum(purchasecnt)) from group by bookcode

select bookcode, title, price from book where bookcode=(select bookcode from sale where sum(purchasecnt)=(select max(sum(purchasecnt)) from sale group by bookcode)
group by bookcode)

select bookcode, title
from
  ( select b.bookcode, b.title, b.price, b.quantity, s.purchasecnt 
from book b, sale s
where b.bookcode=s.bookcode
group by b.bookcode
)
where rownum=1
order by purchasecnt desc

select * from wishlist;

insert into wishlist(	
			userid
			,bookcode
		)
		values(
			'1111'
			,'1'
		);	
		
