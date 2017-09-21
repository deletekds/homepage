DROP TABLE bbs1 PURGE; 
 
CREATE TABLE bbs1 ( 
  bbsno   NUMBER(7)     NOT NULL,  
  wname   VARCHAR(20)   NOT NULL, 
  title   VARCHAR(100)  NOT NULL, 
  content VARCHAR(4000) NOT NULL,
  passwd  VARCHAR(15)   NOT NULL,  
  viewcnt NUMBER(5)     DEFAULT 0,
  wdate   DATE          NOT NULL, 
  grpno   NUMBER(7)     DEFAULT 0, 
  indent  NUMBER(2)     DEFAULT 0, 
  ansnum  NUMBER(5)     DEFAULT 0,
  PRIMARY KEY (bbsno)  
); 
