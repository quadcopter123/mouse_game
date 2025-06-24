extends CenterContainer
#written by jessie
#should be made into it's own node, only used on player for now
#handles pause menu selections
#only processes while the tree is paused, set in editor

#hide on start
func _ready() -> void:
	hide()

#pauses game and frees mouse and shows itself
func pause():
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	show()

#unpauses game after capturing mouse and hiding and letting player move
func _resume():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
	get_parent().can_move = true
	get_tree().paused = false

func _on_resume_pressed() -> void:
	_resume()

func _on_settings_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn")

#resets player to origin in case player softlocks
func _on_reset_pressed() -> void:
	get_parent().position = Vector2(0,0)
	_resume()

#returns to main menu
func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
