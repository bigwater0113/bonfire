create table localmap(
    type varchar2(8),
    geometrytype varchar2(10),
    geometrycoordinateslng number(3,14),
    geometrycoordinatesLat number(3,14),
    propertiesaddress_name varchar2(500),
    propertiescategory_group_code varchar2(5),
    propertiescategory_group_name varchar2(20),
    propertiescategory_name varchar2(500),
    propertiesdistance number(10),
    propertiesid number(8) PRIMARY key, 
    propertiesphone varchar2(15),
    propertiesplace_name varchar2(100),
    propertiesplace_url varchar2(500),
    propertiesroad_address_name varchar2(500)
);
drop table tripplan;
create table tripplan(
    idx number(10),
    id varchar2(40),
    placeid number(10),
    triporder number(10),
    constraint PK_tripplan Primary key(idx, triporder)
);
create sequence tripplan_seq;
ALTER TABLE tripplan
  ADD CONSTRAINT FK_localmap_TO_tripplan
    FOREIGN KEY (placeid)
    REFERENCES localmap (propertiesid);
ALTER TABLE tripplan
  ADD CONSTRAINT FK_bmembers_TO_tripplan
    FOREIGN KEY (id)
    REFERENCES bmembers (id);
    
select nvl(sum(idx),0) idx from(select /*+ index_desc(c PK_tripplan)*/ 
rownum rnum, idx from tripplan c where rownum=1);

desc tripplan;

desc localmap;

select * from localmap;


drop table localmap;

insert into localmap(propertiesid) values(4);


insert into tripplan values(5,'asdf', 1, 3);

commit;
select * from tripplan;

select nvl(sum(idx),0) idx from(select /*+ index_desc(c PK_tripplan)*/ 
        rownum rnum, idx from tripplan c where rownum=1) where rnum=1;
select max(idx) from tripplan; 

select * from tripplan where idx=5;
select distinct idx from tripplan where id='asdf';