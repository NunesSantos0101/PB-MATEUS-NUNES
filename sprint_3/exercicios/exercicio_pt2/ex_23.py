class Calculo:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def soma(self):
        resultado = self.x + self.y
        print(f"somando {self.x}+{self.y} = {resultado}")
            

    def subtracao(self):
        resultado = self.x - self.y
        print(f"subtraindo {self.x}+{self.y} = {resultado}")
    

numeros = Calculo(4, 5)

numeros.soma()
numeros.subtracao()