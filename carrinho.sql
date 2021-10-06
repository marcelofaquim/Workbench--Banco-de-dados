/**
Carrinho de Compras
 @autor Marcelo Faquim Dos Anjos
*/

-- Exibir carrinho de compras

show databases;
create database carrinho;
use carrinho;

show tables;

create table carrinhos(
codigos int primary key auto_increment,
produto varchar(80) not null,
quantidade varchar(15) not null,
valor varchar(15) not null
);

describe carrinhos;

alter table carrinhos modify column valor decimal(10,2) not null;

alter table carrinhos modify column quantidade int not null;
alter table carrinhos modify column produto varchar(250) not null;

-- Crude Create
insert into carrinhos (produto,quantidade,valor)
values('Caneta Bic CX30',10,17.50);

insert into carrinhos (produto,quantidade,valor)
values('Carrinho de controle remoto',1,170.50);

insert into carrinhos (produto,quantidade,valor)
values('Mouse Pad cx 15',10,27.50);

insert into carrinhos (produto,quantidade,valor)
values('Teclado',1,32.10);

insert into carrinhos (produto,quantidade,valor)
values('Monitor',1,150.20);

insert into carrinhos (produto,quantidade,valor)
values('Gabinete Led ',1,350.60);

select * from carrinhos;

-- excluir a tabela
drop table carrinho;

-- Operações matematicas no banco de dados
-- sum -> Soma
-- as -> campo de apelido
select sum(valor*quantidade) as total from carrinhos;
