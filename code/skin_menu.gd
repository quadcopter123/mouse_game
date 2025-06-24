extends Control
#written by jessie
#controls the skin menu function and presentation
var skin_list = ["Normal", "brisket","creature of steel", "zelda", "plumber man", "master mouse","artificial stupidity","he put me in a potato","ready for titanfall","teeny tiny nightmares","vessel","test","Bad time"]
var curr_skin = 0
var metal_gear_joke = ["snake","solid snake","no!\nthat is not! solid snake!","liquid snake","gaseous snake","plasma snake","bose einstein condensate\nsnake","venom snake","solidus snake","naked snake","big boss","little boss","medium boss"]
var metal_bool = false
var metal_int = 0
#there's a better way to do this I just know it
#I JUST REALIZED I CAN USE ARRAY.GET_LENGTH() AGGGGGHGAGHAGHSDAH
#something with dictionaries to combine skin_list and skins_texture
#or text is just the file name instead
#to add new skins you have to copy paste the img location in the array and put it's name in the same location in the skin array
#tedious and not very expandable
#godot sorts files alphabetically so something with folders and get_file_int() maybe
#if it works it works
var skins_texture = [load("res://sprites/player_mouse.png"),load("res://sprites/player_skins/bridget.png"),load("res://sprites/player_skins/creature_of_steel.png"),load("res://sprites/player_skins/link.png"),load("res://sprites/player_skins/mario_mouse.png"),load("res://sprites/player_skins/master_mouse.png"),load("res://sprites/player_skins/moron.png"),load("res://sprites/player_skins/potato_mouse.png"),load("res://sprites/player_skins/ready_for_titanfall.png"),load("res://sprites/player_skins/very_little_nightmare.png"),load("res://sprites/player_skins/vessel.png"),load("res://sprites/player_skins/you_cant_say_my_name.png"),load("res://sprites/player_skins/bad_time.png")]
@onready var _text_label = get_node("main_center_things/seperator/buttons_and_text/skin_description")
@onready var _texture_rect = get_node("main_center_things/seperator/sprite_container/sprite")

func _ready() -> void:
	if Global.skins_ran_through:
		$main_center_things/seperator/buttons_and_text/back.disabled = false

func _on_forward_pressed() -> void:
	#could definitley make a func for all this
	if metal_bool == false:
		curr_skin += 1
		if curr_skin > 12: #resets back to 0 looping the array
			curr_skin = 0
			$main_center_things/seperator/buttons_and_text/back.disabled = false
			Global.skins_ran_through = true
		if curr_skin == 11: #starts the metal gear joke
			metal_bool = true
			metal_int = 0
			_text_label.text = metal_gear_joke[metal_int]
			_texture_rect.set_texture(skins_texture[curr_skin])
		else:
			_text_label.text = skin_list[curr_skin]
			_texture_rect.set_texture(skins_texture[curr_skin])
	else: #the metal gear joke is a new skin selection but it's just changes the text
		metal_int += 1
		if metal_int > 12: #if all the jokes have been used go back to the normal array
			metal_bool = false
			curr_skin += 1
			_text_label.text = skin_list[curr_skin]
			_texture_rect.set_texture(skins_texture[curr_skin])
		else:
			_text_label.text = metal_gear_joke[metal_int]

#same as above but backwards ^
func _on_back_pressed() -> void:
	if metal_bool == false:
		curr_skin -= 1
		if curr_skin < 0:
			curr_skin = 12
		if curr_skin == 11:
			metal_bool = true
			metal_int = 12
			_text_label.text = metal_gear_joke[metal_int]
			_texture_rect.set_texture(skins_texture[curr_skin])
		else:
			_text_label.text = skin_list[curr_skin]
			_texture_rect.set_texture(skins_texture[curr_skin])
	else:
		metal_int -= 1
		if metal_int < 0:
			metal_bool = false
			curr_skin -= 1
			_text_label.text = skin_list[curr_skin]
			_texture_rect.set_texture(skins_texture[curr_skin])
		else:
			_text_label.text = metal_gear_joke[metal_int]

#Global is a script that any other script can access always from any point and time
func _on_back_to_menu_pressed() -> void:
	Global.skin = skins_texture[curr_skin]
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
