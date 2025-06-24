extends Node
#written by jessie
#Global is autoloaded in project settings so everything else can access it whenever
#used for values that transfer between scenes

@onready var skin = load("res://sprites/player_mouse.png") #default skin
@onready var started = false
@onready var level = "res://scenes/levels/level_0.tscn"
@onready var master_volume = 100
@onready var music_volume = 100
@onready var death_volume = 100
@onready var _bus := AudioServer.get_bus_index("Master") #FIX ME idk how this works
@onready var bullets_fired = 0
@onready var time_start = 0
@onready var time_end = 0
@onready var deaths = 0
@onready var skins_ran_through = false
var value

#FIX ME idk how audio works
func _ready() -> void:
	#value = db_to_linear(AudioServer.get_bus_volume_db(_bus))
	pass

#FIX ME only change volume when volume gets change also make it work
func _process(delta: float) -> void:
	#AudioServer.set_bus_volume_db(_bus, db_to_linear(value))
	pass
