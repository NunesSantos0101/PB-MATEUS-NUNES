import boto3

s3 = boto3.client('s3', region_name='us-east-1')


arquivo_local = './ligue180-primeiro-semestre-2024.csv'
bucket_name = 'desafio-compass-aws'

s3.upload_file(arquivo_local, bucket_name, 'ligue180-primeiro-semestre-2024.csv')
print("Arquivo enviado com sucesso!")

