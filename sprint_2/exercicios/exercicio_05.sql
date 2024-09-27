select aut.nome from autor as aut 
        
join livro as lvr
    on aut.codautor = lvr.autor

join  editora as edit 
    on lvr.editora = edit.codeditora

join  endereco as endr 
    on edit.endereco = endr.codendereco

group by aut.nome, endr.estado

having estado <> 'PARANÁ'

ORDER BY edit.nome desc