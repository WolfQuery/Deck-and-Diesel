# Clears the console to improve readability.

import os

def clear_console():
    os.system('cls' if os.name == 'nt' else 'clear')