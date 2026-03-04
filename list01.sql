create database aula01;
use aula01;

create table editora(
cod_editora int auto_increment primary key,
descricao varchar(45) not null,
endereco varchar(45)
);

create table livro(
cod_livro int auto_increment primary key,
isbn varchar(45) not null,
titulo varchar(45) not null,
num_edicao varchar(45),
preco float not null,
editora_cod_editora int not null,
foreign key fk_livro_editora(editora_cod_editora) references editora(cod_editora) 
);

create table autor(
cod_autor int auto_increment primary key,
nome varchar(45) not null,
sexo char,
data_nascimento date not null
);

create table livro_autor(
cod_livro int not null,
cod_autor int not null,
primary key(cod_livro, cod_autor),
foreign key fk_cod_livro(cod_livro) references livro(cod_livro),
foreign key fk_cod_autor(cod_autor) references autor(cod_autor)
);
-- ---------------------------------------------------------------------------
-- 1
alter table editora rename column descricao to nome;

-- 2
alter table autor modify sexo varchar(1);

-- 3
alter table livro add constraint unique (isbn);

-- 4
alter table livro modify preco float not null default 10;

-- 5
alter table livro drop column num_edicao;
alter table livro add column edicao varchar(45) after titulo;

-- 6
create table grupo(
id_grupo int auto_increment not null primary key,
nome varchar(45) not null
);

alter table editora add column id_grupo int;

alter table editora add constraint
foreign key fk_editora_grupo(id_grupo) references grupo(id_grupo)
on delete set null on update cascade;