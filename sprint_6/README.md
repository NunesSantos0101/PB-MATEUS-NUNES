# Sprint 6
Essa sprint abordou varios conteúdos de conceitos básicos do uso de ferramentas da **AWS** como:

- Amazon athena
- AWS glue
- Amazon EMR
- Amazon Redshift
- Amazon QuickSigh

e cursos de noções basicas de analytics na aws, onde vão ser importantes para o longo dessa caminhada até o desafio final na sprint 10. O desafio que construido foi a primeira parte de um todo, focando no uso de ferramentas como 

- python
- docker
- s3 da AWS

enviando dados para a raw zone do bucket s3, onde através de um script python rodado dentro de um ambiente docker foi feita o upload para o bucket e criado um volume em docker para armazenamento dos dados, esse foi o primeiro passo para a construção do data laker (que é o desafio final).
O primeiro passo  desse desafio foi bem tranquilo, eu estou empolgado nos próximos passos para a construção desse data laker e visualização do resultado final. Até breve.

## links para as pastas [certificados](./certificados/) e [evidências](./evidencias/)


## Algumas observações importantes:

#### 1. como vocês não tem acesso de como foi feito no console da AWS durante os exercícios do athena e lambda, na pasta de evidências encontra-se as  evidências com imagens do exercicio [Athena](./evidencias/exercicio_athena/)  e [Lambda](./evidencias/exercicio_lambda/) para realização e entendimento como foi feito no console da AWS durante esses exercícios

#### 2. uns dos dados fornecidos ultrapassavam os 100MB suportados pelo git hub, então em uma dayli onde tivemos a parcipação do julio, foi perguntado sobre essa questão, o mesmo disse que não tem problema se apagar para não dar problema, diante disso a pasta [data](./desafio/desafio_data-lake/data/), onde estavam os arquivos csv, esta apenas o arquivo series.csv.

#### 3. dentro do diretorio existe outro chamado **data** onde foram armazenados os arquivos csv, por motivos de organização.

#### 4. dentro do diretorio desafio encontra-se o arquivo **.gitignore** que contém um arquivo .env onde estão as variáveis de ambiente, que foram usadas para armazenar as credencias, por questão de seguança, decidi não enviar.
