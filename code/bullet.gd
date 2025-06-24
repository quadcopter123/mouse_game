#written by jessie
#code controls bullet movement and rotation after being spawned by player
#CANNOT be used alone, must be created by seperate node and declare it's instant_velocity

extends Area2D
#makes var load first
@onready var instant_velocity

func _ready() -> void:
	look_at(instant_velocity + position)
	rotation_degrees += 90
	$kys.timeout.connect(die)
	$AnimatedSprite2D.play("default")
	Global.bullets_fired += 1
	#called once to make the bullets face the right way

#"deletes" node from scene tree
func die():
	queue_free()


func _physics_process(delta: float) -> void:
	position += instant_velocity
	#updates position each physics frame, 60fps by defualt
	#think you're not supposed to update position directly but like whatever

#function gets called when it exits the screen
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$kys.start()
	#once it leaves the screen start a timer to get rid of itself

#gets called if the bullet re-enters the screen
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$kys.stop()
	#stops and resets the timer
