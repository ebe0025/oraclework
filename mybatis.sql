----------------------------------------------------------------
---------------------- MEMBER TABLE --------------------------
----------------------------------------------------------------
create table member (
     user_id varchar2(30) primary key,
     user_pwd varchar2(100) not null,
     user_name varchar2(15) not null,
     email varchar2(100),
     birthday char(6),
     gender char(1) check (gender in('M', 'F')),
     phone char(13),
     address varchar2(100),
     enroll_date date default sysdate,
     modify_date date default sysdate,
     status char(1) default 'Y' check(status in('Y', 'N'))
);

insert into  member
values ('admin', '1234', '������', 'admin@google.com', '800918', 'F', '010-1111-2222','�����  ��õ�� ���������2��', '20240711', default, default);

insert into  member
values ('user01', '1234', 'ȫ�浿', 'user01@google.com', '900213', 'M','010-3333-4444','����� ��õ�� ��','20240728',default, default);

----------------------------------------------------------------
------------------------ board TABLE ---------------------------
----------------------------------------------------------------
create table board(
      board_no number primary key,
      board_title varchar2(100) not null,
      board_content varchar2(4000) not null,
      board_writer varchar2(30),
      count number default 0,
      create_date date default sysdate,
      status char(1) default 'Y' check(status in('Y', 'N')),
      foreign key (board_writer) references member
);

create sequence seq_bno nocache;

insert into  board
values(seq_bno.nextval, 'ù��° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ù �Խ����Դϴ�.','admin', default, '20240711', default);

insert into  board
values(seq_bno.nextval, '�ι�° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 2 �Խ����Դϴ�.','user01', default, '20240715', default);

insert into  board
values(seq_bno.nextval, '���� ���긮�� �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 3 �Խ����Դϴ�','user01',default, '20240719', default);

insert into  board
values(seq_bno.nextval, '�ȳ�.. ���̹�Ƽ���� ó������?', '�ȳ��ϼ���. ù �Խ����Դϴ�.', 'user01',default, '20240720', default);

insert into  board
values(seq_bno.nextval, '�ȳ�. ����1', '�ȳ� ����1', 'admin', default, '20240723', default);

insert into  board
values(seq_bno.nextval, '����¡ ó�������� ���õ����� ���� �־���´�...', '�ȳ��Ͻʴϱ�', 'admin',default,  '20240724', default);

insert into  board
values(seq_bno.nextval,'����2' ,'����2', 'admin', default, '20240725',default);

insert into  board
values(seq_bno.nextval,'����3' ,'����3' , 'admin', default, '20240726', default);

insert into  board
values(seq_bno.nextval,'����4' ,'����4', 'user01', default, '20240727', default);

insert into  board
values(seq_bno.nextval, '����5' ,'����5', 'admin', default, '20240728', default);

insert into  board
values(seq_bno.nextval,'����6' ,'����6', 'user01', default, '20240729', default);

insert into  board
values(seq_bno.nextval, '����7' ,'����7', 'admin', default, '20240401', default);

insert into  board
values(seq_bno.nextval, '������ �Խ��� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ������ �Խ����Դϴ�.', 'admin',  default, '20240403', default);

----------------------------------------------------------------
------------------------ reply TABLE ---------------------------
----------------------------------------------------------------
create table reply(
    reply_no number primary key,
    reply_content varchar2(400),
    ref_bno number,
    reply_writer varchar2(30),
    create_date date default sysdate,
    status char(1) default 'Y' check(status in('Y', 'N')),
    foreign key (ref_bno) references board,
    foreign key (reply_writer) references member
);

create sequence seq_rno nocache;

insert into  reply
values(seq_rno.nextval,'ù��° ����Դϴ�', 1, 'user01', '20240725', default);

insert into  reply
values(seq_rno.nextval, 'ù��° ����Դϴ�', 13, 'user01', '20240412', default);

insert into  reply
values(seq_rno.nextval, '�ι�° ����Դϴ�', 13, 'user01', '20240413', default);

insert into  reply
values(seq_rno.nextval, '������ ����Դϴ�', 13, 'user01', '20240414', default);
commit;