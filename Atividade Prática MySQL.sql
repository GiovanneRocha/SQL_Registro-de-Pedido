-- Atividade Prática - Comandos SQL (P2) --
USE Curso_Mysql2;

-- 1 - Listar o nome do cliente, email e nome da cidade.
SELECT c.nome AS nome_cliente, c.email AS email_cliente, cd.nome AS nome_cidade
FROM Cliente c
INNER JOIN cidade cd ON c.idCidade = cd.idCidade;

-- 2 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades do estado de SP.
SELECT c.nome AS nome_cliente, c.email AS email_cliente, cd.nome AS nome_cidade, e.nome AS nome_estado
FROM Cliente c
INNER JOIN cidade cd ON c.idCidade = cd.idCidade
INNER JOIN estado e ON c.idEstado = e.idEstado
WHERE e.nome = 'SP';

-- 3 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades que tenham a letra "ó" no nome do cliente. ( Não tem Cliente com a letra Ó )
SELECT c.nome AS nome_cliente, c.email AS email_cliente, cd.nome AS nome_cidade, e.nome AS nome_estado
FROM Cliente c
INNER JOIN cidade cd ON c.idCidade = cd.idCidade
INNER JOIN estado e ON c.idEstado = e.idEstado
WHERE c.nome like '%Ó%';

-- 4 - Listar o nome do produto e nome da marca dos produtos que custem entre 1000 e 3000 reais.
SELECT p.nome AS nome_produto, m.nome AS nome_marca, preco
FROM Produto p
INNER JOIN marca m ON p.idMarca = m.idMarca
WHERE p.preco BETWEEN 1000 AND 3000;

-- 5 - Listar o nome do produto, nome da marca e nome da categoria dos produtos que  tenham a letra "e" no nome do produto.
SELECT p.nome AS nome_produto, m.nome AS nome_marca, c.nome AS nome_categoria
FROM Produto p
INNER JOIN marca m ON p.idMarca = m.idMarca
INNER JOIN categoria c ON p.idCategoria = c.idCategoria
WHERE p.nome LIKE '%e%';

-- 6 - Listar o número do pedido, a data do pedido e nome do cliente dos pedidos com realizados no mês 08/2016.
SELECT p.idPedido AS numero_pedido, p.data_pedido, c.nome AS nome_cliente
FROM pedido p
INNER JOIN Cliente c ON p.idCliente = c.idCliente
WHERE p.data_pedido BETWEEN '2016-08-01' AND '2016-08-31';

-- 7 - Listar o número do pedido, a data do pedido, nome do cliente e nome do vendedor dos pedidos com realizados no mês 07/2016.
SELECT p.idPedido AS numero_pedido, p.data_pedido, c.nome AS nome_cliente, v.nome AS nome_vendedor
FROM pedido p
INNER JOIN Cliente c ON p.idCliente = c.idCliente
INNER JOIN vendedor v ON p.idVendedor = v.idVendedor
WHERE p.data_pedido BETWEEN '2016-07-01' AND '2016-07-31';

-- 8 - Listar os nome e preço dos produtos comprados pelo cliente de id=1
SELECT p.nome AS nome_produto, p.preco
FROM itens_pedido ip
INNER JOIN pedido ped ON ip.idPedido = ped.idPedido
INNER JOIN Produto p ON ip.idProduto = p.idProduto
WHERE ped.idCliente = 1;

-- 9 - Listar o número do pedido e o nome clientes que possuem pedidos e também dos que não possuem pedidos.
SELECT p.idPedido AS numero_pedido, c.nome AS nome_cliente
FROM Cliente c
LEFT JOIN pedido p ON c.idCliente = p.idCliente;

-- 10 - Listar o nome, preço, nome da categoria e nome da marca do produto mais caro.
SELECT p.nome AS nome_produto, p.preco, c.nome AS nome_categoria, m.nome AS nome_marca
FROM Produto p
INNER JOIN categoria c ON p.idCategoria = c.idCategoria
INNER JOIN marca m ON p.idMarca = m.idMarca
WHERE p.preco = (SELECT MAX(preco) FROM Produto);

-- 11 - Listar o número do pedido, valor total e nome do cliente do pedido mais caro.
SELECT p.idPedido, SUM(ip.valor_total) AS valor_total, c.nome AS nome_cliente
FROM pedido p
INNER JOIN itens_pedido ip ON p.idPedido = ip.idPedido
INNER JOIN Cliente c ON p.idCliente = c.idCliente
GROUP BY p.idPedido, c.nome
ORDER BY valor_total DESC
LIMIT 1;

-- 12 - Listar o número do pedido, valor total e nome do vendedor do pedido mais barato.
SELECT p.idPedido, SUM(ip.valor_total) AS valor_total, v.nome AS nome_vendedor
FROM pedido p
INNER JOIN itens_pedido ip ON p.idPedido = ip.idPedido
INNER JOIN vendedor v ON p.idVendedor = v.idVendedor
GROUP BY p.idPedido, v.nome
ORDER BY valor_total ASC
LIMIT 1;
