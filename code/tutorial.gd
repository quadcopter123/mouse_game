extends Control
#written by jessie
#plays some dialogue if it's the first time starting the game
var first_time = true

func _on_button_pressed() -> void:
	if first_time:
		$CenterContainer/Button.text = "-Move your mouse to move!\n-Click and drag to shoot!\n-Get to the end!\n-Water kills you\n-Have fun!"
		$CenterContainer/Button.alignment = anchor_left
		first_time = false
		Global.time_start = Time.get_ticks_msec()
	else:
		get_tree().change_scene_to_file("res://scenes/levels/level_0.tscn")
