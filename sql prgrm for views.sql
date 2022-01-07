select *from customers;
select*from payments;

create view customerpayments as

select customers.customername,customers.customernumber,payments.checknumber,payments.paymentdate,payments.amount from customers
inner join payments on customers.customernumber = payments.customernumber;

select *from customerpayments;

select customername,checknumber from customerpayments;

create view orderstotal as

select ordernumber,(quantityordered*priceeach) as total from orderdetails
group by ordernumber
order by total;

select * from orderstotal;

select * from orderstotal where total > 6000;

create  view customersorders as

select ordernumber,customernumber,customername,sum(quantityordered*priceeach) as total from orders o
inner join customers c on c.customernumber = o.customernumber
group by ordernumber
order by total;

create view orderjoins as

select R.ORDERNUMBER,R.STATUS,SUM(QUANTITYORDERED*PRICEEACH) AS TOTAL FROM ORDERS R 
INNER JOIN
ORDERDETAILS R1 ON R.ORDERNUMBER = R1.ORDERNUMBER;


create view subquerybuyprice as

select productcode,productname,buyprice from products 
where buyprice >
(select avg(buyprice) from products)
order by buyprice desc;

create view officeinfo as
select officecode,city,phone from offices;

select * from officeinfo;
 update officeinfo
 set
 phone='5874962158'
where officecode = 4;

select * from officeinfo where officecode = 4;

update officeinfo
set
city = 'jangoan'
where officecode = 5;

select * from officeinfo where officecode = '5';

delete from officeinfo where officecode = '4';

delete from oragnization where sid=1;
rollback;

alter algorithm=merge view orderjoins as

select R.ORDERNUMBER,customernumber,PRODUCTCODE,R.STATUS,SUM(QUANTITYORDERED*PRICEEACH) AS TOTAL FROM ORDERS R 
INNER JOIN
ORDERDETAILS R1 ON R.ORDERNUMBER = R1.ORDERNUMBER;

SELECT * FROM ORDERJOINS;


RENAME TABLE ORDERJOINS TO SALESORDERS;
CREATE VIEW VPS AS
SELECT 
        employeeNumber,
        lastname,
        firstname,
        jobtitle,
        extension,
        email,
        officeCode,
        reportsTo
    FROM
        employees
    WHERE
        jobTitle LIKE '%VP%';

INSERT INTO vps1(
    employeeNumber,
    firstName,
    lastName,
    jobTitle,
    extension,
    email,
    officeCode,
    reportsTo
) 
VALUES(
    1791,
    'Lily',
    'Bush',
    'VPP MARKETING',
    'x9111',
    'lilybush@classicmodelcars.com',
    1,
    1002
);


SELECT * FROM VPS1;

SELECT * FROM EMPLOYEES   ORDER BY EMPLOYEENUMBER DESC ;

CREATE VIEW VPS1 AS

SELECT 
        employeeNumber,
        lastname,
        firstname,
        jobtitle,
        extension,
        email,
        officeCode,
        reportsTo
    FROM
        employees
    WHERE
        jobTitle LIKE '%VP%'
WITH CHECK OPTION;

DROP VIEW VPS;