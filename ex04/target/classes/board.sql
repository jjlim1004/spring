select * from board;

create sequence seq_board;

create table tbl_board(
	bno number(10,0),
	title varchar2(200) not null,
	content varchar2(2000) not null,
	writer varchar2(50) not null,
	regdate date default sysdate,
	updatedate date default sysdate
);

--�ۼ��� pk ����
alter table tbl_board add constraint pk_board primary key(bno);

----------------------------------���뼱----------------------------------------------

-- ��� ���̺�
create table tbl_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updateDate date default sysdate
);
--��� ������
create sequence seq_reply;
--��� pk
alter table tbl_reply add constraint pk_reply primary key(rno);

--����� bno�� �ۼ����� bno�� fk�� ����
alter table tbl_reply add constraint fk_reply_board 
foreign key(bno) references tbl_board(bno);

----- ��� ��� Ȯ��
select * from tbl_reply order by rno desc;
-------------------------------- replycnt Į�� tbl_board�� �߰�
alter table tbl_board add(replycnt number default 0);
--------------------------------------- replycnt �� ���� �߰�
update tbl_board set replycnt = 
(select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);
----------------------------------------------------------------------

insert into tbl_board(bno,title,content,writer) values(seq_board.nextval,'����','����','user00');
--mapper �� paging�� ���� ������ �߰�
insert into tbl_board(bno,title,content,writer) (select seq_board.nextval,title,content,writer from tbl_board);
commit

select * from tbl_board;
select count(*) from tbl_board;



select * from tbl_board where bno > 0;


---���� ���̺� �ΰ�-------------------------------------------
create table tbl_sample1(
	col1 varchar2(500)
);

create table tbl_sample2(
	col2 varchar2(50)
);
--���� ���̺� �ΰ� ����------------------------------
drop table tbl_sample1;
drop table tbl_sample2;
-------------------���� ���̺� �� ����----------------
delete from tbl_sample1;
delete from tbl_sample2;
-------------------���� ��ȸ----------------------------
select * from tbl_sample1;
select * from tbl_sample2;



