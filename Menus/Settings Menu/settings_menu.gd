class_name SettingsMenu
extends Control

# preloads the exit button
@onready var exit_button: Button = $MarginContainer/VBoxContainer/ExitButton

signal exit_settings_menu

# commects the signal for exiting the main menu and disallows any process or inpit register on tree enter
func _ready() -> void:
	set_process(false)
	exit_button.button_up.connect(on_exit_pressed)

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_cancel"):
		#exit_settings_menu.emit()

# emits a signal that the exit button was pressed in the settings menu (caught by the main menu)
# disallows any recieving of processes and inputs for the settings menu
func on_exit_pressed() -> void:
	exit_settings_menu.emit()
	set_process(false)
