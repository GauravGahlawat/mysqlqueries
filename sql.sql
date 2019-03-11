/*USE CLASSICMODELS;
select * from products;
select * from productlines;*/

use mysqljdbc;
select c.id,c.first_name,s.name "skill" from candidates c inner join skills s on c.id=s.id;

select * from candidates;



select c.id,c.first_name,s.name "skill" from candidates c left outer join skills s on c.id=s.id;


select c.id,c.first_name,s.name "skill" from candidates c right outer join skills s on c.id=s.id;




select c.id,c.first_name,c1.candidate_id,c1.skill_id,s.name "skill" from 
	candidates c join candidate_skills c1 on c.id=c1.candidate_id 
 	join skills s on s.id=c1.skill_id;
 	
 	
 	
select c.id,c.first_name,c1.skill_id from 
	candidates c right outer join candidate_skills c1 on c.id=c1.candidate_id ;
	
	
select c.id,c.first_name,c1.skill_id from 
	candidates c join candidate_skills c1 on c.id=c1.candidate_id ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
 	
 	
 	
 	
 	select c.id,c.first_name,c1.candidate_id,c1.skill_id,s.name "skill" from 
	candidates c left outer join candidate_skills c1 on c.id=c1.candidate_id 
 	left outer join skills s on s.id=c1.skill_id;
 	
 	
 	select c.id,c.first_name,c1.candidate_id,c1.skill_id,s.name "skill" from 
	candidates c right outer join candidate_skills c1 on c.id=c1.candidate_id 
 	right outer join skills s on s.id=c1.skill_id;

/* ************************************************************************* */
/*    I N D E X E S    */

use classicmodels;


select employeeNumber,lastName,firstName from employees where jobtitle = 'Sales Rep' ;



explain select employeeNumber,lastName,firstName from employees where jobtitle = 'Sales Rep' ;

create index jtIndx on employees(jobtitle);

show indexes from employees;



select * from employees;

explain select employeeNumber,lastName,firstName from employees 
	force index(jtIndx)	where jobtitle = 'Sales Rep' ;
show indexes from employees;


/* P R O C E D U R E S */

create procedure GetAllProducts()
		select * from products;

call GetAllProducts();


create procedure CountEmployee()
	select count(*) from employees;
	
	call CountEmployee;
	
	/*     DECLARING A VARIABLE  */
	
	set @A=10;
	select @A;
		
	create procedure GetOfficeByCountry (IN cn VARCHAR(255))
		select * from offices where country=cn;
		
	call GetOfficeByCountry('USA');   -- you can call it from new window too 

create procedure CountEmp(IN cn VARCHAR(255))
	select count(*) 'No. Of Employees ' from employees e join offices o on 
		e.officeCode=o.officeCode where o.country=cn;
	
	call CountEmp('JAPAN');


create procedure CountOrderByStatus(IN os varchar(255), OUT total int)
		select count(ordernumber) into total from orders
		where status=os;
		
		call CountOrderByStatus('Shipped',@total);
		select @total;
		
		
		call CountOrderByStatus('Cancelled',@total);
		select @total;


/*   function to find square of a number */

 create function test(A int) returns int
 	return A*A
 	
 	select test(20)
 	
create function CustomerLevel(pc double) returns varchar(10)
	if (pc > 50000) then
			return 'PLATINUM';
	elseif( pc <= 50000 AND pc >=10000) then
			return 'GOLD';
	elseif( pc < 10000) then
			return 'SILVER';
	end if;
			

create table employees_audit(
	id int auto_increment primary key,
	employeenumber int not null,
	lastname varchar(50) not null,
	changedat datetime default null,
	action varchar(50) default null);
	
	create trigger before_employee_update
		before update on employees
			for each row
				insert into employees_audit set action='update',
				employeenumber=OLD.employeenumber,
				lastname=OLD.LASTNAME,
				changedat=NOW();
				
				
				show triggers;
				
				update employees set lastname='Raj' where employeenumber=1056;
				update employees set lastname='Raj' where employeenumber=1702;
				
				

/*SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
        INNER JOIN
    productlines t2 ON t1.productline = t2.productline;
    
SELECT 
    productCode, 
    productName 
FROM
    products ;	
    
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
   LEFT OUTER JOIN
    productlines t2 ON t1.productline = t2.productline;*/
    
    
