CREATE VIEW dimCliente AS
SELECT
    idCliente as cliente,
    nomeCliente as nome,
    cidadeCliente as cidade,
    estadoCliente as estado,
    paisCliente as pais
FROM
    Clientes;

CREATE VIEW dimVendedor AS
SELECT
	idVendedor as vendedor,
	nomeVendedor as nome,
	sexoVendedor as sexo,
	estadoVendedor as estado
FROM 
	Vendedores;
	
CREATE VIEW dimCarro AS
SELECT
    idCarro as carro,
     kmCarro as km,
    classiCarro as classi,
    marcaCarro as marca,
    modeloCarro as modelo,
    anoCarro as ano,
    idCombustivel
FROM
    Carros

CREATE VIEW dimCombustivel AS 
SELECT 	
	idCombustivel as combustivel,
	tipoCombustivel

FROM Combustivel;

 CREATE VIEW dimEntrega AS
 SELECT 
 	idLocacao,
 	dataEntrega,
    horaEntrega
FROM Locacao 	


CREATE VIEW dimLocacao AS
SELECT
 	idCliente,
    idCarro,
    idVendedor
    qtdDiaria,
    vlrDiaria,
    dataLocacao,
    horaLocacao
  
FROM
    TbLocacao;