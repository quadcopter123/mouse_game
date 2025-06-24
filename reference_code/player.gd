extends CharacterBody2D

signal hit

@export var speed = 50 # How fast the player will move (pixels/sec).
@export var can_move = true
var screen_size # Size of the game window.
var last


func _ready():
	screen_size = get_viewport_rect().size
	$player_anim.play("idle_down")


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if can_move:
		if Input.is_action_pressed("_right"):
			velocity.x += 1
			last = 1
		if Input.is_action_pressed("_left"):
			velocity.x -= 1
			last = 2
		if Input.is_action_pressed("_down"):
			velocity.y += 1
			last = 3
		if Input.is_action_pressed("_up"):
			velocity.y -= 1
			last = 4
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if last == 1:
			$player_anim.play("walk_right")
		if last == 2:
			$player_anim.play("walk_left")
		if last == 3:
			$player_anim.play("walk_down")
		if last == 4:
			$player_anim.play("walk_up")
	else:
		if last == 1:
			$player_anim.play("idle_right")
		if last == 2:
			$player_anim.play("idle_left")
		if last == 3:
			$player_anim.play("idle_down")
		if last == 4:
			$player_anim.play("idle_up")
	
	position += velocity * delta
	move_and_slide()
