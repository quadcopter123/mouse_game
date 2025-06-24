#written by jessie
#controls ending the level and moving to next one 

extends Node2D
#@exports allow changing certain parts in editor
var x = 0
@export var amplitude = 0.1
@export var speed = 0.05
const FILE_BEGIN = "res://scenes/levels/level_"
@export var final_level_int = 1
#const for shorter file searching
#all levels are stored in the same format in the same folder
#probably volatile but it works and I'm lazy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#60 times per second
func _physics_process(delta: float) -> void:
	#adds 1 to x each frame to create a sin wave
	x += 1
	#changes the y position based on a sin wave to create an alluring floating effect
	position.y += sin(x * speed) * amplitude

#when player enters
func _on_body_entered(body: Node2D) -> void: #FIX ME make so only player can trigger
	#gets current level path
	var current_scene_file = get_tree().current_scene.scene_file_path
	#converts current level path to a number
	var next_level_number = current_scene_file.to_int() + 1
	#gets next level path using next level number
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	#changes current level to the next level
	#if last level end game
	if next_level_number == final_level_int + 1:
		get_tree().change_scene_to_file("res://scenes/menus/win_screen.tscn")
	else:
		Global.level = next_level_path
		get_tree().change_scene_to_file(next_level_path)
