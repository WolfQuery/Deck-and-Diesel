from blessed import Terminal
import time

def load_game():
    print("Loading game...")
    time.sleep(1)

def save_game():
    print("Saving game...")

def quit_game():
    print("Quitting game...")

def MainMenu():
    term = Terminal()
    options = ["Load Game", "Save Game", "Quit"]
    actions = {
        "Load Game": load_game,
        "Save Game": save_game,
        "Quit": quit_game
    }
    selected = 0

    title_lines = [
        " ______   _______  _______  _            __      ______  _________ _______  _______  _______  _       ",
        "(  __  \\ (  ____ \\(  ____ \\| \\    /\\    /__\\    (  __  \\ \\__   __/(  ____ \\(  ____ \\(  ____ \\( \\      ",
        "| (  \\  )| (    \\/| (    \\/|  \\  / /   ( \\/ )   | (  \\  )   ) (   | (    \\/| (    \\/| (    \\/| (      ",
        "| |   ) || (__    | |      |  (_/ /     \\  /    | |   ) |   | |   | (__    | (_____ | (__    | |      ",
        "| |   | ||  __)   | |      |   _ (      /  \\/\\  | |   | |   | |   |  __)   (_____  )|  __)   | |      ",
        "| |   ) || (      | |      |  ( \\ \\    / /\\  /  | |   ) |   | |   | (            ) || (      | |      ",
        "| (__/  )| (____/\\| (____/\\|  /  \\ \\  (  \\/  \\  | (__/  )___) (___| (____/\\/\\____) || (____/\\| (____/\\",
        "(______/ (_______/(_______/|_/    \\/   \\___/\\/  (______/ \\_______/(_______/\\_______)(_______/(_______/",
        "                                                                                                       "
    ]

    print(term.enter_fullscreen)
    try:
        with term.cbreak(), term.hidden_cursor():
            while True:
                print(term.home + term.clear)
                
                # Print title at top, centered horizontally
                for i, line in enumerate(title_lines):
                    print(term.move_y(i) + term.center(term.red(term.bold(line))))
                
                # Calculate vertical position for menu options (some lines below title)
                start_y = len(title_lines) + 2
                
                for i, option in enumerate(options):
                    y = start_y + i
                    if i == selected:
                        print(term.move_y(y) + term.center(term.reverse(option)))
                    else:
                        print(term.move_y(y) + term.center(option))

                val = term.inkey()

                if val.name == "KEY_UP":
                    selected = (selected - 1) % len(options)
                elif val.name == "KEY_DOWN":
                    selected = (selected + 1) % len(options)
                elif val.name == "KEY_ENTER" or val == "\n":
                    chosen_option = options[selected]
                    print(term.exit_fullscreen)
                    actions[chosen_option]()  # Call the corresponding function
                    return chosen_option
    finally:
        print(term.exit_fullscreen)

if __name__ == "__main__":
    choice = MainMenu()
    print(f"You chose: {choice}")
