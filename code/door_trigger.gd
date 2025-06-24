extends Node2D
#written by jessie
#my attempt at making an easily reusable node
#handles input and moves obstacle based on editor selections

var move : Array[bool] = [false, false]
var initial_position
var activated = false
#makes editable in node view/2d view/you don't have to go into code to change these values
@export var speed = 1
@export var move_amt_x = 0
@export var move_amt_y = 2
##can change which thing you want to move
@onready var door = $spikes
#could be implemented better FIX ME maybe something with @export packedscene idk

func _ready() -> void:
	move_amt_x *= 16 #converts to tiles ex: 2 tiles down = 32 pixels
	move_amt_y *= 16
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_button"):
		move[0] = true
		move[1] = true
		initial_position = door.position
		$trigger/Sprite2D.play("on")
	#y movement
	if move[0]:
		if move_amt_y > 0:
			door.position.y += 1 * speed
			if door.position.y >= initial_position.y + move_amt_y:
				move[0] = false
		else:
			door.position.y -= 1 * speed
			if door.position.y <= initial_position.y + move_amt_y:
				move[0] = false
	#x movement
	if move[1]:
		if move_amt_x > 0:
			door.position.x += 1 * speed
			if door.position.x >= initial_position.x + move_amt_x:
				move[1] = false
		else:
			door.position.x -= 1 * speed
			if door.position.x <= initial_position.x + move_amt_x:
				move[1] = false

#only player bullet activates this
func _on_area_2d_area_entered(area: Area2D) -> void:
	if activated == false:
		move[0] = true
		move[1] = true
		initial_position = door.position
		$trigger/Sprite2D.play("on") #changes to green
		activated = true
