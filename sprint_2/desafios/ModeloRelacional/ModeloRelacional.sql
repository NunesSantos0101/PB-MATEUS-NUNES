-- CRIANDO TABELAS

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(255),
    cidadeCliente VARCHAR(255),
    estadoCliente VARCHAR(255),
    paisCliente VARCHAR(255)
);



CREATE TABLE Carros (
    idCarro INT PRIMARY KEY,
    classiCarro VARCHAR(255),
    marcaCarro VARCHAR(255),
    modeloCarro VARCHAR(255),
    anoCarro INT,
    kmCarro INT,
    idCombustivel INT,
    FOREIGN KEY (idCombustivel) REFERENCES Combustivel(idCombustivel)
);

CREATE TABLE Combustivel (
    idCombustivel INT PRIMARY KEY,
    tipoCombustivel VARCHAR(255)
);

CREATE TABLE Vendedores (
    idVendedor INT PRIMARY KEY,
    nomeVendedor VARCHAR(255),
    sexoVendedor INT,
    estadoVendedor VARCHAR(255)
);

CREATE TABLE Locacao (
    idLocacao INT PRIMARY KEY,
    idCliente INT,
    idCarro INT,
    idVendedor INT,
    dataLocacao DATE,
    horaLocacao TIME,
    qtdDiaria INT,
    vlrDiaria DECIMAL(10, 2),
    dataEntrega DATE,
    horaEntrega TIME,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idCarro) REFERENCES Carros(idCarro),
    FOREIGN KEY (idVendedor) REFERENCES Vendedores(idVendedor)
);

-- INSERINDO DADOS NAS TABELAS

INSERT INTO Clientes 
SELECT DISTINCT 
	idCliente,
	nomeCliente, 
	cidadeCliente, 
	estadoCliente, 
	paisCliente
FROM Tb_Locacao;


INSERT INTO Carros 
SELECT 
	idCarro,
	classiCarro, 
	marcaCarro, modeloCarro, 
	anoCarro, 
	kmCarro,
	idCombustivel
FROM Tb_Locacao
GROUP BY idCarro

INSERT INTO Combustivel 
SELECT DISTINCT 
	idCombustivel, 
	tipoCombustivel
FROM Tb_Locacao;

INSERT INTO Vendedores 
SELECT DISTINCT 
	idVendedor, 
	nomeVendedor, 
	sexoVendedor,
	estadoVendedor
FROM Tb_Locacao;


INSERT INTO Locacao 
SELECT idLocacao,
idCliente, 
idCarro, 
idVendedor, 
qtdDiaria,
vlrDiaria,
dataLocacao,
horaLocacao,
dataEntrega,
horaEntrega
FROM Tb_Locacao;
