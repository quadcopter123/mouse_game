extends Control
#written by jessie
#takes values from controls and pushes them to Global
#Changing volume doesn't do anything rn ;-; FIX ME

func _on_button_pressed() -> void:
	if Global.started: #if they've already started the game go to the level they left
		get_tree().change_scene_to_file(str(Global.level))
	else: #if the game hasn't started go back to main menu
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

#pushes value to Global and changes the text : same for all sliders
func _on_master_volume_value_changed(value: float) -> void:
	Global.master_volume = value
	$CenterContainer/volume_controls/VBoxContainer/Label.text = "Master volume " + str("%0.0f" % value," / 100")

func _on_death_volume_value_changed(value: float) -> void:
	Global.death_volume = value
	$CenterContainer/volume_controls/VBoxContainer2/Label2.text = "Death sfx " + str("%0.0f" % value," / 100")

func _on_music_volume_value_changed(value: float) -> void:
	Global.music_volume = value
	$CenterContainer/volume_controls/VBoxContainer3/Label3.text = "music volume " + str("%0.0f" % value," / 100")
