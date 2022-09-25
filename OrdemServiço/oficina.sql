-- Criação do banco de dados E-Commerce
create database oficina;
use oficina;

-- EQUIPE --
create table equipe (
     idEquipe int auto_increment primary key,
     nome varchar(45)
);
select * from equipe;
insert into equipe (idEquipe,nome) values ('Equipe 1'),('Equipe 2'),('Equipe 3');

-- MECANICO --
create table mecanico (
     idMecanico int auto_increment primary key,
     nome varchar(45) not null,
     endereco varchar(45),
     especialidade varchar(45),
     telefone char(11),
     idEquipe int,
     constraint fk_mecanico_equipe foreign key idEquipe references equipe(idEquipe)
);
select * from mecanico;
insert into mecanico (nome,endereco,especialidade,telefone,idEquipe) values 


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
insert into veiculo (idVeiculo,proprietrario,telefone,marca,modelo,ano,cpf,idEquipe) values

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
insert into ordemServico (dataEmissao,valor,dataEntrega,idVeiculo,idEquipe) values 

-- ORDEM POR SERVIÇO --
create table ordemPorServico (
     idOrdem int not null,
     idServico int not null,
     constraint fk_ordemPorServico_ordemServico foreign key (idOrdem) references ordemServico(idOrdem),
     constraint fk_ordemPorServico_Servico foreign key (idServico) references servico(idServico)
);
select * from ordemPorServico;
insert into ordemPorServico (idOrdem,idServico) values 

-- PEÇA --
create table peca (
     idPeca int auto_increment primary key,
     descricao varchar(45) not null,
     valor float default 0,
);
select * from peca;
insert into peca (idPeca,descricao,valor) values

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
insert into ordemPorPeca (idOrdem,idVeiculo,idPeca) values
