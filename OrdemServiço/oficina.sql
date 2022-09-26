-- Criação do banco de dados E-Commerce
create database oficina;
use oficina;

-- EQUIPE --
create table equipe (
     idEquipe int auto_increment primary key,
     nome varchar(45)
);
select * from equipe;
insert into equipe (nome) values ('Equipe 1'),('Equipe 2'),('Equipe 3');commit;

-- MECANICO --
create table mecanico (
     idMecanico int auto_increment primary key,
     nome varchar(45) not null,
     endereco varchar(45),
     especialidade varchar(45),
     telefone char(11),
     idEquipe int,
     constraint fk_mecanico_equipe foreign key (idEquipe) references equipe(idEquipe)
);
select * from mecanico;
insert into mecanico (nome,endereco,especialidade,telefone,idEquipe) values ('João de Deus','Rua das Flores 90','Motor','86909879876',1),
																			('Roberto Pires','Rua das Amarguras 234','Suspensão','86987642536',1),
																			('Marcelo Vasconcelos','Rua das Tulipas 190','Eletromecânico','86987123546',2),
																			('Carlos da Silva','Rua Gavião Neto 2233','Lataria e Funilaria','86999546753',3),
																			('Raimundo de Sousa','Rua Carioca Araujo 223','Ar-condicionado','86999957639',2),
																			('Henrique Araújo Lima','Jardins das Matas 1235','Pintura','86986757543',3);

-- VEICULO --
create table veiculo (
     idVeiculo int auto_increment primary key,
     proprietrario varchar(45),
     telefone char(11),
     marca varchar(45),
     modelo varchar(45),
     ano int,
     cpf char(11),
     idEquipe int,
     constraint unique_cpf_client unique (cpf),
     constraint fk_veiculo_equipe foreign key (idEquipe) references equipe(idEquipe)
);
select * from veiculo;
insert into veiculo (proprietrario,telefone,marca,modelo,ano,cpf,idEquipe) values ('Manuel Aquino','86987651234','Volksvagem','Gol',2012,'09812342342',1),
																				  ('Romário Soares','86983911874','Fiat','Siena',2017,'12342342342',2),
                                                                                  ('Marcelo Augusto','86974852309','Renault','Logan',2019,'87231234102',1),
                                                                                  ('Antônio Carlos','86919236574','Citroen','C4 Pallas',2012,'91234273412',3),
                                                                                  ('Carlos Magno','86928437374','Citroen','C3 Cactus',2015,'12384554901',2),
                                                                                  ('Maria Cristina','86998737374','Fiat','Argo',2020,'92833462129',1);

-- ORDEM DE SERVIÇO --
create table ordemServico (
     idOrdem int auto_increment primary key,
     dataEmissao date,
     valor float,
     dataEntrega date,
     status ENUM('Recebido','Aguardando peça','Aguadando pagamento','Entregue') default 'Recebido',
     idVeiculo int not null,
     idEquipe int not null,
     constraint fk_ordemServico_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
     constraint fk_ordemServico_equipe foreign key (idEquipe) references equipe(idEquipe)
);
select * from ordemServico;
insert into ordemServico (dataEmissao,valor,dataEntrega,idVeiculo,idEquipe) values ('2022-09-01',200,'2022-09-02',1,1),
   																				   ('2022-08-03',500,'2022-08-03',2,1),
                                                                                   ('2022-09-04',300,'2022-09-06',3,2),
                                                                                   ('2022-09-05',100,'2022-09-05',4,2),
                                                                                   ('2022-09-10',800,'2022-09-20',5,3),
                                                                                   ('2022-09-18',300,'2022-09-19',1,3),
                                                                                   ('2022-09-18',120,'2022-09-19',6,1);
commit;
-- ORDEM POR SERVIÇO --
create table ordemPorServico (
     idOrdem int not null,
     idServico int not null,
     constraint fk_ordemPorServico_ordemServico foreign key (idOrdem) references ordemServico(idOrdem),
     constraint fk_ordemPorServico_Servico foreign key (idServico) references servico(idServico)
);
select * from ordemPorServico;
insert into ordemPorServico (idOrdem,idServico) values (1,1),(2,4),(3,3),(4,6),(5,7),(6,8),(7,2);

-- SERVICO --
create table servico (
	idServico int auto_increment primary key,
    descricao varchar(100),
    valor float default 0
);
insert into servico (descricao, valor) values ('Revisão', 200), 
											  ('Substituição do liquido de arrefecimento', 120), 
                                              ('Revisão do ar-condicionado','300'), 
                                              ('Suspensão',500),
                                              ('Troca de cabo de velas',100),
                                              ('Serviço básico de valor mínimo',100),
                                              ('Reparo de lataria valor/hora',80),
                                              ('Reparo de pintura valor/hora',100);                                           

-- PEÇA --
create table peca (
     idPeca int auto_increment primary key,
     descricao varchar(45) not null,
     valor float default 0
);
select * from peca;
insert into peca (descricao,valor) values ('amortecedor', 938), 
										  ('farol', 230), 
                                          ('tampa de válvulas', 345), 
                                          ('conjunto de cabo de velas',130), 
                                          ('conjunto de velas do motor',140),
										  ('filtro de ar', 40), 
                                          ('liquido de arrefecimento 1L', 20), 
                                          ('roda de ferro aro 14', 150), 
                                          ('atuador de marcha lenta',  302), 
                                          ('parabrisa dianteiro', 450);

-- ORDEM POR PEÇA --
create table ordemPorPeca (
     idOrdem int,
     idVeiculo int,
     idPeca int,
     constraint fk_ordemPorPeca_ordem foreign key (idOrdem) references ordemServico(idOrdem),
     constraint fk_ordemPorPeca_veiculo foreign key (idVeiculo) references ordemServico(idVeiculo),
     constraint fk_ordemPorPeca_peca foreign key (idPeca) references peca(idPeca)
);
select * from ordemPorPeca;
insert into ordemPorPeca (idOrdem,idVeiculo,idPeca) values (1,1,4),(1,1,5),
														   (2,2,1),(2,2,1),
                                                           (3,3,9),
                                                           (4,4,2),
                                                           (5,5,2),
                                                           (7,6,10);
