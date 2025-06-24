extends Control
#written by jessie
func _ready() -> void:
	Global.time_end = Time.get_ticks_msec()
	$CenterContainer/VBoxContainer/time.text = "Time: " + str("%0.2f" % ((Global.time_end - Global.time_start)/1000.0)) + "s"
	$CenterContainer/VBoxContainer/Bullets_fired.text = "Bullets fired: " + str(Global.bullets_fired)
	$CenterContainer/VBoxContainer/deaths.text = "Deaths: " + str(Global.deaths)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#FIX ME restructure menus so time only runs while player can move
#change menus process mode to when paused or something requires more research
func _on_play_again_pressed() -> void:
	Global.time_start = Time.get_ticks_msec()
	Global.bullets_fired = 0
	Global.level = "res://scenes/levels/level_0.tscn"
	Global.deaths = 0
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
