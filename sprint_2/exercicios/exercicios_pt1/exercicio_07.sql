select aut.nome

from autor as aut 

left join livro as lvr 
on aut.codautor = lvr.autor

group by aut.nome

having  COUNT(lvr.titulo) = 0

order by aut.nome 