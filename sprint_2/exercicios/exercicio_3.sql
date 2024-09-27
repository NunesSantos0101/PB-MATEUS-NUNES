select count (lvr.titulo) as quantidade, edit.nome, endr.estado, endr.cidade
FROM editora as edit 
    inner JOIN livro as lvr 
    ON edit.codeditora = lvr.editora
    
    inner JOIN endereco as endr 
    on edit.endereco = endr.codendereco
    
GROUP BY 
    edit.codeditora, edit.nome, 
    endr.estado, endr.cidade
    
order by quantidade desc
limit 5