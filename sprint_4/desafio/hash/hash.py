import hashlib

texto = input("Digite uma palavra para mascaramento: ")

hash_obj = hashlib.sha1(texto.encode())

print("Hash SHA-1 da string:", hash_obj.hexdigest())
