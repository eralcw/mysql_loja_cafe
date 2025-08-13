DROP DATABASE IF EXISTS loja_cafe;

USE loja_Cafe;

CREATE TABLE cafes(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    ativo TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE vendedores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade TINYINT UNSIGNED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE vendas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idcafe INT UNSIGNED NOT NULL,
    idvendedor INT UNSIGNED NOT NULL,
    data_venda DATE NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_vendas_cafe FOREIGN KEY (idcafe) REFERENCES cafes (id),
    CONSTRAINT fk_vendas_vendedor FOREIGN KEY (idvendedor) REFERENCES vendedores (id),
    INDEX idx_vendas_cafe (idcafe),
    INDEX idx_vendas_vendedor (idvendedor),
    INDEX idx_vendas_data (data_venda)
) ENGINE = InnoDB;

START TRANSACTION;

INSERT INTO
    cafes (nome, preco)
VALUES ('Café tipo A', 15.90),
    ('Café tipo B', 19.50);

INSERT INTO
    vendedores (nome, idade)
VALUES ('Ana', 25),
    ('Bruno', 31),
    ('Carla', 22);

INSERT INTO
    vendas (
        idcafe,
        idvendedor,
        data_venda,
        quantidade,
        valor_unitario
    )
VALUES (1, 1, '2025-08-01', 2, 15.90),
    (1, 2, '2025-08-02', 1, 15.90),
    (2, 1, '2025-08-02', 3, 19.50),
    (2, 3, '2025-08-03', 1, 19.50),
    (1, 3, '2025-08-03', 5, 15.90),
    (2, 2, '2025-08-04', 2, 19.50);

COMMIT;

SELECT id, nome FROM cafes;

SELECT id, nome FROM vendedores;

SELECT id, data_venda, idcafe, idvendedor, quantidade, valor_unitario 
FROM vendas;

SELECT ve.id AS venda_id,
       c.nome AS nome_cafe,
       ve.quantidade,
       ve.valor_unitario
FROM vendas as ve 
INNER JOIN cafes AS c ON c.id = ve.idcafe;
