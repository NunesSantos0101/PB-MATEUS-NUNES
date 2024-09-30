select vendr.cdvdd, vendr.nmvdd
from tbvendas as ven 
join tbvendedor as vendr 
on ven.cdvdd = vendr.cdvdd

group by vendr.cdvdd, vendr.nmvdd, ven.status
order by count (vendr.nmvdd) desc
limit 1
