select cdpro, nmpro
from tbvendas
WHERE dtven BETWEEN '2014-02-03 00:00:00' AND '2018-02-02 00:00:00'
GROUP BY 
    cdpro, nmpro
ORDER BY 
    COUNT(cdpro) DESC
limit 1