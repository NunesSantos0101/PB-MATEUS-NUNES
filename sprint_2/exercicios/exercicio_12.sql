select dep.cddep, dep.nmdep, dep.dtnasc,
 sum(qtd * vrunt) as valor_total_vendas
from tbvendas as v 
join tbvendedor as vd 
on v.cdvdd = vd.cdvdd

join tbdependente as dep 
on dep.cdvdd = vd.cdvdd

where v.status = 'Concluído'

group by vd.nmvdd
order by valor_total_vendas 
limit 1