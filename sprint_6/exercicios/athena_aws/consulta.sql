WITH Decadas AS (
    SELECT 
        nome,
        sexo,
        SUM(total) AS total_nome,
        CAST((ano / 10) * 10 AS INT) AS decada
    FROM 
        meubanco.table_names
    WHERE 
        ano >= 1950
    GROUP BY 
        nome, sexo, CAST((ano / 10) * 10 AS INT)
),
RankedNomes AS (
    SELECT
        nome,
        sexo,
        total_nome,
        decada,
        ROW_NUMBER() OVER (PARTITION BY decada ORDER BY total_nome DESC) AS posicao
    FROM 
        Decadas
)
SELECT 
    nome,
    sexo,
    total_nome,
    decada
FROM 
    RankedNomes
WHERE 
    posicao <= 3
ORDER BY 
    decada, posicao;
