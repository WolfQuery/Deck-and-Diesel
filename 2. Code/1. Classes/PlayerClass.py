# Class defining the player character

class Player:
    Name: str # player name
    MaxHealth: int # maximum health of the character
    CurrentHealth: int # the current health of the character
    ArmourClass: int # how hard it is to hit the character
    AttackBonus: int # bonus the character gets to trying to hit another entity
    Damage: tuple # the spread of possibe damage the character can do after landing a hi on an entity

    def __init__(self, Name, MaxHealth, CurrentHealth, ArmourClass, AttackBonus, Damage) -> None: # initializes the class
        self.Name = "Boykisser"
        self.MaxHealth = 50
        self.CurrentHealth = self.MaxHealth
        self.ArmourClass = 16
        self.AttackBonus = 3
        self.Damage = (1, 4)