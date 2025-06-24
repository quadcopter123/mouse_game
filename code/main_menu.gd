extends Control
#written by jessie
#handles main menu input

#quits game closes application stops .exe whatever
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	if Global.started: #go back to level the player left
		get_tree().change_scene_to_file(Global.level)
	else: #start the tutorial
		Global.started = true
		get_tree().change_scene_to_file("res://scenes/menus/tutorial.tscn")

#change to settings scene
#DISABLED RN bcs there's only one sfx
func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn")

#change to skin scene
func _on_skins_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/skin_menu.tscn")
