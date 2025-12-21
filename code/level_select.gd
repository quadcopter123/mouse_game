extends CanvasLayer

var n = 0
@onready var forward_button = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/forward
@onready var back_button = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/back
var button_path = "CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/level_choice"
func _ready() -> void:
	if Global.farthest_level_reached > 10:
		forward_button.show()
	
	for n in 10:
		var curr_node = get_node(button_path + str(n))
		curr_node.text = str(n)

func _on_forward_pressed() -> void:
	if get_node(button_path + str(n)).text.to_int() >= 80:
		forward_button.hide()
	for n in 10:
		var curr_node = get_node(button_path + str(n))
		curr_node.text = str(curr_node.text.to_int() + 10)
	back_button.show()

func _on_back_pressed() -> void:
	if get_node(button_path + str(n)).text.to_int() <= 10:
		back_button.hide()
	for n in 10:
		var curr_node = get_node(button_path + str(n))
		curr_node.text = str(curr_node.text.to_int() - 10)
	forward_button.show()
