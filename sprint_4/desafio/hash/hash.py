import hashlib

texto = input("Digite uma palavra para mascaramento: ")

hash_obj = hashlib.sha1(texto.encode())

print("Hash da palavra:", hash_obj.hexdigest())
