### É possivel sim reutilizar os containers.

Inclusive esse metodo é bastante útil para economizar tempo e recursos.

E o comando necessario para reiniciar um dos containers parados no  ambiente docker é

**docker start <container_id ou container_name>**

esse comando permite reiniciar um dos containers parados, tanto pelo **id** como também pelo **name** do container

No caso eu reiniciaria um dos container parados no meu ambiente seguindo este comando

**docker start a538b7621038**

que reiniciaria meu container da imagem carguru-images a partir do id