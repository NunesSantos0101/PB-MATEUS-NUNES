class Pessoa:
    def __init__(self, id):
        self.id = id
        self.__nome = ""  

   
   
    def nome(self):
        return self.__nome

   
   
    def nome(self, nome):
        self.__nome = nome


pessoa = Pessoa(0)


pessoa.nome = "Mateus Nunes"

print(pessoa.nome)
