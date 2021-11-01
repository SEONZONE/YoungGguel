
--Movie 테이블 데이터 삽입 쿼리문
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1000,'오징어 게임','iamge1',TO_DATE('2021-09-17','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1001,'보이스','iamge2',TO_DATE('2021-09-15','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1002,'샹치와 텐 링즈의 전설','iamge3',TO_DATE('2021-09-01','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1003,'기적','iamge4',TO_DATE('2021-09-15','YYYY-MM-DD'));
INSERT INTO MOVIE (MOVIE_NO,MOVIE_TITLE,MOVIE_POSTER,MOVIE_REALEASE) VALUES(1004,'모가디슈','iamge5',TO_DATE('2021-07-28','YYYY-MM-DD'));



--영화, 출연진 테이블 생성

-- 영화,출연진
CREATE TABLE "ACTOR_LIST" (
	"ACTOR_LIST_NO" NUMBER(38) NOT NULL, -- 영화,출연진 번호
	"ACTOR_NO"      NUMBER(10) NULL,     -- 배우번호
	"MOVIE_NO"      NUMBER(38) NULL      -- 영화번호
);

-- 영화,출연진
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "PK_ACTOR_LIST" -- 영화,출연진 기본키
		PRIMARY KEY (
			"ACTOR_LIST_NO" -- 영화,출연진 번호
		);

-- 출연진
CREATE TABLE "ACTOR" (
	"ACTOR_NO"   NUMBER(10)    NOT NULL, -- 배우번호
	"ACTOR_NAME" VARCHAR2(255) NULL      -- 배우이름
);

-- 출연진
ALTER TABLE "ACTOR"
	ADD
		CONSTRAINT "PK_ACTOR" -- 출연진 기본키
		PRIMARY KEY (
			"ACTOR_NO" -- 배우번호
		);
        
-- 영화,출연진
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "FK_ACTOR_TO_ACTOR_LIST" -- 출연진 -> 영화,출연진
		FOREIGN KEY (
			"ACTOR_NO" -- 배우번호
		)
		REFERENCES "ACTOR" ( -- 출연진
			"ACTOR_NO" -- 배우번호
		);

-- 영화,출연진
ALTER TABLE "ACTOR_LIST"
	ADD
		CONSTRAINT "FK_MOVIE_DETAIL_TO_ACTOR_LIST" -- 영화디테일 -> 영화,출연진
		FOREIGN KEY (
			"MOVIE_NO" -- 영화번호
		)
		REFERENCES "MOVIE_DETAIL" ( -- 영화디테일
			"MOVIE_NO" -- 영화번호
		);

        
desc actor_list;
-- 영화배우 테이블 데이터 삽입 
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10000,'박해수');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10001,'이정재');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10002,'변요한');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10003,'김무열');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10004,'시무리우');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10005,'양조위');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10006,'박정민');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10007,'이성민');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10008,'김윤석');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10009,'조인성');
INSERT INTO ACTOR (ACTOR_NO,ACTOR_NAME) VALUES (10010,'구교환');

/* 
기존의 MOVIE_ DETAIL에서 DETAIL_ACTOR 삭제
기존에 영화 디테일에 영화배우 컬럼이 있으면 데이터를 삽입 할 수 없다.
*/
ALTER TABLE MOVIE_DETAIL DROP COLUMN DEATIL_ACTOR;




-- 영화 디테일 데이터 삽입 

INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1000,'오징징','황동혁',90,'456억 원의 상금이 걸린 의문의 서바이벌에 참가한 사람들이 최후의 승자가 되기 위해 목숨을 걸고 극한의 게임에 도전하는 이야기를 담은 넷플릭스 시리즈',TO_DATE('2022-07-28','YYYY-MM-DD'));
INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1001,'보이스피싱 리얼범죄액션','김선',109,'단 한 통의 전화!
걸려오는 순간 걸려들었다!
부산 건설현장 직원들을 상대로 걸려온 전화 한 통.
 보이스피싱 전화로 인해 딸의 병원비부터 아파트 중도금까지,
 당일 현장에서는 수많은 사람들이 목숨 같은 돈을 잃게 된다.
 
 현장작업반장인 전직형사 서준(변요한)은 가족과 동료들의 돈 30억을 되찾기 위해
 보이스피싱 조직을 추적하기 시작한다.
 
 마침내 중국에 위치한 본거지 콜센터 잠입에 성공한 서준,
 개인정보확보, 기획실 대본입고, 인출책 섭외, 환전소 작업, 대규모 콜센터까지!
 체계적으로 조직화된 보이스피싱의 스케일에 놀라고,
 그곳에서 피해자들의 희망과 공포를 파고드는 목소리의 주인공이자 기획실 총책 곽프로(김무열)를 드디어 마주한다.
 
 그리고 그가 300억 규모의 새로운 총력전을 기획하는 것을 알게 되는데..
 
 상상이상으로 치밀하게 조직화된 보이스피싱의 실체!
 끝까지 쫓아 반드시 되찾는다!',TO_DATE('2021-10-28','YYYY-MM-DD'));


INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1002,'Shang-Chi and the Legend of the Ten Rings','데스틴크리튼',132,'텐 링즈 를 차지하는 자, 세상을 지배한다!
초인적인 능력을 가진 텐 링즈 의 힘으로 수세기 동안 어둠의 세상을 지배해 온 웬우
 샹치는 아버지 웬우 밑에서 암살자로 훈련을 받았지만 이를 거부하고 평범함 삶을 선택한다.
 그러나 샹치는 목숨을 노리는 자들의 습격으로 더 이상 운명을 피할 수 없다는 것을 직감하고,
 어머니가 남긴 가족의 비밀과 내면의 신비한 힘을 일깨우게 된다
 벗어나고 싶은 과거이자, 그 누구보다 두려운 아버지 웬우를 마주해야 하는 샹치
 악이 될 것인가? 구원이 될 것인가?
 마블의 새로운 시대,
 세상에 없던 힘이 탄생한다!',TO_DATE('2021-10-01','YYYY-MM-DD'));

--감독명 크기 변경
alter table movie_detail modify(DEATIL_DIRECTOR VARCHAR2(255));

INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1003,'기적을 낳다','이장훈',117,'오갈 수 있는 길은 기찻길밖에 없지만
 정작 기차역은 없는 마을.
 오늘부로 청와대에 딱 54번째 편지를 보낸 ‘준경’(박정민)의 목표는 단 하나!
 바로 마을에 기차역이 생기는 것이다.
 
 기차역은 어림없다는 원칙주의 기관사 아버지 ‘태윤’(이성민)의 반대에도
 누나 ‘보경’(이수경)과 마을에 남는 걸 고집하며 왕복 5시간 통학길을 오가는 ‘준경’.
 그의 엉뚱함 속 비범함을 단번에 알아본 자칭 뮤즈 ‘라희’(임윤아)와 함께
 설득력 있는 편지쓰기를 위한 맞춤법 수업,
 유명세를 얻기 위한 장학퀴즈 테스트,
 대통령배 수학경시대회 응시까지!
 오로지 기차역을 짓기 위한 ‘준경’만의 노력은 계속되는데...!
 
 포기란 없다
 기차가 서는 그날까지!',TO_DATE('2021-10-15','YYYY-MM-DD'));


INSERT INTO MOVIE_DETAIL (MOVIE_NO,DEATIL_SUBTITLE ,DEATIL_DIRECTOR ,DEATIL_RT,DEATIL_CONTENT,DEATIL_END) 
VALUES (1004,'필사의 탈출 우리는 반드시 돌아간다','류승완',121,'내전으로 고립된 낯선 도시, 모가디슈
 지금부터 우리의 목표는 오로지 생존이다!
 
 대한민국이 UN가입을 위해 동분서주하던 시기
 1991년 소말리아의 수도 모가디슈에서는 일촉즉발의 내전이 일어난다.
 통신마저 끊긴 그 곳에 고립된 대한민국 대사관의 직원과 가족들은
 총알과 포탄이 빗발치는 가운데, 살아남기 위해 하루하루를 버텨낸다.
 그러던 어느 날 밤, 북한 대사관의 일행들이 도움을 요청하며 문을 두드리는데…
 
 목표는 하나, 모가디슈에서 탈출해야 한다!',TO_DATE('2021-09-28','YYYY-MM-DD'));


--영화,출연진 테이블 삽입

/* 10000	박해수
10001	이정재
10002	변요한
10003	김무열
10004	시무리우
10005	양조위
10006	박정민
10007	이성민
10008	김윤석
10009	조인성
10010	구교환*/
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





-- 극장 데이터 추가 
INSERT INTO THEATER (THEATER_NO,THEATER_NAME,THEATER_LOC,THEATER_ROOM,LO_NO,TH_SEAT) VALUES (1000,'한독빌딩점','역삼','1관','1',50);

--영화시간표 추가 
--시작시간, 종료시간 을 NUMBER타입에서 VARCHAR2 타입으로 변경 
alter table TIMETABLE modify(TIME_START VARCHAR2(30));
alter table TIMETABLE modify(TIME_END VARCHAR2(30));


INSERT INTO TIMETABLE (TIME_NO,THEATER_NO,MOVIE_NO,TIME_DATE,TIME_START,TIME_END) VALUES ('TIME001',1000,1001,sysdate,'10:00','11:49');

--좌석 데이터 추가 
-- 좌석 예매여부 타입 VARCHAR2에서 BOOLEAN으로 변경
-- 하지만 BOOLEAN은 오라클에서 안되므로 체크 제약조건을 부여하여 T 또는 F 만 입력할수 있게 설정해둔다.
alter table SEAT modify(SE_STATE  VARCHAR2(1));
ALTER TABLE SEAT ADD CONSTRAINT  SE_STATE_CHECK CHECK(SE_STATE = 'F' or SE_STATE = 'T');

desc seat;
--좌석데이터 입력 보류

--회원정보 데이터 입력
insert into user_info (USER_ID,USER_PW,USER_NAME,USER_ADDR,USER_TEL,USER_GENRE,USER_BIRTH,USER_EMAIL)
VALUES ('seonzone','ssang1','박성종','성남','01085083581','공포',TO_DATE('1996-09-30','YYYY-MM-DD'),'tjdwhd2247@gmail.com');

--결제테이블 입력

INSERT INTO PAYMENT (PAYMENT_NO, METHOD_NO,PAYMENT_CHOOSE,PAYMENT_TIME,PAYMENT_TOTAL) VALUES (1000,1,0,sysdate,14000);

--예매테이블 입력
-- 쿠폰사용 여부에 체크옵션을 넣어 T 아니면 F만 가능하게 해준다.
ALTER TABLE BOOKING ADD CONSTRAINT BK_USECOUPON_CHECK CHECK(BK_USECOUPON = 'F' or BK_USECOUPON = 'T');
INSERT INTO BOOKING (BOOKING_NO,PAYMENT_NO,MOVIE_NO,THEATER_NO,USER_ID,BK_ADULT,BK_USECOUPON,BK_DATE) VALUES(1000,1000,1001,1000,'seonzone','1','F',sysdate);

