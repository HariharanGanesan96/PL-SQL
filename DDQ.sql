Create table LMS_MEMBERS
(
MEMBER_ID Varchar2(10),
MEMBER_NAME Varchar2(30) NOT NULL,
CITY Varchar2(20),
DATE_REGISTER Date NOT NULL,
DATE_EXPIRE Date ,
MEMBERSHIP_STATUS Varchar2(15)NOT NULL,
Constraint LMS_cts1 PRIMARY KEY(MEMBER_ID)
);
Insert into LMS_MEMBERS Values('LM001', 'AMIT', 'CHENNAI', '12-02-2012', '11-02-2013','Temporary');
Insert into LMS_MEMBERS Values('LM002', 'ABDHUL', 'DELHI', '10-04-2012', '09-04-2013','Temporary');
Insert into LMS_MEMBERS Values('LM003', 'GAYAN', 'CHENNAI', '13-05-2012','12-05-2013','Permanent');
Insert into LMS_MEMBERS Values('LM004', 'RADHA', 'CHENNAI', '22-04-2012', '21-04-2013','Temporary');
Insert into LMS_MEMBERS Values('LM005', 'GURU', 'BANGALORE', '30-03-2012', '16-05-2013','Temporary');
Insert into LMS_MEMBERS Values('LM006', 'MOHAN', 'CHENNAI', '12-04-2012', '16-05-2013','Temporary');


Create table LMS_SUPPLIERS_DETAILS
(
SUPPLIER_ID Varchar2(3),
SUPPLIER_NAME Varchar2(30) NOT NULL,
ADDRESS Varchar2(50),
CONTACT_bigint varchar2(10) NOT NULL,
EMAIL Varchar2(15) NOT NULL,
Constraint LMS_cts2 PRIMARY KEY(SUPPLIER_ID)
);

Insert into LMS_SUPPLIERS_DETAILS
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI',
9894123555,'sing@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM',
9444411222,'rose@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S05','EINSTEN BOOK GALLARY', 'US',
9542000001,'eingal@aol.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');

Create table LMS_FINE_DETAILS
(
FINE_RANGE Varchar2(3),
FINE_AMOUNT decimal(10,2) NOT NULL,
Constraint LMS_cts3 PRIMARY KEY(FINE_RANGE)
);

Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);

Create table LMS_BOOK_DETAILS(
BOOK_CODE Varchar2(10),
BOOK_TITLE Varchar2(50) NOT NULL,
CATEGORY Varchar2(15) NOT NULL,
AUTHOR Varchar2(30) NOT NULL,
PUBLICATION Varchar2(30),
PUBLISH_DATE Date,
BOOK_EDITION number(2),
PRICE decimal(8,2) NOT NULL,
RACK_NUM Varchar2(3),
DATE_ARRIVAL Date NOT NULL,
SUPPLIER_ID Varchar2(3) NOT NULL,
Constraint LMS_cts4 PRIMARY KEY(BOOK_CODE),
Constraint LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References
LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);
Insert into LMS_BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '12-10-1999', 6, 600.00, 'A1', '10-05-2011', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '10-05-2011', 'S03');
Insert into LMS_BOOK_DETAILS Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-05-1999', 6, 600.00, 'A1', '10-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '11-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-12-1999', 6, 600.00, 'A1', '11-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '12-05-2012', 'S03');
Insert into LMS_BOOK_DETAILS Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB
Publications', '11-12-2010', 9, 500.00 , 'A3', '03-11-2010', 'S03');
Insert into LMS_BOOK_DETAILS Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB
Publications', '12-05-2010', 9, 500.00 , 'A3', '09-08-2011', 'S04');





Create table LMS_BOOK_ISSUE
(
BOOK_ISSUE_NO int,
MEMBER_ID Varchar2(10) NOT NULL,
BOOK_CODE Varchar2(10) NOT NULL,
DATE_ISSUE Date NOT NULL,
DATE_RETURN Date NOT NULL,
DATE_RETURNED Date NULL,
FINE_RANGE Varchar2(3),
Constraint LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),
Constraint LMS_Mem FOREIGN KEY(MEMBER_ID) References
LMS_MEMBERS(MEMBER_ID),
Constraint LMS_BookDetail FOREIGN KEY(BOOK_CODE) References
LMS_BOOK_DETAILS(BOOK_CODE),
Constraint LMS_FineDetail FOREIGN KEY(FINE_RANGE) References
LMS_FINE_DETAILS(FINE_RANGE)
);

Insert into LMS_BOOK_ISSUE Values (001, 'LM001', 'BL000001', '01-05-2012', '16-05-2012', '16-05-2012', 'R0');
Insert into LMS_BOOK_ISSUE Values (002, 'LM002', 'BL000002', '01-05-2012', '06-05-2012','16-05-2012', 'R2');
Insert into LMS_BOOK_ISSUE Values (003, 'LM003', 'BL000007', '01-04-2012', '16-04-2012', '20-04-2012','R1');
Insert into LMS_BOOK_ISSUE Values (004, 'LM004', 'BL000005', '01-04-2012', '16-04-2012','20-04-2012', 'R1');
Insert into LMS_BOOK_ISSUE Values (005, 'LM005', 'BL000008', '30-03-2012', '15-04-2012','20-04-2012' , 'R1');
Insert into LMS_BOOK_ISSUE Values (006, 'LM005', 'BL000008', '20-04-2012', '05-05-2012','05-05-2012' , 'R0');
Insert into LMS_BOOK_ISSUE Values (007, 'LM003', 'BL000007', '22-04-2012', '07-05-2012','25-05-2012' , 'R4');



--Simple Questions:
--Problem # 1:
--Write a query to display the member id, member name, city and membership status 
--who are all having life time membership. Hint: Life time membership status is “Permanent”.

select member_id,member_name,city,membership_status 
from lms_members 
where membership_status='Permanent'; 

--Problem # 2:
--Write a query to display the book code, publication, price and supplier name of the book
--witch is taken frequently.

select * from LMS_BOOK_DETAILS ;
select b.book_code,b.publication,b.price,s.supplier_name
from LMS_BOOK_DETAILS  B
inner join lms_suppliers_details S on b.supplier_id=s.supplier_id
inner join lms_book_issue i on b.book_code=i.book_code
group by b.book_code,b.publication,b.price,s.supplier_name
HAVING count(*)>1;

SELECT b1.book_code,b2.publication,b2.price,b3.supplier_name
FROM(SELECT b1.book_code 
FROM LMS_BOOK_ISSUE b1
GROUP BY book_code 
HAVING COUNT(b1.BOOK_CODE) > 1) b1 
JOIN LMS_BOOK_DETAILS b2 ON b1.book_code = b2.book_code 
JOIN LMS_SUPPLIERS_DETAILS b3 ON b2.supplier_id = b3.supplier_id

SELECT book_code 
FROM LMS_BOOK_ISSUE 
GROUP BY book_code 
HAVING COUNT(BOOK_CODE) >1;
----Problem # 3:
--Write a query to display the member id, member name
--who have taken the book with book code 'BL000002'. 

select m.member_id,m.member_name,i.book_code from LMS_Members m
inner join lms_book_issue i on  i.member_id = m.member_id
where i.book_code='BL000002';

--Problem # 4:
--Write a query to display the book code, book title and author of the 
--books whose author name begins with 'P'.
select book_code,book_title,author from LMS_BOOK_DETAILS where author like 'P%';
 
--Problem # 5:
--Write a query to display the total number of Java books available
--in library with alias name ‘NO_OF_BOOKS’. 
select count(category) as no_of_books from lms_book_details where category='JAVA'; 

--Problem # 6:
--Write a query to list the category and number of books in each category
--with alias name ‘NO_OF_BOOKS’.
select category,count(category) as no_of_books from lms_book_details group by category;

--Problem # 7:
--Write a query to display the number of books published by 
--"Prentice Hall” with the alias name “NO_OF_BOOKS”.
select count(publication) as no_of_books from lms_book_details where publication='Prentice Hall';

--Problem # 8:
--Write a query to display the book code, book title of the books 
--which are issued on the date "1st April 2012".
select d.book_code,d.book_title from LMS_BOOK_DETAILS d
join LMS_BOOK_ISSUE i on d.book_code=i.book_code where date_issue='01-04-2012';

--Problem # 9:
--Write a query to display the member id, member name, date of registration and expiry date 
--of the members whose membership expiry date is before APR 2013.
select member_id,member_name,date_register,date_expire from LMS_MEMBERS where date_expire < '01-04-13';

--Problem # 10:
--write a query to display the member id, member name, date of registration,
--membership status of the members who registered before  "March 2012" and membership 
--status is "Temporary" 

SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER,MEMBERSHIP_STATUS FROM LMS_MEMBERS
WHERE MEMBERSHIP_STATUS='Temporary' AND DATE_REGISTER <'01-03-2012'; 

--Problem #11:
--Write a query to display the member id, member name who’s City is CHENNAI or DELHI.
--Hint: Display the member name in title case with alias name 'Name'. 
SELECT MEMBER_ID,MEMBER_NAME As Name FROM LMS_MEMBERS WHERE CITY='CHENNAI'OR CITY='DELHI';

--Problem #12:
--Write a query to concatenate book title, author and display in the following format.
--Book_Title_is_written_by_Author
--Example:  Let Us C_is_written_by_Yashavant Kanetkar
--Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name. 
select DISTINCT(book_title||'WRITTEN_BY'||AUTHOR) AS BOOK_WRITTEN_BY FROM LMS_BOOK_DETAILS;
--Problem #13
--Write a query to display the average price of books which is belonging to ‘JAVA’ 
--category with alias name “AVERAGEPRICE”.
SELECT  DISTINCT AVG(PRICE) FROM LMS_BOOK_DETAILS
where category='JAVA';

--Problem #14:
--Write a query to display the supplier id, supplier name and email
--of the suppliers who are all having gmail account.
SELECT SUPPLIER_ID,SUPPLIER_NAME,EMAIL FROM LMS_SUPPLIERS_DETAILS WHERE EMAIL LIKE'%gmail.com';

--Problem#15:
--Write a query to display the supplier id, supplier name and contact details.
--Contact details can be either phone number or email or address with alias name “CONTACTDETAILS”. 
--If phone number is null then display email, even if email also null then display the address of 
--the supplier. Hint: Use Coalesce function. 

select Supplier_id,supplier_name,coalesce(contact_bigint,email,address) as contactdetails
from Lms_suppliers_details;
--Problem#16:
--Write a query to display the supplier id, supplier name and contact.  
--If phone number is null then display ‘No’ else display ‘Yes’ with alias name “PHONENUMAVAILABLE”.
--Hint: Use ISNULL.
select SUPPLIER_ID,SUPPLIER_NAME,
case when CONTACT_bigint is NULL then 'NO' when CONTACT_bigint is not null then 'YES' end as PHONE_NUM_AVAILABLE 
from LMS_SUPPLIERS_DETAILS;

--Problem#17:
--Write a query to display the member id, member name, 
--city and member status of members with the total fine paid by them with alias name “Fine”.
SELECT M.MEMBER_ID,M.MEMBER_NAME,M.CITY,M.MEMBERSHIP_STATUS,SUM(F.FINE_AMOUNT) FROM LMS_MEMBERS M
JOIN LMS_BOOK_ISSUE I ON M.MEMBER_ID = I.MEMBER_ID
JOIN LMS_FINE_DETAILS F ON f.fine_range=i.fine_range
GROUP BY M.MEMBER_ID,M.MEMBER_NAME,M.CITY,M.MEMBERSHIP_STATUS;

--Average Questions:
--Problem # 1:
--Write a query to display the member id, member name of the members,
--book code and book title of the books taken by them.
select m.member_id,m.member_name,d.book_code,d.book_title from lms_members m
inner join lms_book_issue i on m.member_id=i.member_id
inner join LMS_BOOK_DETAILS d on d.book_code = i.book_code; 

--Problem # 2:
--Write a query to display the total number of books available in 
--the library with alias name “NO_OF_BOOKS_AVAILABLE” (Which is not issued).
--Hint: The issued books details are available in the LMS_BOOK_ISSUE table. 
select count(d.book_code) as no_of_books_available from lms_book_details d 
left join lms_book_issue i on d.book_code = i.book_code 
where i.book_code is null;

--Problem # 3:
--Write a query to display the member id, member name, fine range and fine amount 
--of the members whose fine amount is less than 100. 

select m.member_id,m.member_name,f.fine_range,f.fine_amount from lms_members m
inner join LMS_BOOK_ISSUE i on m.member_id =i.member_id
inner join LMS_FINE_DETAILS f on f.fine_range =i.fine_range
where fine_amount < 100;

--Problem # 4:
--Write a query to display the book code, book title, publisher, edition,
--price and year of publication and sort based on year of publication, publisher and edition.

select d.book_code,d.book_title,d.publication,d.book_edition,d.price,d.publish_date 
from LMS_BOOK_DETAILS d
order by d.publish_date,d.publication,d.book_edition;

--Problem # 5:
--Write a query to display the book code, book title and rack number of 
--the books which are placed in rack 'A1' and sort by book title in ascending order. 
select book_code,book_title,rack_num from LMS_BOOK_DETAILS
where rack_num='A1' order by book_title;

--Problem # 6:
--Write a query to display the member id, member name, due date and date 
--returned of the members who has returned the books after the due date.
--Hint: Date_return is due date and Date_returned is actual book return date. 
select m.member_id,m.member_name,i.date_return,i.date_returned from lms_members m
inner join lms_book_issue i on m.member_id = i.member_id
where i.date_returned > date_return;

--Problem # 7:
--Write a query to display the member id, member name and date of registration
--who have not taken any book.
select m.member_id,m.member_name,m.date_register from lms_members m
left join lms_book_issue i on m.member_id =i.member_id
where i.book_code is null;

--Problem # 8:
--Write a Query to display the member id and member name of the members 
--who has not paid any fine in the year 2012.

select m.member_id,m.member_name from lms_members m
inner join lms_book_issue i on m.member_id=i.member_id
inner join lms_fine_details f on f.fine_range = i.fine_range
where f.fine_amount=0 and to_char(i.date_returned,'yy')='12';

--Problem # 9:
--Write a query to display the date on which the maximum numbers of books 
--were issued and the number of books issued with alias name “NOOFBOOKS”.
select date_issue,count(book_code)as noofbooks from lms_book_issue
group by date_issue
fetch first 1 row only;

--Problem # 10:
--Write a query to list the book title and supplier id for the books
--authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’. 
select book_title,supplier_id from lms_book_details
where author='HerbertSchildt' and book_edition=5 and supplier_id='s01';

--Problem # 11:
--Write a query to display the rack number and the number of books 
--in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.
select * from lms_members;
select * from lms_book_details;
select * from lms_book_issue;
select * from lms_fine_details;
select * from lms_suppliers_details;

--Problem # 12:
--Write a query to display book issue number, member name, date or registration,
--date of expiry, book title, category author, price, date of issue, date of return,
--actual returned date, issue status, fine amount. 

--Problem # 13:
--Write a query to display the book code, title, publish date of the books which is been
--published in the month of December. 


--Problem # 14:
--Write a query to display the book code, book title ,supplier name and price of the book
--witch takes maximum price based on each supplier.

--Problem # 15:
--
--Write a query to display book code, book name, and publisher, how old the book is.
--Sorted as older to newer.


select book_title from lms_book_details where supplier_id 
in 
(select supplier_id from lms_suppliers_details where supplier_name='KAVARI STORE')
group by book_title;



