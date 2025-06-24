extends Node

var holding = false
var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Npc/Area2D").quest_started.connect(_quest_started)
	get_node("Sugar").collected.connect(_collected)
	get_node("Npc/Area2D").sugar_collected.connect(_completed)
	get_node("Npc/Area2D/Timer").timeout.connect(timer_done)
	get_node("Npc/Area2D").talking.connect(movement_lock)
	get_node("HttpsConnection").average.connect(timer_speed_change)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if holding:
		$Sugar.position = $Player.position
		$Player/Sprite2D.look_at($Npc/Area2D.global_position)
		$Player/Sprite2D.rotate(deg_to_rad(90))
	else:
		$Player/Sprite2D.look_at($Sugar/Area2D/CollisionShape2D.global_position)
		$Player/Sprite2D.rotate(deg_to_rad(90))

func _quest_started():
	$Player/Sprite2D.show()
	$Sugar/Sprite2D.show()
	$Player.can_move = true

func _collected():
	holding = true

func _completed():
	points += 1
	$Player/Sprite2D.hide()
	$Sugar/Sprite2D.hide()
	$Npc/Area2D/TextBox.text = "Thank you!"
	$Npc/Area2D/TextBox.show()

func timer_done():
	points += 1
	$Npc/Area2D/Mcguffin_points.text = str(points) + " points"

func movement_lock():
	$Player.velocity = Vector2(0, 0)
	$Player.can_move = false

func timer_speed_change(avg):
	if avg < 4 || avg > 8:
		#BG out of good range
		$Npc/Area2D/Timer.wait_time = 20
	else:
		$Npc/Area2D/Timer.wait_time = 10
	
	$Npc/Area2D/average_BG.text = "Avg BG = " + str(avg)
