extends CanvasLayer
#written by jessie
func _ready() -> void:
	Global.time_end = Time.get_ticks_msec()
	var time_for_real = 0
	for n in Global.level_time_array.size():
		time_for_real = time_for_real + Global.level_time_array[n]
	
	$CenterContainer/VBoxContainer/HBoxContainer/time.text = "Time: " + str("%0.2f" % time_for_real + "s")
	$CenterContainer/VBoxContainer/HBoxContainer2/Bullets_fired.text = "Bullets fired: " + str(Global.bullets_fired)
	$CenterContainer/VBoxContainer/HBoxContainer3/deaths.text = "Deaths: " + str(Global.deaths)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#FIX ME restructure menus so time only runs while player can move
#change menus process mode to when paused or something requires more research
func _on_play_again_pressed() -> void:
	Global.time_start = Time.get_ticks_msec()
	Global.bullets_fired = 0
	Global.level = "res://scenes/levels/level_0.tscn"
	Global.deaths = 0
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
