
CREATE TABLE memo1( 
  memono  NUMBER(6)     NOT NULL,  
  title   VARCHAR(100)  NOT NULL,  
  content VARCHAR(4000) NOT NULL, 
  wdate   DATE          NOT NULL, 
  viewcnt NUMBER(5)     DEFAULT 0, 
  PRIMARY KEY(memono)             
); 
