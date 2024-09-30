select aut.codautor, aut.nome, count (lvr.publicacao) as quantidade_publicacoes
from autor as aut join livro as lvr 
on aut.codautor = lvr.autor 

group by aut.nome
order by quantidade_publicacoes desc
limit 1