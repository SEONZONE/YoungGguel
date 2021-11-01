
--Movie ���̺� ������ ���� ������
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1000,'��¡�� ����','iamge1',TO_DATE('2021-09-17','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1001,'���̽�','iamge2',TO_DATE('2021-09-15','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1002,'��ġ�� �� ������ ����','iamge3',TO_DATE('2021-09-01','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1003,'����','iamge4',TO_DATE('2021-09-15','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1004,'�𰡵�','iamge5',TO_DATE('2021-07-28','YYYY-MM-DD'));



--��ȭ, �⿬�� ���̺� ����

-- ��ȭ,�⿬��
CREATE TABLE "ACTOR_LIST" (
	"ACTOR_LIST_NO" NUMBER(38) NOT NULL, -- ��ȭ,�⿬�� ��ȣ
	"ACTOR_NO"      NUMBER(10) NULL,     -- ����ȣ
	"MOVIE_NO"      NUMBER(38) NULL      -- ��ȭ��ȣ
);

-- ��ȭ,�⿬��
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "PK_ACTOR_LIST" -- ��ȭ,�⿬�� �⺻Ű
		PRIMARY KEY (
			"ACTOR_LIST_NO" -- ��ȭ,�⿬�� ��ȣ
		);

-- �⿬��
CREATE TABLE "ACTOR" (
	"ACTOR_NO"   NUMBER(10)    NOT NULL, -- ����ȣ
	"ACTOR_NAME" VARCHAR2(255) NULL      -- ����̸�
);

-- �⿬��
ALTER TABLE "ACTOR"
	ADD
		CONSTRAINT "PK_ACTOR" -- �⿬�� �⺻Ű
		PRIMARY KEY (
			"ACTOR_NO" -- ����ȣ
		);
        
-- ��ȭ,�⿬��
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "FK_ACTOR_TO_ACTOR_LIST" -- �⿬�� -> ��ȭ,�⿬��
		FOREIGN KEY (
			"ACTOR_NO" -- ����ȣ
		)
		REFERENCES "ACTOR" ( -- �⿬��
			"ACTOR_NO" -- ����ȣ
		);

-- ��ȭ,�⿬��
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "FK_MOVIE_DETAIL_TO_ACTOR_LIST" -- ��ȭ������ -> ��ȭ,�⿬��
		FOREIGN KEY (
			"MOVIE_NO" -- ��ȭ��ȣ
		)
		REFERENCES "MOVIE_DETAIL" ( -- ��ȭ������
			"MOVIE_NO" -- ��ȭ��ȣ
		);

        
desc actor_list;
-- ��ȭ��� ���̺� ������ ���� 
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10000,'���ؼ�');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10001,'������');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10002,'������');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10003,'�蹫��');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10004,'�ù�����');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10005,'������');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10006,'������');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10007,'�̼���');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10008,'������');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10009,'���μ�');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10010,'����ȯ');

/* 
������ MOVIE_ DETAIL���� DETAIL_ACTOR ����
������ ��ȭ �����Ͽ� ��ȭ��� �÷��� ������ �����͸� ���� �� �� ����.
*/
ALTER TABLE MOVIE_DETAIL DROP COLUMN DEATIL_ACTOR;




-- ��ȭ ������ ������ ���� 

INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1000,'��¡¡','Ȳ����',90,'456�� ���� ����� �ɸ� �ǹ��� �����̹��� ������ ������� ������ ���ڰ� �Ǳ� ���� ����� �ɰ� ������ ���ӿ� �����ϴ� �̾߱⸦ ���� ���ø��� �ø���',TO_DATE('2022-07-28','YYYY-MM-DD'));
INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1001,'���̽��ǽ� ������˾׼�','�輱',109,'�� �� ���� ��ȭ!
�ɷ����� ���� �ɷ������!
�λ� �Ǽ����� �������� ���� �ɷ��� ��ȭ �� ��.
 ���̽��ǽ� ��ȭ�� ���� ���� ��������� ����Ʈ �ߵ��ݱ���,
 ���� ���忡���� ������ ������� ��� ���� ���� �Ұ� �ȴ�.
 
 �����۾������� �������� ����(������)�� ������ ������� �� 30���� ��ã�� ����
 ���̽��ǽ� ������ �����ϱ� �����Ѵ�.
 
 ��ħ�� �߱��� ��ġ�� ������ �ݼ��� ���Կ� ������ ����,
 ��������Ȯ��, ��ȹ�� �뺻�԰�, ����å ����, ȯ���� �۾�, ��Ը� �ݼ��ͱ���!
 ü�������� ����ȭ�� ���̽��ǽ��� �����Ͽ� ����,
 �װ����� �����ڵ��� ����� ������ �İ��� ��Ҹ��� ���ΰ����� ��ȹ�� ��å ������(�蹫��)�� ���� �����Ѵ�.
 
 �׸��� �װ� 300�� �Ը��� ���ο� �ѷ����� ��ȹ�ϴ� ���� �˰� �Ǵµ�..
 
 ����̻����� ġ���ϰ� ����ȭ�� ���̽��ǽ��� ��ü!
 ������ �Ѿ� �ݵ�� ��ã�´�!',TO_DATE('2021-10-28','YYYY-MM-DD'));


INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1002,'Shang-Chi and the Legend of the Ten Rings','����ƾũ��ư',132,'�� ���� �� �����ϴ� ��, ������ �����Ѵ�!
�������� �ɷ��� ���� �� ���� �� ������ ������ ���� ����� ������ ������ �� ����
 ��ġ�� �ƹ��� ���� �ؿ��� �ϻ��ڷ� �Ʒ��� �޾����� �̸� �ź��ϰ� ����� ���� �����Ѵ�.
 �׷��� ��ġ�� ����� �븮�� �ڵ��� �������� �� �̻� ����� ���� �� ���ٴ� ���� �����ϰ�,
 ��Ӵϰ� ���� ������ ��а� ������ �ź��� ���� �ϱ���� �ȴ�
 ����� ���� ��������, �� �������� �η��� �ƹ��� ���츦 �����ؾ� �ϴ� ��ġ
 ���� �� ���ΰ�? ������ �� ���ΰ�?
 ������ ���ο� �ô�,
 ���� ���� ���� ź���Ѵ�!',TO_DATE('2021-10-01','YYYY-MM-DD'));

--������ ũ�� ����
alter table movie_detail modify(DEATIL_DIRECTOR VARCHAR2(255));

INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1003,'������ ����','������',117,'���� �� �ִ� ���� ������ۿ� ������
 ���� �������� ���� ����.
 ���úη� û�ʹ뿡 �� 54��° ������ ���� ���ذ桯(������)�� ��ǥ�� �� �ϳ�!
 �ٷ� ������ �������� ����� ���̴�.
 
 �������� ����ٴ� ��Ģ���� ����� �ƹ��� ��������(�̼���)�� �ݴ뿡��
 ���� �����桯(�̼���)�� ������ ���� �� �����ϸ� �պ� 5�ð� ���б��� ������ ���ذ桯.
 ���� ������ �� ������� �ܹ��� �˾ƺ� ��Ī ���� ������(������)�� �Բ�
 ����� �ִ� �������⸦ ���� ����� ����,
 ������ ��� ���� �������� �׽�Ʈ,
 ����ɹ� ���а�ô�ȸ ���ñ���!
 ������ �������� ���� ���� ���ذ桯���� ����� ��ӵǴµ�...!
 
 ����� ����
 ������ ���� �׳�����!',TO_DATE('2021-10-15','YYYY-MM-DD'));


INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1004,'�ʻ��� Ż�� �츮�� �ݵ�� ���ư���','���¿�',121,'�������� ���� ���� ����, �𰡵�
 ���ݺ��� �츮�� ��ǥ�� ������ �����̴�!
 
 ���ѹα��� UN������ ���� ���м����ϴ� �ñ�
 1991�� �Ҹ������� ���� �𰡵𽴿����� ��������� ������ �Ͼ��.
 ��Ÿ��� ���� �� ���� ���� ���ѹα� ������ ������ ��������
 �Ѿ˰� ��ź�� ����ġ�� ���, ��Ƴ��� ���� �Ϸ��Ϸ縦 ���߳���.
 �׷��� ��� �� ��, ���� ������ ������� ������ ��û�ϸ� ���� �ε帮�µ���
 
 ��ǥ�� �ϳ�, �𰡵𽴿��� Ż���ؾ� �Ѵ�!',TO_DATE('2021-09-28','YYYY-MM-DD'));


--��ȭ,�⿬�� ���̺� ����

/* 10000	���ؼ�
10001	������
10002	������
10003	�蹫��
10004	�ù�����
10005	������
10006	������
10007	�̼���
10008	������
10009	���μ�
10010	����ȯ*/
desc actor_list;
select* from movie;
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (1,10000,1000);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (2,10001,1000);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (3,10002,1001);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (4,10003,1001);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (5,10004,1002);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (6,10005,1002);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (7,10006,1003);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (8,10007,1003);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (9,10008,1004);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (10,10009,1004);
INSERT INTO ACTOR_LIST (actor_list_no,actor_no,movie_no) VALUES (11,10010,1004);


select m.movie_no, m.movie_title, m.movie_poster,d.DEATIL_SUBTITLE,d.DEATIL_DIRECTOR,d.DEATIL_RT,d.DEATIL_CONTENT,m.MOVIE_REALEASE,d.DEATIL_END 
from
movie m, movie_detail d
where m.movie_no = d.movie_no;

desc actor_list;
select m.movie_no, m.movie_title, m.movie_poster, a.actor_name
from
movie m,actor a,actor_list al
where m.movie_no = al.movie_no and al.actor_no = a.actor_no;





-- ���� ������ �߰� 
INSERT INTO THEATER (THEATER_NO,THEATER_NAME,THEATER_LOC,THEATER_ROOM,LO_NO,TH_SEAT) VALUES (1000,'�ѵ�������','����','1��','1',50);

--��ȭ�ð�ǥ �߰� 
--���۽ð�, ����ð� �� NUMBERŸ�Կ��� VARCHAR2 Ÿ������ ���� 
alter table TIMETABLE modify(TIME_START VARCHAR2(30));
alter table TIMETABLE modify(TIME_END VARCHAR2(30));


INSERT INTO TIMETABLE (TIME_NO,THEATER_NO,MOVIE_NO,TIME_DATE,TIME_START,TIME_END) VALUES ('TIME001',1000,1001,sysdate,'10:00','11:49');

--�¼� ������ �߰� 
-- �¼� ���ſ��� Ÿ�� VARCHAR2���� BOOLEAN���� ����
-- ������ BOOLEAN�� ����Ŭ���� �ȵǹǷ� üũ ���������� �ο��Ͽ� T �Ǵ� F �� �Է��Ҽ� �ְ� �����صд�.
alter table SEAT modify(SE_STATE  VARCHAR2(1));
ALTER TABLE SEAT ADD CONSTRAINT  SE_STATE_CHECK CHECK(SE_STATE = 'F' or SE_STATE = 'T');

desc seat;
--�¼������� �Է� ����

--ȸ������ ������ �Է�
insert into user_info (USER_ID,USER_PW,USER_NAME,USER_ADDR,USER_TEL,USER_GENRE,USER_BIRTH,USER_EMAIL)
VALUES ('seonzone','ssang1','�ڼ���','����','01085083581','����',TO_DATE('1996-09-30','YYYY-MM-DD'),'tjdwhd2247@gmail.com');

--�������̺� �Է�

INSERT INTO PAYMENT (PAYMENT_NO, METHOD_NO,PAYMENT_CHOOSE,PAYMENT_TIME,PAYMENT_TOTAL) VALUES (1000,1,0,sysdate,14000);

--�������̺� �Է�
-- ������� ���ο� üũ�ɼ��� �־� T �ƴϸ� F�� �����ϰ� ���ش�.
ALTER TABLE BOOKING ADD CONSTRAINT BK_USECOUPON_CHECK CHECK(BK_USECOUPON = 'F' or BK_USECOUPON = 'T');
INSERT INTO BOOKING (BOOKING_NO,PAYMENT_NO,MOVIE_NO,THEATER_NO,USER_ID,BK_ADULT,BK_USECOUPON,BK_DATE) VALUES(1000,1000,1001,1000,'seonzone','1','F',sysdate);

