------ MODELO DIMENSINAL



-- CRIANDO TABELAS

CREATE TABLE TbClientes (
    idCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(255),
    cidadeCliente VARCHAR(255),
    estadoCliente VARCHAR(255),
    paisCliente VARCHAR(255)
);



CREATE TABLE TbCarros (
    idCarro INT PRIMARY KEY,
    classiCarro VARCHAR(255),
    marcaCarro VARCHAR(255),
    modeloCarro VARCHAR(255),
    anoCarro INT,
    kmCarro INT,
    idCombustivel INT,
    FOREIGN KEY (idCombustivel) REFERENCES TbCombustivel(idCombustivel)
);

CREATE TABLE TbCombustivel (
    idCombustivel INT PRIMARY KEY,
    tipoCombustivel VARCHAR(255)
);

CREATE TABLE TbVendedores (
    idVendedor INT PRIMARY KEY,
    nomeVendedor VARCHAR(255),
    sexoVendedor INT,
    estadoVendedor VARCHAR(255)
);

CREATE TABLE TbEntrega (
    idLocacao INT PRIMARY KEY,
     dataEntrega DATE,
    horaEntrega TIME

);


CREATE TABLE TbLocacao (
    idLocacao INT PRIMARY KEY,
    idCliente INT,
    idCarro INT,
    idVendedor INT,
    qtdDiaria INT,
    vlrDiaria DECIMAL(10, 2),
    dataLocacao DATE,
    horaLocacao TIME,
    FOREIGN KEY (idCliente) REFERENCES TbClientes(idCliente),
    FOREIGN KEY (idCarro) REFERENCES TbCarros(idCarro),
    FOREIGN KEY (idVendedor) REFERENCES TbVendedores(idVendedor)
    FOREIGN KEY (idLocacao) REFERENCES TbEntrega(idLocacao)
);



-- INSERINDO DADOS NAS TABELAS

INSERT INTO TbClientes 
SELECT DISTINCT 
	idCliente,
	nomeCliente, 
	cidadeCliente, 
	estadoCliente, 
	paisCliente
FROM Tb_Locacao;


INSERT INTO TbCarros 
SELECT 
	idCarro,
	classiCarro, 
	marcaCarro, modeloCarro, 
	anoCarro, 
	kmCarro,
	idCombustivel
FROM Tb_Locacao
GROUP BY idCarro

INSERT INTO TbCombustivel 
SELECT DISTINCT 
	idCombustivel, 
	tipoCombustivel
FROM Tb_Locacao;

INSERT INTO TbVendedores 
SELECT DISTINCT 
	idVendedor, 
	nomeVendedor, 
	sexoVendedor,
	estadoVendedor
FROM Tb_Locacao;

INSERT INTO TbEntrega 
SELECT DISTINCT 
	  idLocacao,
      dataEntrega,
      horaEntrega
FROM Tb_Locacao;


INSERT INTO TbLocacao 
SELECT idLocacao,
	idCliente, 
	idCarro, 
	idVendedor, 
	qtdDiaria,
	vlrDiaria,
	dataLocacao,
	horaLocacao

FROM Tb_Locacao;

