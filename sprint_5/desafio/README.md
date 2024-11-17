# Desafio

para começar o desafio baixei meu arquivo csv no site **gov.com** e verificando que meu arquivo era unico dei proseguimento.

no console da **AWS** comecei a ciração do bucket seguidos na imagens abaixo

## AWS criação de bucket

###  2. com o console aberto e dentro do serviço do **S3** cliquei em criar bucket
![create bucket](/sprint_5/evidencias/desafio_aws/criando_bucketS3/1_criando_bucket.png)



### 3. Em seguida adiciono o nome ao bucket o qual coloquei como **desafio-compass-aws**, tudo foi deixado como padrão coloquei somente o nome do bucket e escolhi a região **us-east-1** 
![bucket name](/sprint_5/evidencias/desafio_aws/criando_bucketS3/2_bucket_name.png)

###  4. Rolo até o final da página e clico em **criar bucket**

![criar bucket](/sprint_5/evidencias/desafio_aws/criando_bucketS3/3_criar_bucket.png)

###  5. E com isso meu bucket é criado como na imagem abaixo

![rewie](/sprint_5/evidencias/desafio_aws/criando_bucketS3/4_bucket_criado.png)



## Conectando meu repositorio local com a AWS
## Depois de concluir os passo anteriores fiz a conexão do repositorio local com a AWS para poder estar enviando meu arquivos para o bucket S3

### OBS: Algumas imagens  abaixo contém dados sensíveis, e por questão de segurança foram borradas, mas não afetam o entendimento do passo a passo


### 1. dentro do **Vscode** com a ajuda do **WSL** e com o AWScli instalado fiz as configurações 
![aws config](/sprint_5/evidencias/desafio_aws/config_aws/1_conectando_aws.png)

### 2. Em seguida copiei  as chaves de acessos e o token que usarei mais tarde, as chaves que fora usadas foram as temporarias pois a dos usuarios **IAM** não nestavam funcionando, então foi dito para seguir desta forma pelo time técnico

![credenciais](/sprint_5/evidencias/desafio_aws/config_aws/3_copiando_token.jpg)

### 3. Dentro do repositorio e com o **aws confifure** aberto colei as chaves, como não apareceu a opção de adionar token tive que usar o editor do Linux **Vim** para adicionar manualmente.

![cpie credencial](/sprint_5/evidencias/desafio_aws/config_aws/2_adicionando_credenciais_temporarias.jpg)
### 4. Dentro do editor do Linux Vim adicionei manualmente a opção de token e adicionei o teken que havia copiado antes

![adicionando token](/sprint_5/evidencias/desafio_aws/config_aws/4_adicionando_token_vim.jpg)

### Com as configurações da aws feitas segui para o próximo passo

## Enviando data frame obtido no site do gov.com para o bucket ultilizando a biblioteca boto3 do python

   ### 1. com o data frame no meu roepositorio enviei para o bucket s3 usando o boto3

   ![enviando file para o bucket](/sprint_5/evidencias/desafio_aws/enviando_files_csv/1_enviando_df_gov.png)

### 2. depois de executar o codigo descrito na imagem a cima o arquivo aparece no meu bucket

![arquivo bucket](/sprint_5/evidencias/desafio_aws/enviando_files_csv/2_df_gov_bucket.png)

## Com o arquivo no bucket eu comecei a manipulação de dados usando o pandas do python

### 1. Fiz o script de manipulação, seguindo os requisitos proposto no desafio, retonando assim uma saida que foi o arquivo.csv.

![data manipulation](/sprint_5/evidencias/desafio_aws/data_manipulation/data_manipulado_codigo.png)


## enviando arquivo.csv gerado no codigo anterior

### 1. ultilizando a bilbiote do boto3 enviei o arquivo obtido do codigo

![enviando file](/sprint_5/evidencias/desafio_aws/enviando_files_csv/3_enviando_df_manipulado_bucket.png)

### 2. após executar o codigo seguido na imagem a cima, o arquivo.csv manipulado aparece no bucket

![arquivo bucket](/sprint_5/evidencias/desafio_aws/enviando_files_csv/4_arquivo_manipulado_bucket.png)



## OBSERVAÇÃO: Como meu data frame do gov.com ultrapassa os 100M suportado pelo git hub, tive que usar o git Large para envio do mesmo para o repositorio, então por conta disso está com um arquivo a mais **"gitattributes"**