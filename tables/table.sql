
        
CREATE TABLE auth
(
  id        VARCHAR2(40) NOT NULL,
  authority varchar2(40) NOT NULL,
  CONSTRAINT PK_auth PRIMARY KEY (id, authority)
);

COMMENT ON COLUMN auth.id IS '아이디';

CREATE TABLE author
(
  idx       number(10)    NOT NULL,
  id        VARCHAR2(40) ,
  intro     VARCHAR2(200),
  theme     clob         ,
  applydate DATE          NOT NULL,
  respond   number(10)    DEFAULT 0,
  CONSTRAINT PK_author PRIMARY KEY (idx)
);

COMMENT ON TABLE author IS '작가';

COMMENT ON COLUMN author.id IS '아이디';

COMMENT ON COLUMN author.intro IS '자기소개';

COMMENT ON COLUMN author.theme IS '테마 주제';

COMMENT ON COLUMN author.applydate IS '신청날짜';

COMMENT ON COLUMN author.respond IS '승인1 거절2';

CREATE TABLE bmembers
(
  id      VARCHAR2(40)  NOT NULL,
  pwd     VARCHAR2(200),
  name    VARCHAR2(40) ,
  email   VARCHAR2(50) ,
  birth   DATE         ,
  gender  number(1)    ,
  phone   VARCHAR2(15) ,
  address VARCHAR2(600),
  enabled number(1)    ,
  CONSTRAINT PK_bmembers PRIMARY KEY (id)
);

COMMENT ON TABLE bmembers IS '회원';

COMMENT ON COLUMN bmembers.id IS '아이디';

COMMENT ON COLUMN bmembers.pwd IS '비밀번호';

COMMENT ON COLUMN bmembers.name IS '이름';

COMMENT ON COLUMN bmembers.email IS '이메일';

COMMENT ON COLUMN bmembers.birth IS '생년월일';

COMMENT ON COLUMN bmembers.gender IS '성별';

COMMENT ON COLUMN bmembers.phone IS '핸드폰';

COMMENT ON COLUMN bmembers.address IS '주소';

CREATE TABLE cats
(
  cname       VARCHAR2(40) NOT NULL,
  cwhichboard VARCHAR2(40),
  CONSTRAINT PK_cats PRIMARY KEY (cname)
);

COMMENT ON TABLE cats IS '카테고리- 문의, 구독자 게시판용';

COMMENT ON COLUMN cats.cname IS '카테고리명';

COMMENT ON COLUMN cats.cwhichboard IS '무슨게시판?';

CREATE TABLE dailyboard
(
  num     number(10)    NOT NULL,
  id      VARCHAR2(40) ,
  title   varchar2(200),
  content clob         ,
  adddate date         ,
  CONSTRAINT PK_dailyboard PRIMARY KEY (num)
);

COMMENT ON TABLE dailyboard IS '일기장';

COMMENT ON COLUMN dailyboard.num IS 'number';

COMMENT ON COLUMN dailyboard.id IS '아이디';

CREATE TABLE dfile
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_dfile PRIMARY KEY (idx, num)
);

COMMENT ON COLUMN dfile.num IS 'number';

CREATE TABLE fbcomment
(
  idx     NUMBER(10)   NOT NULL,
  num     number(10)  ,
  id      VARCHAR2(40),
  content clob        ,
  adddate DATE        ,
  CONSTRAINT PK_fbcomment PRIMARY KEY (idx)
);

COMMENT ON TABLE fbcomment IS '댓글';

COMMENT ON COLUMN fbcomment.idx IS '댓글번호';

COMMENT ON COLUMN fbcomment.num IS '번호';

COMMENT ON COLUMN fbcomment.id IS '아이디';

COMMENT ON COLUMN fbcomment.content IS '내용';

COMMENT ON COLUMN fbcomment.adddate IS '작성날짜';

CREATE TABLE fbfiles
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_fbfiles PRIMARY KEY (idx, num)
);

COMMENT ON TABLE fbfiles IS '여행기록 첨부파일';

COMMENT ON COLUMN fbfiles.num IS '번호';

CREATE TABLE fbhits
(
  idx number(10)   NOT NULL,
  num number(10)   NOT NULL,
  id  VARCHAR2(40),
  CONSTRAINT PK_fbhits PRIMARY KEY (idx, num)
);

COMMENT ON TABLE fbhits IS '조회수';

COMMENT ON COLUMN fbhits.num IS '번호';

COMMENT ON COLUMN fbhits.id IS '아이디';

CREATE TABLE feedboard
(
  num       number(10)    NOT NULL,
  id        VARCHAR2(40) ,
  title     VARCHAR2(200),
  content   clob         ,
  recommand number(10)   ,
  hits      number(10)   ,
  scrap     number(10)   ,
  ispost    number(1)    ,
  postdate  DATE         ,
  adddate   DATE         ,
  cname     VARCHAR2(40) ,
  CONSTRAINT PK_feedboard PRIMARY KEY (num)
);

COMMENT ON TABLE feedboard IS '여행기록';

COMMENT ON COLUMN feedboard.num IS '번호';

COMMENT ON COLUMN feedboard.id IS '아이디';

COMMENT ON COLUMN feedboard.title IS '제목';

COMMENT ON COLUMN feedboard.content IS '내용';

COMMENT ON COLUMN feedboard.recommand IS '추천수';

COMMENT ON COLUMN feedboard.hits IS '조회수';

COMMENT ON COLUMN feedboard.scrap IS '스크랩수';

COMMENT ON COLUMN feedboard.ispost IS '발행했니?';

COMMENT ON COLUMN feedboard.postdate IS '발행시간';

COMMENT ON COLUMN feedboard.adddate IS '작성시간';

COMMENT ON COLUMN feedboard.cname IS '카테고리명';

CREATE TABLE follow
(
  id      VARCHAR2(40),
  follow  VARCHAR2(40),
  adddate date        
);

COMMENT ON TABLE follow IS '팔로우';

COMMENT ON COLUMN follow.id IS '아이디';

COMMENT ON COLUMN follow.follow IS '아이디';

CREATE TABLE loginrecord
(
  id           VARCHAR2(40)  NOT NULL,
  recentaccess DATE          NOT NULL,
  fingerprint  varchar2(32) ,
  ip           varchar2(15) ,
  machine      varchar2(400),
  status       number(1)    ,
  CONSTRAINT PK_loginrecord PRIMARY KEY (id, recentaccess)
);

COMMENT ON TABLE loginrecord IS '로그인내역등록';

COMMENT ON COLUMN loginrecord.id IS '아이디';

COMMENT ON COLUMN loginrecord.recentaccess IS '최근접속';

COMMENT ON COLUMN loginrecord.fingerprint IS 'fingerprint.js를 통한 identifier';

COMMENT ON COLUMN loginrecord.ip IS 'ip';

COMMENT ON COLUMN loginrecord.machine IS '브라우저 정보';

COMMENT ON COLUMN loginrecord.status IS '성공?실패?등등';

CREATE TABLE mprofile
(
  id        VARCHAR2(40)  NOT NULL,
  nickname  VARCHAR2(40) ,
  intro     VARCHAR2(200),
  follow    NUMBER(10)   ,
  follower  NUMBER(10)   ,
  bfilename varchar2(200),
  pfilename varchar2(200),
  CONSTRAINT PK_mprofile PRIMARY KEY (id)
);

COMMENT ON TABLE mprofile IS '프로필';

COMMENT ON COLUMN mprofile.id IS '아이디';

COMMENT ON COLUMN mprofile.nickname IS '닉네임';

COMMENT ON COLUMN mprofile.intro IS '자기소개';

COMMENT ON COLUMN mprofile.follow IS '팔로우수';

COMMENT ON COLUMN mprofile.follower IS '팔로워수';

CREATE TABLE notify
(
  idx       number(10)   NOT NULL,
  id        VARCHAR2(40),
  context   CLOB        ,
  ref       clob        ,
  sender    varchar2(20),
  type      varchar2(10),
  timestamp date         DEFAULT sysdate,
  readdate  date        ,
  CONSTRAINT PK_notify PRIMARY KEY (idx)
);

COMMENT ON TABLE notify IS '사용자 알림-websocket사용?';

COMMENT ON COLUMN notify.idx IS 'pk, 시퀀스';

COMMENT ON COLUMN notify.id IS '아이디';

COMMENT ON COLUMN notify.context IS '알림내용';

COMMENT ON COLUMN notify.ref IS '연결될 페이지';

COMMENT ON COLUMN notify.sender IS '누구?';

COMMENT ON COLUMN notify.type IS '알림의 타입(경고라던지..)';

COMMENT ON COLUMN notify.timestamp IS '발생시간(index)';

COMMENT ON COLUMN notify.readdate IS '알람읽은시간';

CREATE TABLE qfile
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_qfile PRIMARY KEY (idx, num)
);

COMMENT ON COLUMN qfile.num IS '번호';

CREATE TABLE qhits
(
  num  number(10)   NOT NULL,
  fpid varchar2(32) NOT NULL,
  CONSTRAINT PK_qhits PRIMARY KEY (num, fpid)
);

ALTER TABLE qhits
  ADD CONSTRAINT UQ_qhits_fpid UNIQUE (fpid);

COMMENT ON TABLE qhits IS 'id도 검사할거니 index에 추가해야됨 ';

COMMENT ON COLUMN qhits.num IS '번호';

CREATE TABLE qnaboard
(
  num      number(10)    NOT NULL,
  id       VARCHAR2(40) ,
  title    VARCHAR2(200),
  content  clob         ,
  adddate  DATE         ,
  hits     number(10)   ,
  comments clob         ,
  cname    VARCHAR2(40) ,
  CONSTRAINT PK_qnaboard PRIMARY KEY (num)
);

COMMENT ON TABLE qnaboard IS '문의게시판';

COMMENT ON COLUMN qnaboard.num IS '번호';

COMMENT ON COLUMN qnaboard.id IS '아이디';

COMMENT ON COLUMN qnaboard.title IS '제목';

COMMENT ON COLUMN qnaboard.content IS '내용';

COMMENT ON COLUMN qnaboard.adddate IS '작성일자';

COMMENT ON COLUMN qnaboard.hits IS '조회수';

COMMENT ON COLUMN qnaboard.comments IS '관리자댓글';

COMMENT ON COLUMN qnaboard.cname IS '카테고리명';

CREATE TABLE recomm
(
  idx     number(10)   NOT NULL,
  num     number(10)  ,
  id      VARCHAR2(40),
  value   number(1)   ,
  adddate DATE        ,
  CONSTRAINT PK_recomm PRIMARY KEY (idx)
);

COMMENT ON TABLE recomm IS '추천내역';

COMMENT ON COLUMN recomm.idx IS '시퀀스';

COMMENT ON COLUMN recomm.num IS '번호';

COMMENT ON COLUMN recomm.id IS '추천누른아이디';

COMMENT ON COLUMN recomm.value IS '1 or -1';

COMMENT ON COLUMN recomm.adddate IS 'sysdate';

CREATE TABLE sbhits
(
  num  number(10)   NOT NULL,
  fpid varchar2(32) NOT NULL,
  CONSTRAINT PK_sbhits PRIMARY KEY (num, fpid)
);

ALTER TABLE sbhits
  ADD CONSTRAINT UQ_sbhits_fpid UNIQUE (fpid);

COMMENT ON COLUMN sbhits.num IS '번호';

CREATE TABLE scomment
(
  idx     number(10)   NOT NULL,
  snum    number(10)   NOT NULL,
  id      VARCHAR2(40),
  content clob        ,
  adddate date        ,
  CONSTRAINT PK_scomment PRIMARY KEY (idx, snum)
);

COMMENT ON COLUMN scomment.snum IS '번호';

COMMENT ON COLUMN scomment.id IS '아이디';

CREATE TABLE scrapboard
(
  id      VARCHAR2(40) NOT NULL,
  num     number(10)   NOT NULL,
  adddate DATE        ,
  CONSTRAINT PK_scrapboard PRIMARY KEY (id, num)
);

COMMENT ON TABLE scrapboard IS '스크랩';

COMMENT ON COLUMN scrapboard.id IS '아이디';

COMMENT ON COLUMN scrapboard.num IS '번호';

COMMENT ON COLUMN scrapboard.adddate IS '언제';

CREATE TABLE sfiles
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_sfiles PRIMARY KEY (idx, num)
);

COMMENT ON COLUMN sfiles.num IS '번호';

CREATE TABLE srecomm
(
  idx     number(10)   NOT NULL,
  num     number(10)   NOT NULL,
  id      VARCHAR2(40),
  value   number(1)   ,
  adddate date        ,
  CONSTRAINT PK_srecomm PRIMARY KEY (idx, num)
);

COMMENT ON COLUMN srecomm.num IS '번호';

COMMENT ON COLUMN srecomm.id IS '아이디';

CREATE TABLE subscriberboard
(
  num       number(10)    NOT NULL,
  id        VARCHAR2(40) ,
  title     VARCHAR2(200),
  content   clob         ,
  adddate   DATE         ,
  recommand number(10)   ,
  hits      number(10)   ,
  cname     VARCHAR2(40) ,
  CONSTRAINT PK_subscriberboard PRIMARY KEY (num)
);

COMMENT ON TABLE subscriberboard IS '구독자게시판';

COMMENT ON COLUMN subscriberboard.num IS '번호';

COMMENT ON COLUMN subscriberboard.id IS '아이디';

COMMENT ON COLUMN subscriberboard.title IS '제목';

COMMENT ON COLUMN subscriberboard.content IS '내용';

COMMENT ON COLUMN subscriberboard.adddate IS '작성일자';

COMMENT ON COLUMN subscriberboard.recommand IS '추천수';

COMMENT ON COLUMN subscriberboard.hits IS '조회수';

COMMENT ON COLUMN subscriberboard.cname IS '카테고리명';

ALTER TABLE author
  ADD CONSTRAINT FK_bmembers_TO_author
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE subscriberboard
  ADD CONSTRAINT FK_bmembers_TO_subscriberboard
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE qnaboard
  ADD CONSTRAINT FK_bmembers_TO_qnaboard
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE mprofile
  ADD CONSTRAINT FK_bmembers_TO_mprofile
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE fbcomment
  ADD CONSTRAINT FK_bmembers_TO_fbcomment
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE scrapboard
  ADD CONSTRAINT FK_bmembers_TO_scrapboard
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE feedboard
  ADD CONSTRAINT FK_bmembers_TO_feedboard
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE follow
  ADD CONSTRAINT FK_bmembers_TO_follow
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE recomm
  ADD CONSTRAINT FK_bmembers_TO_recomm
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE loginrecord
  ADD CONSTRAINT FK_bmembers_TO_loginrecord
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE notify
  ADD CONSTRAINT FK_bmembers_TO_notify
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE fbhits
  ADD CONSTRAINT FK_bmembers_TO_fbhits
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE scomment
  ADD CONSTRAINT FK_subscriberboard_TO_scomment
    FOREIGN KEY (snum)
    REFERENCES subscriberboard (num);

ALTER TABLE scomment
  ADD CONSTRAINT FK_bmembers_TO_scomment
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE subscriberboard
  ADD CONSTRAINT FK_cats_TO_subscriberboard
    FOREIGN KEY (cname)
    REFERENCES cats (cname);

ALTER TABLE feedboard
  ADD CONSTRAINT FK_cats_TO_feedboard
    FOREIGN KEY (cname)
    REFERENCES cats (cname);

ALTER TABLE qnaboard
  ADD CONSTRAINT FK_cats_TO_qnaboard
    FOREIGN KEY (cname)
    REFERENCES cats (cname);

ALTER TABLE dailyboard
  ADD CONSTRAINT FK_bmembers_TO_dailyboard
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE fbhits
  ADD CONSTRAINT FK_feedboard_TO_fbhits
    FOREIGN KEY (num)
    REFERENCES feedboard (num);

ALTER TABLE sbhits
  ADD CONSTRAINT FK_subscriberboard_TO_sbhits
    FOREIGN KEY (num)
    REFERENCES subscriberboard (num);

ALTER TABLE sfiles
  ADD CONSTRAINT FK_subscriberboard_TO_sfiles
    FOREIGN KEY (num)
    REFERENCES subscriberboard (num);

ALTER TABLE fbfiles
  ADD CONSTRAINT FK_feedboard_TO_fbfiles
    FOREIGN KEY (num)
    REFERENCES feedboard (num);

ALTER TABLE qhits
  ADD CONSTRAINT FK_qnaboard_TO_qhits
    FOREIGN KEY (num)
    REFERENCES qnaboard (num);

ALTER TABLE qfile
  ADD CONSTRAINT FK_qnaboard_TO_qfile
    FOREIGN KEY (num)
    REFERENCES qnaboard (num);

ALTER TABLE dfile
  ADD CONSTRAINT FK_dailyboard_TO_dfile
    FOREIGN KEY (num)
    REFERENCES dailyboard (num);

ALTER TABLE recomm
  ADD CONSTRAINT FK_feedboard_TO_recomm
    FOREIGN KEY (num)
    REFERENCES feedboard (num);

ALTER TABLE srecomm
  ADD CONSTRAINT FK_subscriberboard_TO_srecomm
    FOREIGN KEY (num)
    REFERENCES subscriberboard (num);

ALTER TABLE srecomm
  ADD CONSTRAINT FK_bmembers_TO_srecomm
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE auth
  ADD CONSTRAINT FK_bmembers_TO_auth
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE scrapboard
  ADD CONSTRAINT FK_feedboard_TO_scrapboard
    FOREIGN KEY (num)
    REFERENCES feedboard (num);

ALTER TABLE fbcomment
  ADD CONSTRAINT FK_feedboard_TO_fbcomment
    FOREIGN KEY (num)
    REFERENCES feedboard (num);

ALTER TABLE follow
  ADD CONSTRAINT FK_bmembers_TO_follow1
    FOREIGN KEY (follow)
    REFERENCES bmembers (id);

      