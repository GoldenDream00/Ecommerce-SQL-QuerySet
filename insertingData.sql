USE ecommerce;

DESC clients;
INSERT INTO clients(cName, cpf, address)
	VALUES('Maria M Silva', '12345678912', 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
		  ('Matheus O Pimentel', '73482173921', 'Rua 289 14, Centro - Cidade das Abelhas'),
          ('Ricardo F Silva', '29536220192', 'Av do Mel 56, Sul - Cidade das Abelhas'),
          ('Julia S França', '00364312650', 'Rua Koller 227, Norte - Cidade das Acácias'),
          ('Roberta G Assis', '78332264001', 'Av Norte Sul 32, Oeste - Cidade das Flores'),
          ('Isabela M Cruz', '88349208811', 'Rua Samambaia 342, Centro - Cidade das Flores');
SELECT * FROM clients;
SELECT c.cName, o.idOrder, o.statusOrder FROM clients c
JOIN orders o ON c.idClient = o.idClient_orders;

DESC product;
INSERT INTO product(pName, category)
	VALUES('Headset', 'Eletronic'),
		  ('Sofá Cama', 'Furniture'),
          ('Jaqueta de Couro', 'Clothes'),
          ('Café', 'Food'),
          ('Cubo Mágico', 'Toys');
SELECT * FROM product;

DESC paymentMethod;
INSERT INTO paymentMethod(idClient_payment, method, methodNumber, brand, expirationDate)
	VALUES(1, 'Ticket', '34191.79001 01043.510047 91020.150008 1 91120021050', 'Banco Itaú', '2022-09-18'),
		  (2, 'Ticket', '34191.79002 01044.510048 91021.150009 2 91120021690', 'Banco Itaú', '2022-09-20'),
          (3, 'Credit Card', '5508 0525 0076 3997', 'Master Card', '2024-02-19'),
          (4, 'Debit Card', '4485 0294 1396 6198', 'Visa', '2028-06-02');
SELECT * FROM paymentMethod;

DESC orders;
INSERT INTO orders(idClient_orders, idPayment_orders, statusOrder, descriptionOrder, shipping)
	VALUES(1, 1, 'Processing', 'Compra via app', 10.50),
		  (2, 2, 'Processing', 'Compra via app', 16.90),
          (3, 3, 'Canceled', 'Compra via web', NULL),
          (4, 4, 'Confirmed', 'Compra via loja', 0);
SELECT * FROM orders;

DESC product_has_orders;
INSERT INTO product_has_orders(idProduct_prodHorders, idOrder_prodHorders, quantity)
	VALUES(1, 1, 1),
		  (2, 2, 1),
          (3, 3, 1),
          (5, 4, 1);
SELECT * FROM product_has_orders;
SELECT o.idOrder, c.cname, o.statusOrder, o.shipping FROM clients c
INNER JOIN orders o ON c.idClient = o.idClient_orders;

DESC stock;
INSERT INTO stock(warehouse, address)
	VALUES('Matriz', 'Av Sudoeste 435, Espírito Santo'),
		  ('Filial Paulista', 'Av Senador 763, São Paulo'),
          ('Filial Carioca', 'Av Brasil 886, Rio de Janeiro'),
          ('Filial Curitiba', 'Av Central 222, Paraná'),
          ('Filial Bahia', 'Av do Feijão 500, Bahia');
SELECT * FROM stock;

DESC product_has_stock;
INSERT INTO product_has_stock(idProduct_prodHstock, idStock_prodHstock, quantity)
	VALUES(1, 1, 100),
		  (2, 2, 25),
          (3, 3, 150),
          (4, 4, 500),
          (5, 5, 240);
SELECT p.idProduct, p.pName, p.category, ps.quantity, s.warehouse FROM product_has_stock ps
LEFT JOIN product p ON ps.idProduct_prodHstock = p.idProduct
LEFT JOIN stock s ON ps.idStock_prodHstock = s.idStock;

DESC supplier;
INSERT INTO supplier(sName, cnpj, contact)
	VALUES('InfoTech LTDA', '11400937000170', '(64) 3638-6274'),
		  ('Saldão Móveis', '72031262000124', '(31) 3303-8162'),
          ('JT Imports', '91872538000141', '(46) 3777-3033'),
          ('Pãodaria Alimentos', '69041721000146', '(81) 2440-4225'),
          ('Magazine Brinquedos', '96204134000101', '(74) 2602-9481');
SELECT * FROM supplier;

DESC product_has_supplier;
INSERT INTO product_has_supplier(idProduct_prodHsupplier, idSupplier_prodHsupplier, quantity)
	VALUES(1, 1, 50),
		  (2, 2, 12),
          (3, 3, 150),
          (4, 4, 500),
          (5, 5, 210);
SELECT * FROM product_has_supplier;

DESC thirdPartySeller;
INSERT INTO thirdPartySeller(tpsName, cpf, cnpj, address, reputation)
	VALUES('Eletronica GM', NULL, '43521141000162', 'Av Tenente Federal 900, São Paulo', '4'),
		  ('José Herculano Pereira', '89932670123', NULL, 'Rua Guararape 32, Sergipe', '5'),
          ('Happy Child', NULL, '34800060000100', 'Av Brasil 800, Rio de Janeiro', '4');
SELECT * FROM thirdPartySeller;

DESC product_has_thirdPartySeller;
INSERT INTO product_has_thirdPartySeller(idProduct_prodHtps, idTPSeller_prodHtps, quantity)
	VALUES(1, 1, 50),
		  (2, 2, 13),
          (5, 3, 30);
SELECT * FROM product_has_thirdPartySeller;