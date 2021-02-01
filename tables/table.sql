---------------------------------------------------------------
-- [ ���̺� ���� ����! ]

-- ȸ�����̺�
CREATE TABLE bmembers
(
  id      VARCHAR2(40)  NOT NULL,
  pwd     VARCHAR2(200),
  name    VARCHAR2(40) ,
  email   VARCHAR2(50) ,
  birth   DATE         ,
  gender  VARCHAR2(10) ,
  phone   VARCHAR2(15) ,
  address VARCHAR2(600),
  enabled number(1)    ,
  CONSTRAINT PK_bmembers PRIMARY KEY (id)
);

-- �������̺�
CREATE TABLE auth
(
  id        VARCHAR2(40) NOT NULL,
  authority varchar2(40) NOT NULL,
  CONSTRAINT PK_auth PRIMARY KEY (id, authority)
);

-- �α��γ������ ���̺�
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

-- member������
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

-- ����� �˸�
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

-- �ȷο� ���̺�
CREATE TABLE follow
(
  id      VARCHAR2(40),
  follow  VARCHAR2(40),
  adddate date        
);

-- �۰����̺�
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

-- ī�װ��� ���̺� (���� ������ �Խ��ǿ�)
CREATE TABLE cats
(
  cname       VARCHAR2(40) NOT NULL,
  cwhichboard VARCHAR2(40),
  CONSTRAINT PK_cats PRIMARY KEY (cname)
);


-- [ �ϱ��� ]
-- �ϱ��� ���̺�
CREATE TABLE dailyboard
(
  num     number(10)    NOT NULL,
  id      VARCHAR2(40) ,
  title   varchar2(200),
  content clob         ,
  adddate date         ,
  CONSTRAINT PK_dailyboard PRIMARY KEY (num)
);


-- �ϱ��� ÷������
CREATE TABLE dfile
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_dfile PRIMARY KEY (idx, num)
);


-- [ ������ ]
-- ���������̺�
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

-- ��ũ�� �Խ���
CREATE TABLE scrapboard
(
  id      VARCHAR2(40) NOT NULL,
  num     number(10)   NOT NULL,
  adddate DATE        ,
  CONSTRAINT PK_scrapboard PRIMARY KEY (id, num)
);

-- ������ ��� ���̺�
CREATE TABLE fbcomment
(
  idx     NUMBER(10)   NOT NULL,
  num     number(10)  ,
  id      VARCHAR2(40),
  content clob        ,
  adddate DATE        ,
  CONSTRAINT PK_fbcomment PRIMARY KEY (idx)
);


-- ������ ÷������
CREATE TABLE fbfiles
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_fbfiles PRIMARY KEY (idx, num)
);

-- ������ ��ȸ��
CREATE TABLE fbhits
(
  num number(10)   NOT NULL,
  id  VARCHAR2(40),
  CONSTRAINT PK_fbhits PRIMARY KEY (num, id)
);
-- CREATE TABLE fbhits
-- (
--   idx number(10)   NOT NULL,
--   num number(10)   NOT NULL,
--   id  VARCHAR2(40),
--   CONSTRAINT PK_fbhits PRIMARY KEY (idx, num)
-- );

-- ������ ��õ
CREATE TABLE recomm
(
  idx     number(10)   NOT NULL,
  num     number(10)  ,
  id      VARCHAR2(40),
  value   number(1)   ,
  adddate DATE        ,
  CONSTRAINT PK_recomm PRIMARY KEY (idx)
);


-- [ ���ǰԽ��� ]
-- ���ǰԽ���
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

-- ���ǰԽ��� ÷������
CREATE TABLE qfile
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_qfile PRIMARY KEY (idx, num)
);

-- ���ǰԽ��� ��ȸ��
CREATE TABLE qhits
(
  num  number(10)   NOT NULL,
  id  VARCHAR2(40)  NOT NULL,
  CONSTRAINT PK_qhits PRIMARY KEY (num, id)
);


-- [ ������ �Խ��� ]
-- �����ڰԽ���
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

-- �����ڰԽ��� ��ȸ��
CREATE TABLE sbhits
(
  num  number(10)   NOT NULL,
  id  VARCHAR2(40)  NOT NULL,
  CONSTRAINT PK_sbhits PRIMARY KEY (num, id)
);


-- �����ڰԽ��� ���
CREATE TABLE scomment
(
  idx     number(10)   NOT NULL,
  snum    number(10)   NOT NULL,
  id      VARCHAR2(40),
  content clob        ,
  adddate date        ,
  CONSTRAINT PK_scomment PRIMARY KEY (idx, snum)
);

-- �����ڰԽ��� ��õ
CREATE TABLE srecomm
(
  idx     number(10)   NOT NULL,
  num     number(10)   NOT NULL,
  id      VARCHAR2(40),
  value   number(1)   ,
  adddate date        ,
  CONSTRAINT PK_srecomm PRIMARY KEY (idx, num)
);

-- �����ڰԽ��� ÷������
CREATE TABLE sfiles
(
  idx          number(10)    NOT NULL,
  num          number(10)    NOT NULL,
  savefilename varchar2(200) NOT NULL,
  orgfilename  varchar2(200),
  CONSTRAINT PK_sfiles PRIMARY KEY (idx, num)
);

-- [ ���̺� ���� ��! ]
---------------------------------------------------------------



-- [ ���̺� ���Ǻ��̱� ]

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

ALTER TABLE sbhits
  ADD CONSTRAINT FK_bmembers_TO_sbhits
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE fbhits
  ADD CONSTRAINT FK_bmembers_TO_fbhits
    FOREIGN KEY (id)
    REFERENCES bmembers (id);

ALTER TABLE qhits
  ADD CONSTRAINT FK_bmembers_TO_qhits
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

      