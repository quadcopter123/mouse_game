#written by jessie
#Controls every aspect of player movement and presentation
extends CharacterBody2D

var movement = Vector2(0,0)
var can_move = true #slight pause after death so you don't fly into another death
var rng = RandomNumberGenerator.new()
@export var bullet : PackedScene
@export var speed_scale : float = 1.0 #scales how fast the player moves based on level
@export var bullet_speed_scale : float = 1.0
#@export makes it so you can put whatever you want in in the inspector
#has to declare variable type as packedscene so you can't put an img in there or something

#called once when it first gets loaded in scene/start of each level
#sets mouse mode and connects signals
func _ready() -> void:
	#captured means mouse goes back to centre every frame
	$Sprite2D.texture = Global.skin
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Camera2D/you_died.hide() #death message always there but now invisible
	#connects the signals from child nodes to functions in this script
	$Camera2D/you_died/Timer.timeout.connect(_on_timer_timeout)
	$wait.timeout.connect(_on_timer_timeout)
	can_move = false #pause at start of each level

#called every frame, currently no frame limiter implemented
func _process(delta: float) -> void:
	#bullet spawning
	if Input.is_action_just_released("left_click"):
		var b = bullet.instantiate() #unpacks the scene put in
		b.position = position #updates initial position to be where you are otherwise it would always start at 0,0
		b.instant_velocity = movement * bullet_speed_scale #changes childs variable
		owner.add_child(b) #officially adds child, but to owner so player movement doesn't affect it
		
	if Input.is_action_just_pressed("escape"):
		can_move = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$pause_menu.pause()

#called every time there's an input or something it's complicated with os and unix and stuff
#https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
#moves player and rotates sprite
func _unhandled_input(event: InputEvent) -> void:
	#makes sure the input is a mouse move
	var _mouse_input = event is InputEventMouseMotion
	if _mouse_input && can_move:
		movement = event.relative
		#since mouse is constrained need the relative movement of the mouse
		var prev_position = position
		#used for sprite angling
		position += movement * speed_scale
		#updates position by how much mouse was moved for a 1:1 movement system
		move_and_slide()
		#aligns sprite to look where it's going
		$Sprite2D.look_at(prev_position)
		$Sprite2D.rotation_degrees += 225

#called when node timer ends
#allows player to move again and removes gameover screen
func _on_timer_timeout():
	#unpause after death is over
	$Camera2D/you_died.hide()
	can_move = true

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	position = Vector2(0,0) #FIX ME implement checkpoint system
	can_move = false #enables pause
	$Camera2D/you_died.show() #game over screen is just an overlay
	$Camera2D/you_died/Timer.start() #starts the timer to when you can move again
	$death_1.play()
	Global.deaths += 1


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
		position = Vector2(0,0) #FIX ME implement checkpoint system
		can_move = false #enables pause
		$Camera2D/you_died.show() #game over screen is just an overlay
		$Camera2D/you_died/Timer.start() #starts the timer to when you can move again
		$death_1.play()
		Global.deaths += 1
