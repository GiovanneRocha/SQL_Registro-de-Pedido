CREATE DATABASE Curso_Mysql2;
USE Curso_Mysql2;
select * from produto;

CREATE TABLE estado (
	idEstado INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(2),
    PRIMARY KEY(idEstado)
    );

CREATE TABLE cidade(
	idCidade INTEGER NOT NULL auto_increment,
    nome varchar(60),
    PRIMARY KEY(idCidade)
	);

CREATE TABLE categoria (
	idCategoria INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40),
	PRIMARY KEY(idCategoria)
	);

CREATE TABLE marca (
	idMarca INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40),
	PRIMARY KEY(idMarca)
	);

CREATE TABLE Produto (
	idProduto INTEGER NOT NULL AUTO_INCREMENT,
	idCategoria INTEGER NOT NULL,
	idMarca INTEGER NOT NULL,
	nome VARCHAR (80) NULL,
	preco FLOAT(10,2) NULL,
	PRIMARY KEY (idProduto),
    
	INDEX produto_FKIndex1(idCategoria),
    INDEX produto_FKIndex2(idMarca),
    
    FOREIGN KEY (idCategoria)
    REFERENCES categoria (idCategoria),
    
    FOREIGN KEY (idMarca)
    REFERENCES marca(idMarca)
    );

CREATE TABLE vendedor (
	idVendedor INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NULL,
	email VARCHAR(60) NULL,
	cpf VARCHAR(15) NULL,
	idCidade INTEGER NOT NULL,
	idEstado INTEGER NOT NULL,
	PRIMARY KEY(idVendedor),
	INDEX vendedor_FKIndex1(idCidade),
	INDEX vendedor_FKIndex2(idEstado),
	FOREIGN KEY(idCidade)
	REFERENCES cidade(idCidade),
	FOREIGN KEY(idEstado)
	REFERENCES estado(idEstado)
	);

CREATE TABLE Cliente (
	idCliente INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NULL,
	email VARCHAR(60) NULL,
	cpf VARCHAR(15) NULL,
	data_nasc DATE NULL,
	idEstado INTEGER NOT NULL,
	idCidade INTEGER NOT NULL,
    
	PRIMARY KEY(idCliente),
	INDEX Cliente_FKIndex1(idCidade),
	INDEX Cliente_FKIndex2(idEstado),
    
	FOREIGN KEY(idCidade)
	REFERENCES cidade(idCidade),
    
	FOREIGN KEY(idEstado)
	REFERENCES estado(idEstado)
	);
    

CREATE TABLE pedido (
	idPedido INTEGER NOT NULL AUTO_INCREMENT,
	data_pedido DATE NULL,
	idVendedor INTEGER NOT NULL,
	idCliente INTEGER NOT NULL,
	PRIMARY KEY(idPedido),
	INDEX pedido_FKIndex1(idVendedor),
	INDEX pedido_FKIndex2(idCliente),
	FOREIGN KEY(idVendedor)
	REFERENCES vendedor(idVendedor),
	FOREIGN KEY(idCliente)
	REFERENCES Cliente(idCliente)
	);


