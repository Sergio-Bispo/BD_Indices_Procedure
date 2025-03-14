create database if not exists customer_departament;
use customer_departament;

create table if not exists customer (
id_Dname int auto_increment primary key,
customer_Dnumber int not null,
ativo boolean default true,
Mgr_ssn char(9) not null,
Mgr_start_date date,
Dept_create_date date
)engine = MEMORY;

create index idx_hash_ativo on customer (ativo) using hash;

 







                  
  
