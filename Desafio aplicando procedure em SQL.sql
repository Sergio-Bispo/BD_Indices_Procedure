use company_constraints;
select * from employee;
select * from departament;

create table dpto (
id int auto_increment primary key,
Dname varchar (20) not null unique,
Dnumber varchar (2) not null,
Mgr_ssn varchar (9) not null,
Dept_create_date datetime
);

delimiter $$
create procedure info_employee()
begin
   select * from employee inner join departament on Ssn = Mgr_ssn;
end $$
delimiter ;
select * from employee;

call insert_into_employee_proc( 
'Felipe', 'B', 'Teixeira', '123808249', '1991-08-20', '731-Fondren-Houston-Tx', 'M', '40000.00', '123456789', '4');

delimiter \\

create procedure insert_into_departament_proc(
in Dname_p varchar (20),
in Dnumber_p varchar (10),
in Mgr_ssn_p int,
in Dept_create_date_p date
)
begin
INSERT INTO departament (Dname, Dnumber, Mgr_ssn, Dept_create_date)
values(Dname_p, Dnumber_p, Mgr_ssn_p, Dept_create_date_p);

end \\

delimiter ;

call insert_into_departament_proc('Alicia-Admin', '567456789','987654321','1997-07-10');

delimiter \\

      -- retorno do registro persistido na procedure
      -- select 'Inserção bem sucedida' as message;
      
create procedure insert_into_departament_proc(
in Dname_p varchar (20),
in Dnumber_p varchar (10),
in Mgr_ssn_p int,
in Dept_create_date_p date
)
begin

 if length(Dept_create_date_p) != 10  then
         INSERT INTO dpto (Dname, Dnumber, Mgr_ssn, Dept_create_date)
         select * from departament;
         ELSE
         select 'Forneça uma data no formato válido (YYYY-MM-DD)' as message_error;
        END IF;
END \\ 

delimiter ;
      
call insert_into_departament_proc('Dname', '333445555', '1234567894', '1990-09-15');
select md5('1995-09-10') as Dept_create_date;





	