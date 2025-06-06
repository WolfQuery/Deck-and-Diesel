class_name HotkeyRebindButton
extends Control

# preloades the label and button
@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button

# allows the editing of this variable via the node menu
@export var action_name: String

# disables registering any unhandled key inputs
# calls the set_action_name 
func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

# labels any unassigned buttons as unassigned
func set_action_name() -> void:
	label.text = "unassigned"
	
	#TODO: assign any inputs to match according to the example
	match action_name:
		"placeholder":
			label.text = "placeholder"
	# EXAMPLE: 
		# "move_left":
			# label.text = "move left"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)

	if action_events.is_empty():
		button.text = "unassigned"
		return

	var action_event = action_events[0]
	button.text = action_event.as_text()



func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		button.text = "press any key"
		set_process_unhandled_key_input(toggled_on)
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		set_text_for_key()

func _unhandled_key_input(event: InputEvent) -> void:
	rebind_action_key(event)
	button.button_pressed = false

func rebind_action_key(event: InputEvent) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()
