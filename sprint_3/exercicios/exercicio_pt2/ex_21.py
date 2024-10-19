class Passaro:
    def __init__(self, voar):
        self.voar = voar
      


class Pato(Passaro):
    def __init__(self, voar, som):
        super().__init__(voar)
        self.som = som

    def __str__(self):
        return f"pato\n{self.voar}\npato emitindo som...\n{self.som}"

class Pardal(Passaro):
    def __init__(self, voar, som):
        super().__init__(voar)
        self.som = som

    def __str__(self):
        return f"Pardal\n{self.voar}\nPardal emitindo som {self.som}"

pato = Pato("Voando...", "quack quack")
pardal = Pardal("Voando...", "Piu Piu")
print(pato)
print(pardal)