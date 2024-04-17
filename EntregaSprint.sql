DROP TABLE cliente;
DROP TABLE atendente;
DROP TABLE produto;
DROP TABLE chamada;
DROP TABLE compra;
DROP TABLE scripts;

--primeiro passo
CREATE TABLE cliente (
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    nome_cliente VARCHAR(50),
    genero VARCHAR(10),
    cep CHAR(8),
    telefone VARCHAR(10),
    email VARCHAR(100),
    preferencia_contato VARCHAR(5),
    dt_nascimento DATE,
    senha_user VARCHAR(10));

CREATE TABLE atendente (
    cpf_atendente VARCHAR(11) PRIMARY KEY,
    nome_atendente VARCHAR(100),
    setor VARCHAR(20),
    senha_atendente VARCHAR(10),
    avaliacao_atendente DECIMAL(3,1));

CREATE TABLE produto (
    id_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100),
    descricao_produto VARCHAR(100),
    valor_produto DECIMAL(10,2));
    
CREATE TABLE chamada (
    id_chamada INTEGER PRIMARY KEY,
    dt_chamada DATE,
    hora VARCHAR2(8),
    duracao INTERVAL DAY TO SECOND,
    resultado CHAR(1),
    cpf_cliente VARCHAR(11),
    cpf_atendente VARCHAR(11),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
    FOREIGN KEY (cpf_atendente) REFERENCES atendente(cpf_atendente));

CREATE TABLE compra (
    id_compra INTEGER PRIMARY KEY,
    dt_compra DATE,
    cpf_cliente VARCHAR(11),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente));

CREATE TABLE scripts (
    id_script INTEGER PRIMARY KEY,
    descricao_script CLOB,
    id_compra INTEGER,
    id_chamada INTEGER,
    cpf_cliente VARCHAR(11),
    id_produto INTEGER,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_chamada) REFERENCES chamada(id_chamada),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto));


--segundo passo:

--cliente
INSERT INTO cliente (cpf_cliente, nome_cliente, genero, cep, telefone, email, preferencia_contato, dt_nascimento, senha_user)
VALUES ('12345678901', 'Marcos Garrido', 'Masculino', '12345678', '1234567890', 'joao@email.com', 'Manha', '15-12-2004', 'senha123');

INSERT INTO cliente (cpf_cliente, nome_cliente, genero, cep, telefone, email, preferencia_contato, dt_nascimento, senha_user)
VALUES('23456789012', 'Anna Soares', 'Feminino', '23456789', '2345678901', 'maria@email.com', 'Tarde', '16-10-1980', 'senha456');

INSERT INTO cliente (cpf_cliente, nome_cliente, genero, cep, telefone, email, preferencia_contato, dt_nascimento, senha_user)
VALUES ('34567890123', 'Alysson Pinheiro', 'Masculino', '34567890', '3456789012', 'pedro@email.com', 'Noite', '17-11-1990', 'senha789');

INSERT INTO cliente (cpf_cliente, nome_cliente, genero, cep, telefone, email, preferencia_contato, dt_nascimento, senha_user)
VALUES ('45678901234', 'Izabellly Oliviera', 'Feminino', '45678901', '4567890123', 'ana@email.com', 'Manha', '14-09-1999', 'senha234');

INSERT INTO cliente (cpf_cliente, nome_cliente, genero, cep, telefone, email, preferencia_contato, dt_nascimento, senha_user)
VALUES ('56789012345', 'Lucas Monte', 'Masculino', '56789012', '5678901234', 'lucas@email.com', 'Tarde', '08-08-2004', 'senha345');

--atendente
INSERT INTO atendente (cpf_atendente, nome_atendente, setor, senha_atendente, avaliacao_atendente)
VALUES ('12345678901', 'Carlos Silva', 'Comercial', 'senha123', 3.5);

INSERT INTO atendente (cpf_atendente, nome_atendente, setor, senha_atendente, avaliacao_atendente)
VALUES ('23456789012', 'Ana Oliveira', 'Comercial', 'senha456', 3.2);

INSERT INTO atendente (cpf_atendente, nome_atendente, setor, senha_atendente, avaliacao_atendente)
VALUES('34567890123', 'Paulo Santos', 'Comercial', 'senha789', 4.8);

INSERT INTO atendente (cpf_atendente, nome_atendente, setor, senha_atendente, avaliacao_atendente)
VALUES('45678901234', 'Mariana Souza', 'Comercial', 'senha234', 2.6);

INSERT INTO atendente (cpf_atendente, nome_atendente, setor, senha_atendente, avaliacao_atendente)
VALUES('56789012345', 'Gabriel Costa', 'Comercial', 'senha345', 5.0);

--produto
INSERT INTO produto (id_produto, nome_produto, descricao_produto, valor_produto)
VALUES (1, 'KitKat', 'Chocolate ao Leite Nestle - 41,5g', 10.99);

INSERT INTO produto (id_produto, nome_produto, descricao_produto, valor_produto)
VALUES (2, 'Bone Adidas', 'Leve running x adizero heat.dry', 59.99);

INSERT INTO produto (id_produto, nome_produto, descricao_produto, valor_produto)
VALUES (3, 'Amaciante Ype', 'Amaciante de Roupas Aconchego 2 Litros', 79.99);

INSERT INTO produto (id_produto, nome_produto, descricao_produto, valor_produto)
VALUES(4, 'PSP', 'PlayStation Portable ', 400.99);

INSERT INTO produto (id_produto, nome_produto, descricao_produto, valor_produto)
VALUES(5, 'AirPods Pro', 'Apple AirPods', 1900.99);

--chamada
INSERT INTO chamada (id_chamada, dt_chamada, hora, duracao, resultado, cpf_cliente, cpf_atendente)
VALUES (1, '01-04-2024', '09:00:00', INTERVAL '0 02:30:00' DAY TO SECOND, 1 , '12345678901', '23456789012');

INSERT INTO chamada (id_chamada, dt_chamada, hora, duracao, resultado, cpf_cliente, cpf_atendente)
VALUES(2, '01-04-2024', '10:00:00', INTERVAL '0 01:30:00' DAY TO SECOND, 0 , '23456789012', '34567890123');

INSERT INTO chamada (id_chamada, dt_chamada, hora, duracao, resultado, cpf_cliente, cpf_atendente)
VALUES (3, '01-04-2024', '11:00:00', INTERVAL '0 00:30:00' DAY TO SECOND, 1 , '34567890123', '45678901234');

INSERT INTO chamada (id_chamada, dt_chamada, hora, duracao, resultado, cpf_cliente, cpf_atendente)
VALUES (4, '01-04-2024', '12:00:00', INTERVAL '0 01:00:00' DAY TO SECOND, 0 , '45678901234', '56789012345');

INSERT INTO chamada (id_chamada, dt_chamada, hora, duracao, resultado, cpf_cliente, cpf_atendente)
VALUES (5, '01-04-2024', '13:00:00', INTERVAL '0 00:10:00' DAY TO SECOND, 1 , '56789012345', '12345678901');


--compra
INSERT INTO compra (id_compra, dt_compra, cpf_cliente)
VALUES (1, '04-04-2024', '12345678901');

INSERT INTO compra (id_compra, dt_compra, cpf_cliente)
VALUES(2, '05-04-2024', '23456789012');

INSERT INTO compra (id_compra, dt_compra, cpf_cliente)
VALUES(3, '06-04-2024', '34567890123');

INSERT INTO compra (id_compra, dt_compra, cpf_cliente)
VALUES(4, '05-04-2024', '45678901234');

INSERT INTO compra (id_compra, dt_compra, cpf_cliente)
VALUES (5, '08-04-2024', '56789012345');

--scripts
INSERT INTO scripts (id_script, descricao_script, id_compra, id_chamada, cpf_cliente, id_produto)
VALUES (1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' , 1, 1, '12345678901', 1);

INSERT INTO scripts (id_script, descricao_script, id_compra, id_chamada, cpf_cliente, id_produto)
VALUES (2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' , 2, 2, '23456789012', 2);

INSERT INTO scripts (id_script, descricao_script, id_compra, id_chamada, cpf_cliente, id_produto)
VALUES (3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' , 3, 3, '34567890123', 3);

INSERT INTO scripts (id_script, descricao_script, id_compra, id_chamada, cpf_cliente, id_produto)
VALUES(4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' , 4, 4, '45678901234', 4);

INSERT INTO scripts (id_script, descricao_script, id_compra, id_chamada, cpf_cliente, id_produto)
VALUES (5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' , 5, 5, '56789012345', 5);


--terceiro passo:
set serveroutput on


 --bloco 1
 
DECLARE
    v_nome_cliente cliente.nome_cliente%TYPE;
    v_qtd_compras INTEGER;
BEGIN
    FOR c IN (SELECT nome_cliente, COUNT(*) AS qtd_compras
                FROM cliente
                JOIN compra ON cliente.cpf_cliente = compra.cpf_cliente
                GROUP BY nome_cliente
                ORDER BY nome_cliente)
    LOOP
        v_nome_cliente := c.nome_cliente;
        v_qtd_compras := c.qtd_compras;
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nome_cliente || ' - Quantidade de compras: ' || v_qtd_compras);
    END LOOP;
END;


--bloco 2
DECLARE
    v_nome_produto produto.nome_produto%TYPE;
    v_qtd_vendas INTEGER;
BEGIN
    FOR p IN (SELECT nome_produto, COUNT(*) AS qtd_vendas
                FROM produto
                JOIN scripts ON produto.id_produto = scripts.id_produto
                GROUP BY nome_produto
                ORDER BY nome_produto)
    LOOP
        v_nome_produto := p.nome_produto;
        v_qtd_vendas := p.qtd_vendas;
        DBMS_OUTPUT.PUT_LINE('Produto: ' || v_nome_produto || ' - Quantidade de vendas: ' || v_qtd_vendas);
    END LOOP;
END;



SELECT c.nome_cliente, COUNT(distinct co.id_compra) AS qtd_compras, AVG(a.avaliacao_atendente) AS media_avaliacao
FROM cliente c
JOIN compra co ON c.cpf_cliente = co.cpf_cliente
JOIN chamada ch ON c.cpf_cliente = ch.cpf_cliente
JOIN atendente a ON ch.cpf_atendente = a.cpf_atendente
GROUP BY c.nome_cliente
ORDER BY media_avaliacao DESC;


SELECT p.nome_produto, COUNT(s.id_script) AS qtd_vendida, SUM(p.valor_produto) AS valor_total_vendido
FROM produto p
JOIN scripts s ON p.id_produto = s.id_produto
GROUP BY p.nome_produto
ORDER BY valor_total_vendido DESC;


SELECT a.nome_atendente, a.setor, COUNT(ch.id_chamada) AS qtd_chamadas, AVG(a.avaliacao_atendente) AS media_avaliacao
FROM atendente a
JOIN chamada ch ON a.cpf_atendente = ch.cpf_atendente
GROUP BY a.nome_atendente, a.setor
ORDER BY media_avaliacao DESC;

