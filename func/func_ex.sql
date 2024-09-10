-- Active: 1726005697776@@127.0.0.1@3306@loja_online

# 1 Crie uma Função que : pesquise um nome que termine com a letra S na tabela Fornecedores
DELIMITER $$
CREATE FUNCTION pesquisa_nome_com_s()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT DEFAULT '';
    SELECT GROUP_CONCAT(Nome SEPARATOR ', ') 
    INTO resultado
    FROM Fornecedores
    WHERE Nome LIKE '%S';
    
    RETURN resultado;
END $$
DELIMITER ;
SELECT pesquisa_nome_com_s();

# 2 Crie uma Função que : Retire os seguintes caracteres do texto abaixo : * . - !

DELIMITER $$

CREATE FUNCTION retira_caracteres (texto VARCHAR(155))
RETURNS VARCHAR(155)
DETERMINISTIC
BEGIN
    RETURN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(texto,'*',''),'.',''),'-',''),'!',''),'+','');
END $$
DELIMITER ;

SELECT retira_caracteres('Ta*lvez v.ocê ain*da n.ão saiba o que é *SQL. Ma.s, -provavelm-ente, ente-nde que lidar com');
SELECT retira_caracteres('d-e da-dos t+em se to+rna.do um d!!esafio cada vez maior');


# 3 Crie uma Função que : Calcule a média de 3 valores
DELIMITER $$

CREATE FUNCTION media_tres_valores(valor_1 DOUBLE, valor_2 DOUBLE, valor_3 DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    RETURN (valor_1 + valor_2 + valor_3) /3;
END $$

DELIMITER ;

SELECT media_tres_valores(10,20,30);

# 4 Crie uma Função que : Calcule a expressao : x+2(y-1)*5+x;

DELIMITER $$
CREATE FUNCTION calcula_expressao(x DOUBLE, y DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    RETURN x + 2 * (y - 1) * 5 + x;
END $$
DELIMITER ;

SELECT calcula_expressao(2,10);

# 5 Crie uma Função que : apresente um texto com palavras escritas ao contrario.
DELIMITER $$

CREATE FUNCTION inverter_palavras(texto VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE texto_invertido VARCHAR(255) DEFAULT '';
    DECLARE comprimento INT DEFAULT LENGTH(texto);
    DECLARE i INT DEFAULT 1;

    WHILE i <= comprimento DO
        SET texto_invertido = CONCAT(SUBSTRING(texto, i, 1), texto_invertido);
        SET i = i + 1;
    END WHILE;

    RETURN texto_invertido;
END $$

DELIMITER ;

SELECT inverter_palavras("MEB ODUT ALO")

# 6 Crie uma Função que : dê 5% de denconto em uma venda realizada.
DELIMITER $$
CREATE FUNCTION desconto(valor DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    RETURN valor * 0.95;
END $$
DELIMITER ;
SELECT desconto(10);
