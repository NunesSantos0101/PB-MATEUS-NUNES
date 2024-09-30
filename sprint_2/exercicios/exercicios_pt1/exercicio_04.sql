select aut.nome, aut.codautor, aut.nascimento, count (lvr.titulo) as quantidade
FROM autor as aut 
    left JOIN livro as lvr 
    ON aut.codautor = lvr.autor
    
 GROUP BY 
    aut.codautor
    
order by nome