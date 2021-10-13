/**
 Sistema para uma gestão de uma assistencia tecnica de computadores e perifericos
 @autor Marcelo Faquim Dos Anjos
*/

create database dbinfox;
use dbinfox;


create table usuarios(
id int primary key auto_increment,
usuario varchar(50) not null,
login varchar(50) not null unique,
senha varchar(250)not null,
perfil varchar(50) not null
);

describe usuarios;

-- A linha abaixo insere uma senha com criptografia
-- Md5 -> criptografa as senhas
insert into usuarios(usuario,login,senha,perfil)
values('Marcelo Faquim','admin',md5('123456'),'administrador');

insert into usuarios(usuario,login,senha,perfil)
values('Heitor Anjos', 'Heitor',md5('123'),'operador');

select *from usuarios;
select *from usuarios where id=1;

-- selecionando o usuario e sua senha(tela de login)
select* from usuarios where login='admin' and senha=md5('123456');

update usuarios set usuario='Heitor Anjos', login='Heitor Anjos', senha=md5('123'),perfil='operador' where id=2;

delete from usuarios where id=3;


-- char -> tipo de dados que aceita uma string de caracteres não variaveis
create table clientes(
idcli int primary key auto_increment,
nome varchar(50) not null,
cep char(8),
endereço varchar(50) not null,
numero varchar(12) not null,
complemento varchar(30),
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null,
fone varchar(15) not null
);

select *from clientes;

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values ('Maithe Faquim','03043070','R.Domingos Paiva', '206','apto 409B','Brás','São Paulo','SP','945992386');

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values ('Monica Faquim','01224010','R.Martinico Prado', '361','apto 23','Vila Buarque','São Paulo','SP','4002-8922');

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values ('Marcelo Anjos','03043070','R.Domingos Paiva', '206','apto 409B','Brás','São Paulo','SP','945992386');

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values ('Iohanes','02675031','Praça Benedito Durval Pestana Barbosa','2215','cj 245','Barra Funda','São Paulo','SP','945992386');

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values ('Ronaldinha Bruxo','02090900','R.Tuiuti', '2006','apto 1010','Tatuapé','São Paulo','SP','9954660');

delete from clientes where idcli=3;
delete from clientes where idcli=5;
delete from clientes where idcli=2;

-- CRIANDO TABELA DE ORDEM DE SERVIÇO
-- Foreign Key (Fk) cria um relacionamento de 1 para muitos (clientes - tbos)

create table tbos(
os int primary key auto_increment,
dataos timestamp default current_timestamp,
tipo varchar(20) not null,
statusos varchar(30) not null,
equipamento varchar(200) not null,
defeito varchar(200)not null,
tecnico varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);

describe tbos;

insert into tbos
(tipo,statusos,equipamento,defeito,idcli)
values
('orçamento','bancada','Notebook Levono G90','Não Liga',1);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('orçamento','Aguardando a Aprovação','Impressora HP L300','Papel enroscado','Marcelo','60',1);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('orçamento','Aguardando a Aprovação','Notebook Samsung Core i3 G4','Colocar SSD','Marcelo','150',1);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('Serviço','Retirado','Notebook Dell','Formatação do Windows','Heitor','100',4);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('Serviço','Retirado','PC Acer','Montagem de Computador','Heitor','2500',6);

select *from tbos;

-- (inner join) União de tabelas para consultas e updates
-- relatorio 1
select * from tbos inner join clientes
on tbos.idcli = clientes.idcli;

-- relatorio 2 
select tbos.equipamento, tbos.defeito,tbos.statusos as stautus_os,tbos.valor,clientes.nome,clientes.fone from tbos inner join clientes on tbos.idcli = 
clientes.idcli where statusos = 'aguardando a aprovação';

-- relatorio 3
select tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i') as data_os, tbos.equipamento,tbos.defeito,tbos.valor,clientes.nome as cliente
from tbos inner join clientes on tbos.idcli = clientes.idcli where statusos = 'retirado';

-- relatorio 4
select sum(valor) as faturamento from tbos where statusos = 'retirado';






