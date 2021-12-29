select * from programmer;
select * from studies;

--1.Display the names and ages of all the programmers
SELECT pname,TRUNC((months_between (sysdate,DOB))/ 12,2) AS AGE_TODAY from programmer;

--3.Display the names and date of birth of all programmers born in january
select pname,dob from programmer where (substr(dob,4,2))=01;
select Pname, DOB from programmer where To_char(dob,'mm')=1;

--4.Display the lowest course fee
select min(ccost) from studies; 

--5.How many programmers have done the pgdca course?
select programmer.pname from studies
inner join programmer on lower(programmer.pname)=lower(studies.pname)
where course ='PGDCA';

--6.Display the details of software developed by ramesh.
select title from software
where pname='RAMESH';

--7.How many programmers studied  in SABARI?
select count(*) from programmer 
inner join studies on Upper(programmer.pname)=studies.pname
where splace='SABARI';

--8.What is the price of the costliest software developed in BASIC?
select max(dcost) from software where dev_in='BASIC';

--9.How many programmers studied in PRAGATHI?
select count(*) from programmer 
inner join studies on Upper(programmer.pname)=studies.pname
where splace='PRAGATHI';

--10.How many programmers paid 5000 to 10000 for their course
SELECT COUNT(*) FROM STUDIES WHERE CCOST BETWEEN 5000 AND 10000;

--11.Display the details of programmers  knowing C.
SELECT * FROM PROGRAMMER WHERE prof1='c' OR prof2='c';

--12.Display the number of male and female programmers.
SELECT SEX,COUNT(*) FROM PROGRAMMER GROUP BY SEX;

--13.Display the programmers name and their packages.
SELECT PNAME,SALARY FROM programmer;

--14.What is the average Salary?
SELECT AVG(SALARY) FROM PROGRAMMER;

--15.How many female programmers are there
SELECT COUNT(*) FROM PROGRAMMER WHERE SEX='f' GROUP BY SEX;

--16What are the languages known by male programmers?
SELECT DISTINCT PROF1,prof2 FROM PROGRAMMER WHERE SEX='m';
SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE SEX='m';

--17Who are the programmers who celebrate their b'days during the current month?
SELECT PNAME,DOB FROM PROGRAMMER WHERE TO_CHAR(DOB,'MM')=11;

--18How old is the oldest male programmer?
SELECT MAX(TRUNC(MONTHS_BETWEEN(SYSDATE,DOB)/12,0)) AS AGE FROM PROGRAMMER ;

--19.What is the average age of the female programmer?
SELECT AVG(ROUND(MONTHS_BETWEEN(SYSDATE,DOB)/12)) AS AGE FROM PROGRAMMER WHERE SEX='f';

--20How many programmers don't know pascal and c?
SELECT COUNT(PNAME) FROM PROGRAMMER WHERE NOT prof1='c' AND NOT prof1='pascal' AND NOT PROF2='c';
