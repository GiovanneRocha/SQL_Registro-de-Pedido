CREATE DATABASE Curso_Mysql2;
USE Curso_Mysql2;

CREATE TABLE estado (
	idEstado INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(2),
    PRIMARY KEY(idEstado)
    );
    
	INSERT INTO estado VALUES (null,'SP');
	INSERT INTO estado VALUES (null,'MG');
	INSERT INTO estado VALUES (null,'RJ');
	INSERT INTO estado VALUES (null,'ES');
	INSERT INTO estado VALUES (null,'MS');

CREATE TABLE cidade(
	idCidade INTEGER NOT NULL auto_increment,
    nome varchar(60),
    PRIMARY KEY(idCidade)
	);
    
    INSERT INTO cidade VALUES (null,'São Paulo');
	INSERT INTO cidade VALUES (null,'Campinas');
	INSERT INTO cidade VALUES (null,'Poços de Caldas');
	INSERT INTO cidade VALUES (null,'Andradas');
	INSERT INTO cidade VALUES (null,'Rio de Janeiro');

CREATE TABLE categoria (
	idCategoria INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40),
	PRIMARY KEY(idCategoria)
	);
    
    INSERT INTO categoria VALUES (null,'Alimentos');
	INSERT INTO categoria VALUES (null,'Eletrodomésticos');
	INSERT INTO categoria VALUES (null,'Eletrônicos');
	INSERT INTO categoria VALUES (null,'Limpeza');

CREATE TABLE marca (
	idMarca INTEGER NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40),
	PRIMARY KEY(idMarca)
	);
    
    INSERT INTO marca VALUES (null,'Samsung');
	INSERT INTO marca VALUES (null,'LG');
	INSERT INTO marca VALUES (null,'Sony');
	INSERT INTO marca VALUES (null,'Brastemp');
	INSERT INTO marca VALUES (null,'Tio João');
	INSERT INTO marca VALUES (null,'Come Tudo');
	INSERT INTO marca VALUES (null,'Omo');
	INSERT INTO marca VALUES (null,'Electrolux');
	INSERT INTO marca VALUES (null,'BomBril');
	INSERT INTO marca VALUES (null,'Camil');
	INSERT INTO marca VALUES (null,'Fugini'); 

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
    
    INSERT INTO produto VALUES (null,1,5,'Arroz',11.50);
	INSERT INTO produto VALUES (null,1,6,'Feijão',18.50);
	INSERT INTO produto VALUES (null,1,11,'Molho de Tomate',1.50);
	INSERT INTO produto VALUES (null,1,11,'Maionese',3.50);
	INSERT INTO produto VALUES (null,1,11,'Ervilha',2.30);
	INSERT INTO produto VALUES (null,1,10,'Arroz',9.90);
	INSERT INTO produto VALUES (null,2,1,'Geladeira',3700.00);
	INSERT INTO produto VALUES (null,2,1,'Microondas',450.00);
	INSERT INTO produto VALUES (null,2,1,'Smart TV 48 4k',2700.00);
	INSERT INTO produto VALUES (null,2,2,'Ar Condicionado 12.000 BTU',1350.00);
	INSERT INTO produto VALUES (null,2,4,'Geladeira BRM58',2100.00);
	INSERT INTO produto VALUES (null,2,4,'Máquina de Lavar 12KG',1430.00);
	INSERT INTO produto VALUES (null,2,4,'Forno de Embutir 55 Litros',1260.00);
	INSERT INTO produto VALUES (null,2,8,'Aspirador de Pó',350.00);
	INSERT INTO produto VALUES (null,2,8,'Liquidificador',250.00);
	INSERT INTO produto VALUES (null,2,8,'Batedeira',650.00);
	INSERT INTO produto VALUES (null,3,1,'Samsung Galaxy S7',3550.00);
	INSERT INTO produto VALUES (null,3,2,'Tablet LG 10.1',1550.00);
	INSERT INTO produto VALUES (null,3,3,'Notebook Sony',3550.00);
	INSERT INTO produto VALUES (null,4,9,'Pinho Brll',3.00);
	INSERT INTO produto VALUES (null,4,9,'Lysoform 1 Lt',11.00);
	INSERT INTO produto VALUES (null,4,9,'Limpol',8.00);
	INSERT INTO produto VALUES (null,4,7,'Sabão em Pó',8.50);
	INSERT INTO produto VALUES (null,4,7,'Sabão em Pó Líquido',9.50);

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
    
    INSERT INTO vendedor VALUES (null,'Fábio','fabio@gmail.com','358.256.259-95',1,1);
	INSERT INTO vendedor VALUES (null,'João','joao@gmail.com','127.128.589.79',1,1);
	INSERT INTO vendedor VALUES(null,'Henrique','henrique@gmail.com','852.123.145-13',2,1);
	INSERT INTO vendedor VALUES (null,'Roberto','roberto@gmail.com','659.521.456.87',2,1);
	INSERT INTO vendedor VALUES(null,'Marcos','marcos@outlook.com','589.654.851.25',3,2);
	INSERT INTO vendedor VALUES(null,'Rafael','rafael@outlook.com','184.547.963.37',4,2);
	INSERT INTO vendedor VALUES(null,'Marcelo','marcelo@outlook.com','332.653.421-15',5,3);


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
    
    INSERT INTO cliente VALUES (null,'CamilaFernandes','camilaf@gmail.com','222.258.658.99','1985-12-16',1,1);
	INSERT INTO cliente VALUES (null,'JoãoRodrigues','rodrigues@hotmail.com','221.546.652.89','1990-01-25',1,2);
	INSERT INTO cliente VALUES (null,'JoséCarlos','josec@hotmail.com','758.564.254.89','1991-03-15',2,3);
	INSERT INTO cliente VALUES (null,'FernandoHenrique','fhenr@hotmail.com','555.666.888.99','1985-09-30',2,4);
	INSERT INTO cliente VALUES (null,'MarinaFerreira','marinaf@outlook.com','451.578.965.21','1989-06-20',3,5);
	INSERT INTO cliente VALUES (null,'LuisPaulo','luispaulo@outlook.com','216.052.358.69','1980-07-10',1,1);
	INSERT INTO cliente VALUES (null,'RuiBiaco','ruibiaco@outlook.com','458.789.654.12','1983-03-30',1,2);
	INSERT INTO cliente VALUES (null,'ClaudemirSilva','claudemir@gmail.com','124.564.458.99','1985-11-25',3,2);
	INSERT INTO cliente VALUES (null,'José daSilva','josesilva@outlook.com','025.658.458-89','1978-05-11',2,4);
	INSERT INTO cliente VALUES (null,'JonasFirmino','jonasf@outlook.com','335.658.963.55','1979-02-15',3,5);
	INSERT INTO cliente VALUES (null,'Carolina Ferraz','carolferraz@outlook.com','124.254.458-12','1987-06-12',1,2);
	INSERT INTO cliente VALUES (null,'MarcioGomes','marciogomez@gmail.com','137.258.784-25','1991-01-30',3,5);
    

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
    
    INSERT INTO pedido VALUES (null,'2016-08-08',1,1);
	INSERT INTO pedido VALUES (null,'2016-08-07',2,1);
	INSERT INTO pedido VALUES (null,'2016-07-31',2,4);
	INSERT INTO pedido VALUES (null,'2016-08-08',3,5);
	INSERT INTO pedido VALUES (null,'2016-07-09',4,8);
	INSERT INTO pedido VALUES (null,'2016-08-04',7,10);
	INSERT INTO pedido VALUES (null,'2016-08-03',6,11);
	INSERT INTO pedido VALUES (null,'2016-08-02',7,8);
	INSERT INTO pedido VALUES (null,'2016-08-05',6,9);
	INSERT INTO pedido VALUES (null,'2016-07-28',2,5);
	INSERT INTO pedido VALUES (null,'2016-07-29',1,10);

CREATE TABLE itens_pedido (
	idItens INTEGER NOT NULL AUTO_INCREMENT,
	idPedido INTEGER NOT NULL,
	idProduto INTEGER NOT NULL,
	qtde INTEGER NULL,
	valor_unit FLOAT(10,2) NULL,
	valor_total FLOAT(10,2) NULL,
    
	PRIMARY KEY(idItens),
	INDEX itens_pedido_FKIndex1(idProduto),
	INDEX itens_pedido_FKIndex2(idPedido),
    
	FOREIGN KEY(idProduto)
	REFERENCES produto(idProduto),
    
	FOREIGN KEY(idPedido)
	REFERENCES pedido(idPedido)
	);
    
SELECT DISTINCT idProduto
FROM itens_pedido
WHERE idProduto NOT IN (SELECT idProduto FROM produto);


    INSERT INTO itens_pedido VALUES (null,1,1,5,11.50,57.50);
	INSERT INTO itens_pedido VALUES (null,1,3,3,18.50,55.50);
	INSERT INTO itens_pedido VALUES (null,1,21,10,3.00,30.00);
	INSERT INTO itens_pedido VALUES (null,1,24,4,9.50,38.00); -- Troca do segundo valor de 25 para 24;
	INSERT INTO itens_pedido VALUES (null,2,12,1,2100.00,2100.00);
	INSERT INTO itens_pedido VALUES (null,2,17,1,650.00,650.00);
	INSERT INTO itens_pedido VALUES (null,3,13,1,1430.00,1430.00);
	INSERT INTO itens_pedido VALUES (null,3,14,1,1260.00,1260.00);
	INSERT INTO itens_pedido VALUES (null,4,1,10,11.50,115.00);
	INSERT INTO itens_pedido VALUES (null,4,7,10,9.90,99.00);
	INSERT INTO itens_pedido VALUES (null,4,24,10,8.50,85.00);
	INSERT INTO itens_pedido VALUES (null,4,22,2,11.00,22.00);
	INSERT INTO itens_pedido VALUES (null,5,4,10,1.50,15.00);
	INSERT INTO itens_pedido VALUES (null,5,5,4,3.50,14.00);
	INSERT INTO itens_pedido VALUES (null,5,8,1,3700.00,3700.00);
	INSERT INTO itens_pedido VALUES (null,6,4,5,1.50,7.50);
	INSERT INTO itens_pedido VALUES (null,6,9,2,450.00,900.00);
	INSERT INTO itens_pedido VALUES (null,6,10,1,2700.00,2700.00);
	INSERT INTO itens_pedido VALUES (null,6,6,1,2.30,2.30);
	INSERT INTO itens_pedido VALUES (null,7,11,1,1350.00,1350.00);
	INSERT INTO itens_pedido VALUES (null,7,19,1,1550.00,1550.00);
	INSERT INTO itens_pedido VALUES (null,8,15,1,350.00,350.00);
	INSERT INTO itens_pedido VALUES (null,8,18,1,3550.00,3550.00);
	INSERT INTO itens_pedido VALUES (null,9,1,10,11.50,115.00);
	INSERT INTO itens_pedido VALUES (null,9,3,3,18.50,55.50);
	INSERT INTO itens_pedido VALUES (null,9,21,5,3.00,15.00);
	INSERT INTO itens_pedido VALUES (null,9,24,4,9.50,38.00); -- troca do valor novamente
	INSERT INTO itens_pedido VALUES (null,10,15,1,350.00,350.00);
	INSERT INTO itens_pedido VALUES (null,10,18,1,3550.00,3550.00);
	INSERT INTO itens_pedido VALUES (null,10,4,5,1.50,7.50);
	INSERT INTO itens_pedido VALUES (null,10,9,2,450.00,900.00);
	INSERT INTO itens_pedido VALUES (null,10,10,1,2700.00,2700.00);
	INSERT INTO itens_pedido VALUES (null,10,6,1,2.30,2.30);
    
SELECT * FROM Cliente WHERE nome like '%a%'; -- Listando todos os clientes que possuem a letra A no nome;
SELECT * FROM produto WHERE nome like 'j%'; -- Listando todos os produtos que começem com a letra J no nome;
SELECT * FROM vendedor WHERE nome like '%s'; -- Listando todos os vendedores que terminem com a letra S;

Select * from produto order by idProduto desc limit 10;
Select * from produto order by preco desc limit 2;

SELECT c.nome AS nome_cliente, c.email AS email_cliente, cd.nome AS nome_cidade FROM cliente c
INNER JOIN cidade cd 
ON c.idCidade = cd.idCidade;

SELECT c.nome AS nome_cliente, c.email, e.nome AS nome_estado, cd.nome AS nome_cidade
FROM cliente c
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN cidade cd ON c.idCidade = cd.idCidade;

SELECT p.data_pedido, v.nome as Vendedor, c.nome as Cliente
FROM pedido p
INNER JOIN vendedor v
ON p.idVendedor = v.idVendedor
INNER JOIN cliente c
ON p.idCliente = c.idCliente;


CREATE OR REPLACE VIEW vw_listar AS SELECT * FROM cliente;

SELECT * FROM vw_listar;

CREATE OR REPLACE VIEW vw_listar AS SELECT nome, email
FROM cliente order by nome;
