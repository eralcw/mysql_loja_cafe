# mysql_loja_cafe
Script SQL para criar e popular um banco de dados de uma loja de café, com tabelas de cafés, vendedores e vendas. Inclui exemplos de consultas e uso de JOIN.
# Loja Café MySQL

Este projeto contém um script SQL para criar e popular um banco de dados de uma loja de café, com tabelas para cafés, vendedores e vendas. Ele serve como prática para comandos SQL, especialmente criação de tabelas, inserção de dados e consultas com INNER JOIN.

## Estrutura do Banco de Dados

- **cafes**: Cadastro dos cafés disponíveis, com nome, preço e status.
- **vendedores**: Cadastro dos vendedores, com nome e idade.
- **vendas**: Registro das vendas realizadas, relacionando cafés e vendedores, com data, quantidade e valor unitário.

## Funcionalidades

- Criação do banco de dados `loja_cafe`
- Criação das tabelas com chaves primárias e estrangeiras
- Inserção de dados de exemplo
- Consultas SQL para visualizar os dados e realizar INNER JOIN

## Exemplo de INNER JOIN

Consulta para mostrar o nome do café vendido em cada venda:

```sql
SELECT ve.id AS venda_id,
       c.nome AS nome_cafe,
       ve.quantidade,
       ve.valor_unitario
FROM vendas as ve 
INNER JOIN cafes AS c ON c.id = ve.idcafe;
```

## Autor

Projeto de prática SQL.
