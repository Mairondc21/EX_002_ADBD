# 1 Crie uma view que apresente o total de pedidos do dia 2024-08-21
CREATE VIEW total_pedidos AS SELECT SUM(p.valorTotalPedido) AS total
FROM loja_online.pedidos p;
SELECT * FROM total_pedidos;


# 2 Crie uma view que apresente o total de pedidos já realizados
CREATE VIEW count_pedidos AS SELECT COUNT(p.valorTotalPedido) AS contador
FROM loja_online.pedidos p;
SELECT * FROM count_pedidos;

# 3 Crie uma view que apresente o nome dos clientes que ja fizeram uma compra
CREATE VIEW clientes_compradores AS
SELECT c.nome
FROM clientes c
INNER JOIN pedidos p ON c.idCliente = p.fk_id_cliente;
SELECT * FROM clientes_compradores;

# 4 Crie uma view que apresente os produtos que já foram comprados
CREATE VIEW prod_comprados as SELECT pd.descricao
FROM itemspedidos it
INNER JOIN produtos pd ON it.fk_id_produto = pd.idProduto;
SELECT * FROM prod_comprados;

# 5 Crie uma view que apresente quais produtos os clientes compraram
CREATE VIEW produtos_clientes AS SELECT pd.descricao, c.nome
FROM itemspedidos it
INNER JOIN produtos pd ON it.fk_id_produto = pd.idProduto
INNER JOIN pedidos p ON it.fk_id_pedido = p.idPedido  
INNER JOIN clientes c ON p.fk_id_cliente = c.idCliente;
SELECT * FROM produtos_clientes;

# 6 Crie uma view que apresente qual o maior pedido em valor
CREATE VIEW maior_val_pedido AS SELECT MAX(valorTotalPedido)
FROM pedidos;
SELECT * FROM maior_val_pedido;

# 7 Crie uma view que apresente qual o menor pedido em valor
CREATE VIEW menor_val_pedido AS SELECT MIN(valorTotalPedido)
FROM pedidos;
SELECT * FROM menor_val_pedido;

# 8 Crie uma view que apresente qual o endereco do cliente Teclaudio
CREATE VIEW endereco_tclaudio AS SELECT c.nome, e.Logradouro, e.numero,e.complemento,e.cep,e.bairro,e.cidade,e.estado
FROM enderecos e
INNER JOIN clientes c ON c.fk_id_Endereco = e.idEndereco
WHERE c.nome = 'Tecláudio Screen';
SELECT * FROM endereco_tclaudio;

# 9 Crie uma view que apresente qual endereco dos clientes que ja fizeram compras
CREATE VIEW endereco_cliente_compras AS SELECT c.nome, e.Logradouro, e.numero,e.complemento,e.cep,e.bairro,e.cidade,e.estado
FROM itemspedidos ip
INNER JOIN pedidos p ON ip.fk_id_Pedido = p.idPedido
INNER JOIN clientes c ON p.fk_id_Cliente = c.idCliente
INNER JOIN enderecos e ON c.fk_id_endereco = e.idEndereco;
SELECT * FROM endereco_cliente_compras;

# 10 Crie uma view que apresente quais pedidos foram pagos em pix
CREATE VIEW pedidos_pix AS SELECT pd.idPedido
FROM pedidos pd
INNER JOIN pagamentos pg ON pd.fk_id_pagamento = pg.idPagamento
WHERE pg.forma_pagamento = 'PIX';
SELECT * FROM pedidos_pix;

# 11 Crie uma view que apresente quais pedidos foram pagos em cartao
CREATE VIEW pedidos_cartao AS SELECT pd.idPedido
FROM pedidos pd
INNER JOIN pagamentos pg ON pd.fk_id_pagamento = pg.idPagamento
WHERE pg.forma_pagamento = 'CARTAO_CREDITO';
SELECT * FROM pedidos_cartao;

# 12 Crie uma view que apresente quais itens foram pedidos no pedido do Marta Castro
CREATE VIEW pedido_marta AS SELECT ip.idiItemPedido,c.nome,pd.descricao, ip.quantidade
FROM itemspedidos ip
INNER JOIN pedidos p ON ip.fk_id_Pedido = p.idPedido
INNER JOIN clientes c ON p.fk_id_Cliente = c.idCliente
INNER JOIN produtos pd ON ip.fk_id_Produto = pd.idProduto
WHERE c.nome = 'Marta Castro';
SELECT * FROM pedido_marta;

# 13 Crie uma view que apresente qual fornecedor fabricou os produtos do pedido da Helena Carla
CREATE VIEW fornecedor_helena AS SELECT c.nome as clien, f.nome as forne
FROM itemspedidos ip
INNER JOIN pedidos p ON ip.fk_id_Pedido = p.idPedido
INNER JOIN clientes c ON p.fk_id_Cliente = c.idCliente
INNER JOIN produtos pd ON ip.fk_id_Produto = pd.idProduto
INNER JOIN fornecedores f ON pd.fk_id_fornecedor = f.idFornecedor
WHERE c.nome = 'Helena Carla';
SELECT * FROM fornecedor_helena;

# 14 Crie uma view que apresente qual o nome do fornecedor que fabrica as Camisas comercializadas pela loja
CREATE VIEW fornecedores_camisas AS SELECT f.nome
FROM fornecedores f
INNER JOIN produtos p ON p.fk_id_fornecedor = f.idFornecedor
WHERE p.descricao LIKE '%Camisa%';
SELECT * FROM fornecedores_camisas;

# 15 Crie uma view que apresente qual a quantidade em estoque do produto comprado pela Maria de Almeida
CREATE VIEW estoque_maria_de_almeida AS SELECT c.nome, p.descricao,p.estoque
FROM produtos p
INNER JOIN itemsPedidos ip ON p.idProduto = ip.fk_id_Produto
INNER JOIN pedidos pd ON ip.fk_id_Pedido = pd.idPedido
INNER JOIN clientes c ON pd.fk_id_Cliente = c.idCliente
WHERE c.nome = 'Maria de Almeida';
SELECT * FROM estoque_maria_de_almeida;

# 16 Crie uma view que apresente o total de produtos fabricados pela Marte Roupas
CREATE VIEW total_roupas_marte AS SELECT SUM(p.estoque) AS Total
FROM fornecedores f
INNER JOIN produtos p ON p.fk_id_fornecedor = f.idFornecedor
WHERE f.nome = 'Marte Roupas';
SELECT * FROM total_roupas_marte;


