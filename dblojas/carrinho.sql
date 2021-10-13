/**
	E-Commerce 
 @autor Marcelo Faquim Dos Anjos
*/

-- Exibir carrinho de compras

show databases;

create database dbloja;
use dbloja;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) unique not null,
    senha varchar(250) not null
    );
    
    insert into clientes(nome,email,senha)
    values
    ('Marcelo Faquim', 'marcelo@email.com',md5('123456'));
    
    select *from clientes;
    
    describe clientes;
    
    -- timestamp default current_timestamp ( data e hora automatico)
-- ( tipo de dados relacionados a data) yyyy/mm/dd
create table produtos(
codigo int primary key auto_increment,
barcode varchar(50) unique,
produto varchar(100) not null,
fabricante varchar(100) not null,
datacad timestamp default current_timestamp,
dataval date not null,
estoque int not null,
estoquemin int not null,
medida varchar(50) not null,
valor decimal(10,2),
loc varchar(100)
);

describe produtos;


insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Caneta Bic azul', 'Bic',20221005,100,10,'CX',28.75,'setor A p2');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('GABINETE GAMER PICHAU POUTER','Pichau',20311005,1,1,'UN',269.90,'setor G p4');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Mouse Pad Gamer Borda Costurada','MB Tech',20260511,1,1,'UN',35.19,'setor M p5');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Cola Bastão','Pritt',20200102,1,1,'UN',2.99,'setor T p1');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Barra de chocolate','Alpino',20190102,1,1,'UN',3.99,'setor T p1');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Pepsi','Coca-Cola',20211002,4,6,'UN',1.99,'setor T p6');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Batata','Ruffle',20211025,5,6,'UN',4.19,'setor T p6');


select * from produtos;

-- Inventario de estoque (TOTAL)

select sum(estoque*valor) as total from produtos;

-- Relatorio de reposição do estoque 1
select *from produtos where estoque < estoquemin;

-- Relatorio de reposição do estoque 2
-- date_format() -. formatar a exibição da data
-- %d (dia) %m (mês) %y ( ano 2 digitos) %Y ( ano 4 digitos)
select codigo as código, produto,date_format(dataval,'%d/%m/%Y') as data_validade, estoque, estoquemin as estoque_mínimo from produtos where
estoque < estoquemin;

-- Relatorio de validade dos produtos 1
select codigo,produto,date_format(dataval,'%d/%m/%Y') as data_validade from produtos;

-- Relatorio de Validade dos produtos 2
-- DateDiff() retorna a diferencia em dias de duas datas
-- curdate() data atual
select codigo as códigos, produto, date_format(dataval,'%d/%m/%Y') as data_validade, datediff(dataval,curdate()) as dias_restantes from produtos;

create table pedidos(
pedido int primary key auto_increment,
datapedido timestamp default current_timestamp,
total decimal(10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);

describe pedidos;

insert into pedidos(idcli) 
values(1);

select *from pedidos;

-- Abertura do pedido
select pedidos.pedido,
date_format(pedidos.datapedido,'%d/%m/%y - %H:%i') as data_pedido, clientes.nome as Cliente, clientes.email as E_mail from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;

create table carrinhos (
	pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key (pedido) references pedidos(pedido),
	foreign key (codigo) references produtos(codigo)
    );
    
    select * from carrinhos;
    
    insert into carrinhos (pedido,codigo,quantidade)
    values(1,1,10);
    
    insert into carrinhos (pedido,codigo,quantidade)
    values(1,2,5);
    
    -- exibir o carrinho
    select	
    pedidos.pedido,
    carrinhos.codigo as código,
    produtos.produto,
    carrinhos.quantidade,
    produtos.valor,
    produtos.valor * carrinhos.quantidade as sub_total
    from (carrinhos inner join pedidos on carrinhos.pedido = pedidos.pedido)
    inner join produtos on carrinhos.codigo =  produtos.codigo;
    
    -- total do carrinho
    select sum(produtos.valor * carrinhos.quantidade) as total
    from carrinhos inner join produtos on carrinhos.codigo =  produtos.codigo;
    
    -- atualizar o banco de dados após o fechamento do pedido
    update carrinhos
    inner join produtos
    on carrinhos.codigo = produtos.codigo
    set produtos.estoque = produtos.estoque - carrinhos.quantidade
    where carrinhos.quantidade >0;
    
    
    
    



