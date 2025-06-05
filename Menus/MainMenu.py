# the main menu that should be displayed on game start

from blessed import Terminal


def MainMenu():
    term = Terminal()
    print(term.home + term.clear + term.move_y(term.height // 2) + term.enter_fullscreen)
    print(term.red_on_white(term.center(term.bold("Deck & Diesel"))))