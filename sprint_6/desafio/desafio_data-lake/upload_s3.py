import boto3
import os
from datetime import datetime


s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
    aws_session_token=os.getenv('AWS_SESSION_TOKEN'),
    region_name=os.getenv('AWS_DEFAULT_REGION')
)

data_processamento = datetime.now()
ano = data_processamento.strftime("%Y")
mes = data_processamento.strftime("%m")
dia = data_processamento.strftime("%d")

nome_bucket = "data-lake-mateus"
raw_zone_movies = f"Raw/Local/CSV/Movies/{ano}/{mes}/{dia}"
raw_zone_series = f"Raw/Local/CSV/Series/{ano}/{mes}/{dia}"

arquivo_movies = "data/movies.csv" 
arquivo_series = "data/series.csv"  


s3.upload_file(arquivo_movies, nome_bucket, f"{raw_zone_movies}/movies.csv")
print("Arquivo de filmes enviado com sucesso!")



s3.upload_file(arquivo_series, nome_bucket, f"{raw_zone_series}/series.csv")
print("Arquivo de séries enviado com sucesso!")

