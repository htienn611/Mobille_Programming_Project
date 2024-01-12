
CREATE TABLE Category (
    _id SERIAL PRIMARY KEY,
    nameCate VARCHAR(255)
);

CREATE TABLE Brand (
    _id SERIAL PRIMARY KEY,
    _name VARCHAR(255),
    idCat INT,
    status BOOLEAN,
    FOREIGN KEY (idCat) REFERENCES Category(_id)
);
CREATE TABLE Product (
    _id SERIAL PRIMARY KEY,
    image VARCHAR(255),
    _name VARCHAR(255),
    quantity INT,
    price BIGINT,
    des TEXT,
    idDiscount INT,
    status BOOLEAN,
    idCate INT,
    idBrand INT,
    FOREIGN KEY (idCate) REFERENCES Category(_id),
    FOREIGN KEY (idBrand) REFERENCES Brand(_id)
);

CREATE TABLE _User (
    phoneNumber VARCHAR(15) PRIMARY KEY,
    _name VARCHAR(255),
    sex BOOLEAN,
    birthday TIMESTAMP,
    address VARCHAR(255),
    status BOOLEAN
);

CREATE TABLE Account (
    phoneNumber VARCHAR(15) PRIMARY KEY,
    _password VARCHAR(255),
    _admin BOOLEAN,
    status BOOLEAN,
    FOREIGN KEY (phoneNumber) REFERENCES _User(phoneNumber)
);

CREATE TABLE _Order (
    _id SERIAL PRIMARY KEY,
    Status BOOLEAN,
    paymentMethods INT,
    phoneNumber VARCHAR(15),
    _date DATE,
    transportFee INT,
    FOREIGN KEY (phoneNumber) REFERENCES _User(phoneNumber)
);

CREATE TABLE Order_Details (
    quantityProduct INT,
    idOrder INT,
    idProduct INT,
    PRIMARY KEY (idOrder, idProduct),
    FOREIGN KEY (idOrder) REFERENCES _Order(_id),
    FOREIGN KEY (idProduct) REFERENCES Product(_id)
);

CREATE TABLE Promotion (
    _id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description VARCHAR(255),
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    status BOOLEAN,
    quantityForEach INT
);

CREATE TABLE Cart (
    phoneNumber VARCHAR(15),
    _id SERIAL PRIMARY KEY,
    status BOOLEAN,
    FOREIGN KEY (phoneNumber) REFERENCES _User(phoneNumber)
);

CREATE TABLE Cart_details (
    idCart INT,
    idProduct INT,
    quantity INT,
    discount double precision,
    PRIMARY KEY (idCart, idProduct),
    FOREIGN KEY (idCart) REFERENCES Cart(_id),
    FOREIGN KEY (idProduct) REFERENCES Product(_id)
);
CREATE TABLE Conversations (
    
	_id SERIAL PRIMARY KEY,
    idUs1 INT,
    idUs2 INT,
    status BOOLEAN
);

CREATE TABLE Messages (
    _id SERIAL PRIMARY KEY,
    senderID VARCHAR(15),
    _content TEXT,
    _timestamp TIMESTAMP,
    conversationID INT,
    status BOOLEAN,
    FOREIGN KEY (senderID) REFERENCES _User(phoneNumber),
    FOREIGN KEY (conversationID) REFERENCES Conversations(_id)
);

CREATE TABLE Payments (
    _id SERIAL PRIMARY KEY,
    _name VARCHAR(255),
    status BOOLEAN
);
