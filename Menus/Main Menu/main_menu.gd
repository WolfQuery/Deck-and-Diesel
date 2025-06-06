class_name MainMenu
extends Control
# main menu script

# preload allvariables onready
@onready var play_button: Button = $MarginContainer/VBoxContainer/PlayButton 
@onready var settings_button: Button = $MarginContainer/VBoxContainer/SettingsButton 
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton 
@onready var save_file_select: PackedScene = preload("res://Menus/SaveFile Select/Save File Select.tscn")
@onready var settings_menu: SettingsMenu = $SettingsMenu
@onready var margin_container: MarginContainer = $MarginContainer

func _ready() -> void:
	# connect the signal from the settings menu to check when the exit button is pressed 
	settings_menu.exit_settings_menu.connect(on_exit_settings_menu)

# when the play button is pressed switch to the preloaded level select menu
func _on_play_button_button_up() -> void:
	get_tree().change_scene_to_packed(save_file_select)

# when the settings button is pressed, disable & hide the margin container that houses all of the main menu
# allow the settings menu to register processes
# shows the settings menu
func _on_settings_button_button_up() -> void:
	margin_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true

# when the quit button is pressed, the game is closed and the program process quit
func _on_quit_button_button_up() -> void:
	get_tree().quit()

# when the exit button inside the settings menu is pressed, show the margin container back
# hide the settings menu
func on_exit_settings_menu() -> void:
	margin_container.visible = true
	settings_menu.visible = false
