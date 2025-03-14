create database if not exists departament;
use departament;

create table departament(
id INT primary key,
Dname VARCHAR (45),
Pno INT not null,
Dnumber INT not null,
Dlocation VARCHAR (15) not null
);
        
 insert into departament (id, Dname, Pno, Dnumber, Dlocation) 
             values (1,'Franklin-Research','30','333445555','Houston'),                               
					(2,'Alicia-Administration','30','987654321','Stafford'),
					(3,'James-Headquarters' ,'20', '888665555','Bellaire');
                    
CREATE TABLE departament_v2 (
 departament_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  store_id TINYINT UNSIGNED NOT NULL,
  first_name VARCHAR (45) NOT NULL,
  last_name VARCHAR (45) NOT NULL,
  Dname VARCHAR (50) DEFAULT NULL,
  Dlocation_id SMALLINT UNSIGNED  NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  primary key (departament_id),
  key idx_fk_store_id (store_id),
  key idx_fk_dlacation_id (dlocation_id),
  key idx_fk_last_name (last_name)
  );
  
   
alter table departament.departament_v2 add index active_departaments_index (active);
                   
 CREATE TABLE departament_v3 (
 departament_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  store_id TINYINT UNSIGNED NOT NULL,
  first_name VARCHAR (45) NOT NULL,
  last_name VARCHAR (45) NOT NULL,
  Dname VARCHAR (50) DEFAULT NULL,
  Dlocation_id SMALLINT UNSIGNED  NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  primary key (departament_id),
  key idx_fk_store_id (store_id),
  key idx_fk_dlacation_id (dlocation_id),
  key idx_fk_last_name (last_name)
  ) engine = MEMORY;

  create index idx_hash_ativo on departament_v3 (ativo) using hash;
  create index idx_btree_id on departament_v3 (id) using Btree;
  
  