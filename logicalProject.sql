CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    address VARCHAR(100),
    CONSTRAINT unique_cpf_client UNIQUE (cpf)
);

ALTER TABLE clients AUTO_INCREMENT = 1;

CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(45) NOT NULL,
    category ENUM('Eletronic', 'Clothes', 'Toys', 'Food', 'Furniture') NOT NULL,
    rating ENUM('0', '1', '2', '3', '4', '5')
);

CREATE TABLE paymentMethod(
	idPaymentMethod INT AUTO_INCREMENT,
    idClient_payment INT,
    method ENUM('Credit Card', 'Debit Card', 'Ticket'),
    methodNumber VARCHAR(100),
    brand VARCHAR(45) NOT NULL, 
    expirationDate DATE NOT NULL, 
    PRIMARY KEY (idPaymentMethod, idClient_payment),
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient_payment) REFERENCES clients(idClient)
);

CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idClient_orders INT,
    idPayment_orders INT,
    statusOrder ENUM('Canceled', 'Confirmed', 'Processing') DEFAULT 'Processing',
    descriptionOrder VARCHAR(255),
    shipping FLOAT,
    CONSTRAINT fk_orders_client FOREIGN KEY (idClient_orders) REFERENCES clients(idClient),
    CONSTRAINT fk_orders_payment FOREIGN KEY (idPayment_orders) REFERENCES paymentMethod(idPaymentMethod)
);

CREATE TABLE stock(
	idStock INT AUTO_INCREMENT PRIMARY KEY,
    warehouse VARCHAR(30) NOT NULL,
    address VARCHAR (100)
);

CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    sName VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (cnpj)
);

CREATE TABLE thirdPartySeller(
	idThirdPartySeller INT AUTO_INCREMENT PRIMARY KEY,
    tpsName VARCHAR(100) NOT NULL,
    cpf CHAR(11),
    cnpj CHAR(14),
    address VARCHAR(100) NOT NULL,
    reputation ENUM('0', '1', '2', '3', '4', '5'),
    CONSTRAINT unique_cpf_thirdPartySeller UNIQUE (cpf),
    CONSTRAINT unique_cnpj_thirdPartySeller UNIQUE (cnpj)
);

CREATE TABLE product_has_orders(
	idProduct_prodHorders INT,
    idOrder_prodHorders INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idProduct_prodHorders, idOrder_prodHorders),
    CONSTRAINT fk_prodHorders_product FOREIGN KEY (idProduct_prodHorders) REFERENCES product(idProduct),
    CONSTRAINT fk_prodHorders_orders FOREIGN KEY (idOrder_prodHorders) REFERENCES orders(idOrder)
);

CREATE TABLE product_has_stock(
	idProduct_prodHstock INT,
    idStock_prodHstock INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (idProduct_prodHstock, idStock_prodHstock),
    CONSTRAINT fk_prodHstock_product FOREIGN KEY (idProduct_prodHstock) REFERENCES product(idProduct),
    CONSTRAINT fk_prodHstock_stock FOREIGN KEY (idStock_prodHstock) REFERENCES stock(idStock)
);

CREATE TABLE product_has_supplier(
	idProduct_prodHsupplier INT,
    idSupplier_prodHsupplier INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (idProduct_prodHsupplier, idSupplier_prodHsupplier),
    CONSTRAINT fk_prodHsupplier_product FOREIGN KEY (idProduct_prodHsupplier) REFERENCES product(idProduct),
    CONSTRAINT fk_prodHsupplier_supplier FOREIGN KEY (idSupplier_prodHsupplier) REFERENCES supplier(idSupplier)
);

CREATE TABLE product_has_thirdPartySeller(
	idProduct_prodHtps INT,
    idTPSeller_prodHtps INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idProduct_prodHtps, idTPSeller_prodHtps),
    CONSTRAINT fk_prodHtps_product FOREIGN KEY (idProduct_prodHtps) REFERENCES product(idProduct),
    CONSTRAINT fk_prodHtps_tpseller FOREIGN KEY (idTPSeller_prodHtps) REFERENCES thirdPartySeller(idThirdPartySeller)
);