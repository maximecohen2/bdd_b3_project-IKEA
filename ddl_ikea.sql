/*
DROP TABLE City;
DROP TABLE Civility;
DROP TABLE StatusAccount;
DROP TABLE Categorie;
DROP TABLE PropertyType;
DROP TABLE Piece;
DROP TABLE ContractStaff;
DROP TABLE LevelStaff;
DROP TABLE TypeStaff;
DROP TABLE TVA;
DROP TABLE Person;
DROP TABLE Account;
DROP TABLE Address;
DROP TABLE Store;
*/

CREATE TABLE City
(
  city_id INT NOT NULL,
  city_name VARCHAR(100) NOT NULL,
  city_code VARCHAR(5) NOT NULL,
  CONSTRAINT PK_city_id PRIMARY KEY (city_id)
);

CREATE TABLE Civility
(
  civility_id INT NOT NULL,
  civility_label VARCHAR(50) NOT NULL,
  CONSTRAINT PK_civility_id PRIMARY KEY (civility_id)
);

CREATE TABLE StatusAccount
(
  statusaccount_id INT NOT NULL,
  statusaccount_label VARCHAR(10) NOT NULL,
  CONSTRAINT PK_statusaccount_id PRIMARY KEY (statusaccount_id)
);

CREATE TABLE Categorie
(
  categorie_id INT NOT NULL,
  categorie_label VARCHAR(100) NOT NULL,
  categorie_parent INT,
  CONSTRAINT PK_categorie_id PRIMARY KEY (categorie_id),
  CONSTRAINT FK_categorie_parent FOREIGN KEY (categorie_parent) REFERENCES Categorie(categorie_id)
);

CREATE TABLE PropertyType
(
  propertytype_id INT NOT NULL,
  propertytype_label VARCHAR(50) NOT NULL,
  CONSTRAINT PK_propertytype_id PRIMARY KEY (propertytype_id)
);

CREATE TABLE Piece
(
  piece_id INT NOT NULL,
  piece_ref VARCHAR(10) NOT NULL,
  CONSTRAINT PK_piece_id PRIMARY KEY (piece_id)
);

CREATE TABLE ContractStaff
(
  contractstaff_id INT NOT NULL,
  contractstaff_label VARCHAR(50),
  CONSTRAINT PK_contractstaff_id PRIMARY KEY (contractstaff_id)
);

CREATE TABLE LevelStaff
(
  levelstaff_id INT NOT NULL,
  levelstaff_label VARCHAR(50),
  CONSTRAINT PK_levelstaff_id PRIMARY KEY (levelstaff_id)
);

CREATE TABLE TypeStaff
(
  typestaff_id INT NOT NULL,
  typestaff_label VARCHAR(50),
  CONSTRAINT PK_typestaff_id PRIMARY KEY (typestaff_id)
);

CREATE TABLE TVA
(
  tva_id INT NOT NULL,
  tva_value DEC(5, 2) NOT NULL,
  CONSTRAINT PK_tva_id PRIMARY KEY (tva_id)
);

CREATE TABLE Person
(
  person_id INT NOT NULL,
  person_firstname VARCHAR(50) NOT NULL,
  person_lastname VARCHAR(50) NOT NULL,
  person_phone VARCHAR(12),
  person_civility INT NOT NULL,
  CONSTRAINT PK_person_id PRIMARY KEY (person_id),
  CONSTRAINT FK_person_civility FOREIGN KEY (person_civility) REFERENCES Civility(civility_id)
);

CREATE TABLE Account
(
  account_id INT NOT NULL,
  account_email VARCHAR(50) NOT NULL,
  account_password VARCHAR(100) NOT NULL,
  account_creation_date DATE NOT NULL,
  account_last_connection DATE NOT NULL,
  account_status INT NOT NULL,
  account_person INT NOT NULL,
  CONSTRAINT PK_account_id PRIMARY KEY (account_id),
  CONSTRAINT FK_account_status FOREIGN KEY (account_status) REFERENCES StatusAccount(statusaccount_id),
  CONSTRAINT FK_account_person FOREIGN KEY (account_person) REFERENCES Person(person_id)
);

CREATE TABLE Address
(
  address_id INT NOT NULL,
  address_name VARCHAR(50) NOT NULL,
  address_line1 VARCHAR(100) NOT NULL,
  address_line2 VARCHAR(100),
  address_city INT NOT NULL,
  CONSTRAINT PK_address_id PRIMARY KEY (address_id),
  CONSTRAINT FK_address_city FOREIGN KEY (address_city) REFERENCES City(city_id)
);

CREATE TABLE Store
(
  store_id INT NOT NULL,
  store_label VARCHAR(50) NOT NULL,
  store_turnover DEC(20, 2),
  store_address INT NOT NULL,
  CONSTRAINT PK_store_id PRIMARY KEY (store_id),
  CONSTRAINT FK_store_address FOREIGN KEY (store_address) REFERENCES Address(address_id)
);

CREATE TABLE PersonAddress
(
  personaddress_id INT NOT NULL,

);

/*
CREATE TABLE Client
(
  client_id INT NOT NULL,
  client_news_email NUMBER(1) NOT NULL,
  client_news_sms NUMBER(1) NOT NULL,
  client_news_mail NUMBER(1) NOT NULL,

);*/



