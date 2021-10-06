/**
 Agenda de Contatos
 @autor Marcelo Faquim Dos Anjos
*/
-- exibir banco de dados do servidor

show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbteste;
-- selecionar o banco de dados
use dbagenda;


-- verificar tabelas existentes
show tables;

-- criando uma tabela
-- Toda tabela precisa ter uma chave primaria (PK)
-- int (tipo de dados números inteiros)
-- primary key -> transforma este campo em chave primaria
-- auto_increment -> númeração automatica 
-- varchar -> tipo de dados equivalente a Strin. (50 é o tamanho maximo de caractere)
-- not null -> preenchimento obrigatorio
-- unique -> não permite valores repitidos na tabela.

create table contatos(
id int primary key auto_increment,
nome varchar(50) not null,
fone varchar(15) not null,
email varchar(50) unique
);

-- descrição da tabela
describe contatos;

-- alterar o nome do campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo a tabela
-- add column -> criar uma coluna
-- alter table -> alterar coluna
alter table contatos add column obs varchar(250);


-- adicionar um novo campo (coluna) em um local especifico da tabela
alter table contatos add column fone2 varchar(15) after fone;


-- modificar tipos de dados e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir a coluna da tabela
alter table contatos drop column obs;

-- excluir a tabela
-- drop table contatos;

-- Crud ( create read update delete)
-- operações basicas do banco de dados
insert into contatos(nome,fone,email)
values (' Marcelo Faquim ','4002-8922 ','marcelo@email.com');

insert into contatos(nome,fone,email)
values (' Monica Faquim ','3332-8922 ','monicafaquim@email.com');

insert into contatos(nome,fone,email)
values (' Marcelo Anjos ','98934-8922 ','marceloanjos@email.com');

insert into contatos(nome,fone,email)
values (' Iohanes ','1528-8924 ','iohanes@email.com');

insert into contatos(nome,fone,email)
values (' Maithe Faquim ','1515-2826 ','maithezinha@email.com');

insert into contatos(nome,fone,email)
values (' Heitor Faquim ','2625-4589 ','heitor@email.com');

insert into contatos(nome,fone)
values (' Janaina ','2455-8755');


-- CRUD Read
-- selecionar todos os registros(dados) da tabela
select *from contatos;

-- selecionar colunas especificas da tabela
select nome,fone from contatos;

-- selecionar colunas em ordem alfabeticas ou numericas ( crescente ou decrescente)
select *from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id = 1;
select * from contatos where nome = ' Marcelo Faquim ';
select * from contatos where nome like ' M% ';

-- Crud Update
-- Atenção! Não esqueça do where e usar sempre o id para evitar problemas 
update contatos set email='marcelo@email.com' where id = 1; 
update contatos set nome='Marcelo Faquim', fone='94599-2388',email='marcelofaquim0@gmail.com' where id=1;
update contatos set nome='Monica Faquim', fone='99357-2178',email='monicafaquim0@gmail.com' where id=7;
update contatos set nome='Marcelo Anjos', fone='98934-2458',email='marceloanjos0@gmail.com' where id=6;
update contatos set nome='Iohanes Nascimento', fone='9900-1520',email='ioohpermerelly0@gmail.com' where id=5;
update contatos set nome='Maithe Faquim', fone='9890-9856',email='maithezinhatrecho@gmail.com' where id=4;
update contatos set nome='Heitor Faquim', fone='92566-4025',email='heitorchorao@gmail.com' where id=3;

-- Crud Delete
-- Atenção! Sempre usar o where
delete from contatos where id=2;


