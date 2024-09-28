select cdpro, nmcanalvendas, nmpro,
sum(qtd) as quantidade_vendas
from tbvendas
where status = 'Concluído'

GROUP BY 
    cdpro, nmcanalvendas, nmpro
order by quantidade_vendas
limit 10