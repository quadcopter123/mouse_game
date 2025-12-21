extends Button

const FILE_BEGIN = "res://scenes/levels/level_"
@onready var time_completed = 0

func _ready() -> void:
	text = str(get_index()) + "\n" + str(time_completed)
	if get_index() > Global.farthest_level_reached:
		disabled = true
	if Global.started && get_index() == 0:
		disabled = false


func _on_pressed() -> void:
	var next_level_path = FILE_BEGIN + text + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
