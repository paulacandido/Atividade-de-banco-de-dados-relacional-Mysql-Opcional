-- Crie um banco de dados para um serviço de uma loja de móveis e decoração, o nome do banco deverá ter o seguinte: db_nome minha_casa_mais_bonita, onde o sistema trabalhará com as informações dos produtos desta loja. --
CREATE DATABASE db_minha_casa_mais_bonita;

-- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desta loja. -- 
CREATE TABLE db_minha_casa_mais_bonita.tb_categoria(
nome varchar(45) unique not null,
tipo enum("Movél","Decoração"),
setor varchar(35), 
primary key (nome)
);
-- Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço desta loja(não esqueça de criara foreign key de tb_categoria nesta tabela). -- 
CREATE TABLE db_minha_casa_mais_bonita.tb_produto(
nome varchar(45) unique not null,
preco double(6,2),
quantidade int,
variacoes text(215),
FK_categoria varchar(45),
primary key (nome),
foreign key(FK_categoria) references tb_categoria(nome)
);

-- Crie a tabela Usuario e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_usuario para se trabalhar com o serviço desta loja. -- 
CREATE TABLE db_minha_casa_mais_bonita.tb_usuario(
nome varchar(45) not null,
email varchar(60) unique not null,
cpf numeric(11) unique not null,
senha varchar(15) not null, 
primary key (email,cpf)
);
-- Popule a tabela Categoria com até 5 dados. -- 
INSERT INTO db_minha_casa_mais_bonita.tb_categoria VALUES
("Toalha","Decoração","Mesa, cama e banho"),
("Guarda-Roupa","Movél","Quarto"),
("Armario","Movél","Cozinha"),
("Lençol","Decoração","Mesa, cama e banho"),
("Almofada","Decoração","Sala");

-- Popule a tabela Produto com até 8 dados. -- 
INSERT INTO db_minha_casa_mais_bonita.tb_produto VALUES 
("Toalha Meninas Poderosas",14.99,15,"Rosa, verde, azul","Toalha"),("Toalha Vingadores",9.99,2,"Colorida","Toalha"),
("Guarda-roupa solteiro duas portas",789.99,20,"Madeira Clara/Escura","Guarda-Roupa"),("Almofada Floral",4.99,100,"Amarelo, preto, cinza","Almofada"),
("Armario 6 portas 4 gravetas",1299.99,60,"Vinho, amarelo, verde","Armario"),("Jogo cama Vingadores",49.99,100,"Colorido","Lençol"),
("Kit cama Meninas Poderosas",49.99,20,"Colorido","Lençol"),("Kit cama Turma da Monica",49.99,15,"Cascão, Monica, Magali, Cebolinha, Sansão","Lençol");

-- Popule a tabela Usuario com até 5 dados. -- 
INSERT INTO db_minha_casa_mais_bonita.tb_usuario VALUES
("Monica Soares","Monicasoar@gmail.com",68362757000,"g0Q7%a#$bVUk"),
("Lucas Silva","SilvaLucas@gmail.com",19575323009,"ji2C1XwY"),
("Juliana Lima","Juli4naLi@outlook.com",42467412059,"g8DimYMR"),
("Claudete Luiz","ClaudeteLuiz34@gmail.com",62014050031,"Clau5678"),
("Beatriz Oliveira","BiazinhaPikena@yahoo.com",91731944098,"12345678");
-- Faça um select que retorne os Produtos com o valor maior do que 50 reais. -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_produto WHERE preco >50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais. -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_produto WHERE preco >3 and preco < 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B. -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_produto WHERE nome  LIKE "%B%";

-- Faça um select utilizando LIKE buscando os Usuários com a letra C. -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_usuario WHERE nome  LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e produto. -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_categoria
INNER JOIN db_minha_casa_mais_bonita.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria;

-- Faça um select que retorne a média de preços dos produtos -- 
SELECT AVG(preco) FROM db_minha_casa_mais_bonita.tb_produto;

-- Faça um select que retorne a soma de preços dos produtos -- 
SELECT SUM(preco)  FROM db_minha_casa_mais_bonita.tb_produto;

-- Faça um select que quantidade de produtos cadastrados na tabela -- 
SELECT COUNT(*) FROM db_minha_casa_mais_bonita.tb_produto;

-- Faça um select onde traga todos os Produtos de uma categoria específica  -- 
SELECT * FROM db_minha_casa_mais_bonita.tb_categoria
INNER JOIN db_minha_casa_mais_bonita.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria WHERE tb_categoria.nome = "Lençol";
