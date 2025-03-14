create database if not exists universidade;
use universidade;

create table estudante(
id_estudante int auto_increment primary key,
Nome varchar (30) not null,
Matricula int not null,
Telefone char (9),
Curso varchar (15) not null,
Disciplina int not null 
);

delimiter %
create procedure insert_into_estudante_proc(
in Nome_p varchar (30), 
in Matricula_p int, 
in Telefone_p char (9), 
in Curso_p varchar(15), 
in Disciplina_p int)
begin
                   
insert into estudante (Nome, Matricula, Telefone, Curso, Disciplina) 
		values(Nome_p, Matricula_p, Telefone_p, Curso_p, Disciplina_p);
      
      -- retorno do registro persistido na procedure
      -- select 'Inserção bem sucedida' as message;
	      
end %
delimiter ;

show tables;

delimiter $$
create procedure info_estudante()
begin
   select * from info_estudante inner join estudante on Nome = Curso;
end $$
delimiter ;
   select * from estudante;

call insert_into_estudante_proc('Roberta', '2', '125808249', 'Medicina', '11');

create table user_messages(
    id int auto_increment primary key,
    message varchar (100),
    curso varchar (15)
);

delimiter //
create trigger null_value_check after insert on estudante
for each row
     if (new.Nome is null) then
         insert into user_messages (message, curso) values (concat('Update your nome, please ', new.Disciplina), new.Curso);
     --  else
     --  insert into user_messages (message, curso) values (concat('error ', new.Disciplina), new.Curso);
     end if;
end //
delimiter ;

insert into estudante (Nome, Matricula, Telefone, Curso, Disciplina) 
		values ('Fernando', '5', '823489858', 'Licenciatura', '22' );

