



4th program

insert into student values('1js21is001','a',123456789,'aa','m');
insert into student values('1js21is002','b',123456789,'ab','m');
insert into student values('1js21is003','c',123456789,'ac','f');
insert into student values('1js21is004','d',123456789,'ad','f');
insert into student values('1js21is005','e',123456789,'ae','f');
insert into student values('1js21is006','f',123456789,'af','m');

insert into semsec values('is001',4,'c');
insert into semsec values('is002',4,'b');
insert into semsec values('is003',4,'a');
insert into semsec values('is004',8,'a');
insert into semsec values('is005',8,'b');
insert into semsec values('is006',8,'c');

insert into class values('1js21is002','is002');
insert into class values('1js21is003','is003');
insert into class values('1js21is004','is004');
insert into class values('1js21is005','is005');
insert into class values('1js21is006','is006');

insert into subject values('22A','ABC',4,2);
insert into subject values('23A','ABD',4,3);
insert into subject values('24A','ABE',8,1);
insert into subject values('25A','ABF',8,2);
insert into subject values('26A','ABG',8,3);

insert into iamarks values('1js21is004','24A','is004',12,13,14,0);
insert into iamarks values('1js21is004','25A','is004',12,13,14,0);
insert into iamarks values('1js21is004','26A','is004',12,13,14,0);
insert into iamarks values('1js21is005','24A','is006',12,13,14,0);
insert into iamarks values('1js21is005','25A','is006',12,13,14,0);
insert into iamarks values('1js21is005','26A','is006',12,13,14,0);



create table student(usn varchar(20) primary key,sname varchar(20),phone_number real,address varchar(20),gender varchar(20));


create table semsec(ssid varchar(20) primary key,sem int,sec varchar(20));


create table class(usn varchar(20),ssid varchar(20),primary key(usn,ssid),foreign key(usn)
references student(usn),foreign key(ssid) references semsec(ssid));


create table subject(subcode varchar(20) primary key,title varchar(20),sem varchar(20),credits int);


create table iamarks(usn varchar(20),subcode varchar(20),ssid varchar(20),test1 int,test2 int,test3 int,finalia int, primary key(usn,subcode,ssid),foreign key(usn)references student(usn),foreign key(subcode)references subject(subcode),foreign key(ssid)references semsec(ssid));

1.
select s.*,ss.sem,ss.sec
    from student s, semsec ss, class c
    where s.usn = c.usn and
    ss.ssid = c.ssid and
    ss.sem = 4 and
    ss.sec = 'c';
2.
 select ss.sem, ss.sec, s.gender, count(s.gender) as count
    from semsec ss, student s, class c
    where s.usn = c.usn and
    ss.ssid = c.ssid
    group by ss.sem, ss.sec, s.gender
    order by sem;
3.
 create view test1_marks as
    select test1, subcode
    from iamarks
    where usn = '1js21ai006';
select * from test1_marks;
4.
update iamarks set finalia = ((test1+test2+test3)-least(test1,test2,test3))/2;
 select * from iamarks;
5.
 SELECT
    S.USN,S.SNAME,S.ADDRESS,S.PHONE_NUMBER,S.GENDER,SUB.SUBCODE,IA.FINALIA,
    (CASE
    WHEN IA.FINALIA BETWEEN 17 AND 20 THEN 'OUTSTANDING'
    WHEN IA.FINALIA BETWEEN 12 AND 16 THEN 'AVERAGE'
    ELSE 'WEAK'
    END) AS CAT
    FROM STUDENT S, SEMSEC SS, IAMARKS IA, SUBJECT SUB
    WHERE S.USN = IA.USN AND
    SS.SSID = IA.SSID AND
    SUB.SUBCODE = IA.SUBCODE AND
    SUB.SEM = 8;
