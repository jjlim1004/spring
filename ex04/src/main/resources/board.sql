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

--작성글 pk 지정
alter table tbl_board add constraint pk_board primary key(bno);

----------------------------------절취선----------------------------------------------

-- 댓글 테이블
create table tbl_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updateDate date default sysdate
);
--댓글 시퀸스
create sequence seq_reply;
--댓글 pk
alter table tbl_reply add constraint pk_reply primary key(rno);

--댓글의 bno를 작성글의 bno의 fk로 설정
alter table tbl_reply add constraint fk_reply_board 
foreign key(bno) references tbl_board(bno);

----- 댓글 목록 확인
select * from tbl_reply order by rno desc;
-------------------------------- replycnt 칼럼 tbl_board에 추가
alter table tbl_board add(replycnt number default 0);
--------------------------------------- replycnt 값 새로 추가
update tbl_board set replycnt = 
(select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);
----------------------------------------------------------------------

insert into tbl_board(bno,title,content,writer) values(seq_board.nextval,'제목','내용','user00');
--mapper 의 paging을 위한 데이터 추가
insert into tbl_board(bno,title,content,writer) (select seq_board.nextval,title,content,writer from tbl_board);
commit

select * from tbl_board;
select count(*) from tbl_board;



select * from tbl_board where bno > 0;


---샘플 테이블 두개-------------------------------------------
create table tbl_sample1(
	col1 varchar2(500)
);

create table tbl_sample2(
	col2 varchar2(50)
);
--샘플 테이블 두개 삭제------------------------------
drop table tbl_sample1;
drop table tbl_sample2;
-------------------샘플 테이블 값 삭제----------------
delete from tbl_sample1;
delete from tbl_sample2;
-------------------샘플 조회----------------------------
select * from tbl_sample1;
select * from tbl_sample2;



