select cdcli, nmcli,
 sum(qtd * vrunt) as gasto
from tbvendas
where status = 'Concluído'
group by nmcli
order by gasto desc
limit 1