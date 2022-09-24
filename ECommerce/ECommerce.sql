-- Criação do banco de dados E-Commerce
create database ecommerce;
use ecommerce;

-- CLIENTE --
select * from cliente;
create table cliente (
        idCliente int auto_increment primary key,
        nome varchar(45),
        cpf char(11),
        cnpj char(15),
        endereco varchar(30),
        dtNascimento Date,        
        constraint unique_cpf_client unique (cpf),
        constraint unique_cnpj_client unique (cnpj)
);
insert into cliente (nome,cpf,endereco,dtNascimento) values ('João de Deus','12345678932','Rua das Flores 90','1990-02-01'),
										  ('Roberto Pires','23456789322','Rua das Amarguras 234','1971-04-01'),
										  ('Marcelo Vasconcelos','34567892098','Rua das Tulips 190','1990-03-12'),
										  ('Carlos da Silva','45678930882','Rua Gavião Neto 2233','1990-12-07'),
										  ('Raimundo de Sousa','5678939876','Rua Carioca Araujo 223','1990-08-31');

-- PESSOA --
select * from pessoa;
create table pessoa (
		idPessoa int auto_increment primary key,
        idCliente int not null,
        tipo ENUM('PJ','PF'),
        telefone char(11),
        constraint fk_pessoa_cliente foreign key (idCliente) references cliente(idCliente)
);
insert into pessoa (idcliente,tipo,telefone) values (1,'PF','86908760987'),
													(2,'PF','86998768937'),
                                                    (3,'PF','86997767947'),
                                                    (4,'PF','86988766957'),
                                                    (5,'PF','86981580347'),
                                                    (6,'PJ','86993460281');

-- PRODUTO --
select * from produto;
create table produto (
        idProduto int auto_increment primary key,
        categoria ENUM('Eletrônico', 'Eletrodoméstico', 'Roupa', 'Brinquedo'),
        descricao varchar(50) not null,
        valor Float default 0
);
insert into produto (categoria,descricao,valor) values ('Eletrônico','SSD 1TB', 328),
													   ('Eletrônico','Monitor Wide', 1020),
                                                       ('Eletrônico','Teclado gamer', 231),
                                                       ('Eletrônico','Memória ram 32gb DDR4', 350),
                                                       ('Eletrônico','Placa de video RX-3060 6gb', 2340),
                                                       ('Eletrodoméstico','Ventilador 60cm', 240),
                                                       ('Eletrodoméstico','Forno Microondas', 450),
                                                       ('Eletrodoméstico','Geladeira FostFree', 1890),
                                                       ('Roupa','Camisa Masculina', 40),
                                                       ('Roupa','Short Masculina', 35),
                                                       ('Roupa','Camisa Feminina', 80),
                                                       ('Roupa','Calça Feminina', 200),
                                                       ('Brinquedo','Carrinho controle remoto', 200),
                                                       ('Brinquedo','Boneca Barbie', 160),
                                                       ('Brinquedo','Trator de esteira', 80);

-- PEDIDO --
select * from pedido;
create table pedido (
        idPedido int auto_increment primary key,
        statusPedido ENUM('Processando', 'Enviado', 'Entregue', 'Devolvido') default 'Processando',
        descricao varchar(45),
        valorFrete float,
        codigoRastreio varchar(15),
        idCliente int,
        constraint fk_pedido_cliente foreign key (idCliente) references cliente(idCliente)
        
);

insert into pedido (descricao, valorFrete, codigoRastreio, idCliente) values ('Eletrônico',59,'LT45TB',1,200),
																			 ('Eletrodoméstico',101,'TT4987B',2,430),
                                                                             ('Roupa',28,'XCCPP2883BR',3,550),
                                                                             ('Brinquedo',12,'ZXC0920398',4,320),
                                                                             ('Eletrodoméstico',0,null,5,110);

-- PAGAMENTO --
select * from pagamento;
create table pagamento (
        idPagamento int auto_increment primary key,
        idPedido int,
        forma ENUM('Dinheiro', 'Cartão', 'Pix'),
        dadosPagamento varchar(45),
        valor float,
        constraint fk_pedido_pagamento foreign key (idPedido) references pedido(idPedido)
);
insert into pagamento (idPedido,forma,dadosPagamento,valor) values (6,'Dinheiro',null,290),
																   (7,'Pix','numero deo telefone',551),
                                                                   (8,'Pix','cpf',458),
                                                                   (9,'Dinheiro',null,212),
                                                                   (10,'Cartão','1234 9872 0929 2093',1890);

-- ESTOQUE --
select * from estoque;
create table estoque (
        idEstoque int auto_increment primary key,
        local varchar(255)
);
insert into estoque (local) values ('Setor de Eletrônicos'),
								   ('Setor de Eletrodomésticos'),
								   ('Armarinho'),
								   ('Almoxarifado');

-- FORNECEDOR --
select * from fornecedor;
create table fornecedor (
        idFornecedor int auto_increment primary key,
        razaoSocial varchar(100) not null,
        nomeFantasia varchar(100) not null,
        cnpj char(15) not null,
        constraint unique_fornecedor unique (cnpj)
);
insert into fornecedor (razaoSocial,nomeFantasia,cnpj) values ('Fornecedor 1','Fantasia 1','839059873459872'),
															  ('Fornecedor 2','Fantasia 2','109053473459583'),
                                                              ('Fornecedor 3','Fantasia 3','564053453445612');

-- VENDEDOR --
select * from vendedor;
create table vendedor (
        idVendedor int auto_increment primary key,
        razaoSocial varchar(100),
        nomeFantasia varchar(100),
        nomeVendendor varchar(100),
        cnpj char(15),
        cpf char(9),
        constraint unique_vendedor_cnpj unique (cnpj),
        constraint unique_vendedor_cpf unique (cpf)
);
insert into vendedor (razaoSocial,nomeFantasia,nomeVendendor,cnpj,cpf) values (null,null,'Andre Bevilaqua',null,'09876543212'),
																     (null,null,'Sergio Nobre',null,'06445343452'),
                                                                     ('AKML Freitas Ltda','Casas dos Freitas',null,'223456543212765',null),
                                                                     ('MDL de Consumo Ltda','Atacadão dos Eletros',null,'456565432384509',null);

-- PRODUTO VENDEDOR --
select * from produtoVendedor;
create table produtoVendedor (
        idProduto int,
        idVendedor int,
        quantidade int,
        primary key (idProduto,idVendedor),
        constraint fk_produto_vendedor foreign key (idVendedor) references vendedor(idVendedor),
        constraint fk_produtoVendedor_produto foreign key (idProduto) references produto(idProduto)
);
insert into produtoVendedor (idProduto,idVendedor,quantidade) values (1,1,100),(2,2,200),(3,3,333),(4,4,32),(5,1,45),(6,2,70),(7,3,17),(8,4,345),(9,1,376),(10,2,978),(11,3,32),(12,4,46),(14,2,54),(15,3,32),(1,4,45),(2,1,54),(4,3,13),(6,1,46),(8,3,435),(9,4,345),(10,1,756),(11,2,57),(12,3,75),(13,4,345),(15,4,21),(2,3,66),(3,2,89),(4,1,95),(5,4,45),(6,3,33),(7,2,345),(8,1,77),(9,2,98),(10,3,669),(11,4,6),(13,3,43),(15,1,89);     

-- PRODUTO PEDIDO --
select * from produtoPedido;
create table produtoPedido (
        idProduto int,
        idPedido int,
        quantidade int,
        status ENUM('disponível', 'indisponível') default 'disponível',
        primary key (idProduto,idPedido),
        constraint fk_produto_produto foreign key (idProduto) references produto(idProduto),
        constraint fk_produto_pedido foreign key (idPedido) references pedido(idPedido)
);
insert into produtoPedido (idProduto,idPedido,quantidade) values (3,6,1),(7,7,1),(9,8,2),(10,8,2),(11,8,1),(12,8,1),(13,9,1),(8,10,1);

-- PRODUTO ESTOQUE --
select * from produtoEstoque;
create table produtoEstoque (
        idProduto int,
        idEstoque int,
        quantidade int default 0,
        primary key (idProduto,idEstoque),
        constraint fk_produtoEstoque_produto foreign key (idProduto) references produto(idProduto),
        constraint fk_produtoEstoque_estoque foreign key (idEstoque) references estoque(idEstoque)
);
insert into produtoEstoque (idProduto,idEstoque,quantidade) values (1,1,15),(2,1,10),(3,1,50),(4,1,30),(5,1,12),(6,2,200),(7,2,90),(8,2,70),(9,3,1045),(10,3,1340),(11,3,2040),(12,3,2240),(13,4,540),(14,4,670),(15,4,890);

-- PRODUTO FORNECEDOR --
select * from produtoFornecedor;
create table produtoFornecedor (
        idProduto int,
        idFornecedor int,
        local varchar(255),
        primary key (idProduto,idFornecedor),
        constraint fk_produtoFornecedor_produto foreign key (idProduto) references produto(idProduto),
        constraint fk_produtoFornecedor_fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor)
);
insert into produtoFornecedor (idProduto,idFornecedor,local) values (1,3,'São Paulo'),
																    (2,3,'São Paulo'),
                                                                    (3,3,'São Paulo'),
                                                                    (4,3,'São Paulo'),
                                                                    (5,3,'São Paulo'),
                                                                    (6,1,'Manaus'),
                                                                    (7,1,'Manaus'),
                                                                    (8,1,'Manaus'),
                                                                    (9,2,'Minas Gerais'),
                                                                    (10,2,'Minas Gerais'),
                                                                    (11,2,'Minas Gerais'),
                                                                    (12,2,'Minas Gerais'),
                                                                    (13,1,'Recife'),
                                                                    (14,1,'Recife'),
                                                                    (15,1,'Recife');


commit;



-- SELEÇÕES --

-- Seleção dos dados do cliente com informações das tabelas "cliente" e "pessoa"
select c.nome, p.telefone, p.tipo from cliente c, pessoa p where c.idCliente = p.idCliente;
select descricao, valor from produto order by valor;

-- Seleção de todos os clientes PJ
select c.nome, p.telefone, p.tipo from cliente c, pessoa p where c.idCliente = p.idCliente and tipo = 'PJ';
-- Seleção de pedidos com pagamentos igual ou acima de R$ 500
select pe.idPedido, pe.descricao, pa.forma, pa.valor from pedido pe, pagamento pa where pe.idPedido = pa.idPedido and valor >= 500 ;

-- Valor do pedido frete + valor do pedido 
select idPedido, statusPedido, descricao, (valorFrete + valorPedido) valorTotal from pedido pe;
-- Pagamentos ordenados do maior para o menor valor.
select idPedido, forma, valor from pagamento order by valor desc;

-- Valor total de pedidos por status 'Processando' e 'Enviado'
select statusPedido, sum(valorFrete+valorPedido) valorTotal from pedido group by statusPedido having statusPedido in ('Processando','Enviado');

-- Estoque dos produtos
select pr.descricao, pe.quantidade, e.local
from produto pr 
    inner join produtoEstoque pe on pr.idProduto = pe.idProduto
  	inner join estoque e on pe.idEstoque = e.idEstoque
order by local;


