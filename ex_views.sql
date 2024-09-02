# 1 Crie uma view que apresente o total de pedidos do dia 2024-08-21
CREATE VIEW total_pedidos AS SELECT SUM(p.valorTotalPedido) AS total
FROM loja_online.pedidos p;
SELECT * FROM total_pedidos


# 2 Crie uma view que apresente o total de pedidos já realizados
CREATE VIEW count_pedidos AS SELECT COUNT(p.valorTotalPedido) AS contador
FROM loja_online.pedidos p;
SELECT * FROM count_pedidos

# 3 Crie uma view que apresente o nome dos clientes que ja fizeram uma compra
CREATE VIEW clientes_compradores AS
SELECT c.nome
FROM clientes c
INNER JOIN pedidos p ON c.idCliente = p.fk_id_cliente;
SELECT * FROM clientes_compradores

# 4 Crie uma view que apresente os produtos que já foram comprados
CREATE VIEW prod_comprados as SELECT pd.descricao
FROM itemspedidos it
INNER JOIN produtos pd ON it.fk_id_produto = pd.idProduto;
SELECT * FROM prod_comprados

# 5 Crie uma view que apresente quais produtos os clientes compraram
CREATE VIEW produtos_clientes AS SELECT pd.descricao, c.nome
FROM itemspedidos it
INNER JOIN produtos pd ON it.fk_id_produto = pd.idProduto
INNER JOIN pedidos p ON it.fk_id_pedido = p.idPedido  
INNER JOIN clientes c ON p.fk_id_cliente = c.idCliente;
SELECT * FROM produtos_clientes