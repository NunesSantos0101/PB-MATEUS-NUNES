select vd.nmvdd as vendedor,
    sum(v.qtd * v.vrunt) as valor_total_vendas,
    round(SUM(v.qtd * v.vrunt * vd.perccomissao), 0) / 100 as comissao
from tbvendedor as vd 
 left join tbvendas as v 
on vd.cdvdd = v.cdvdd
where v.status = 'Concluído'

group by 
    vd.nmvdd 
order by comissao desc