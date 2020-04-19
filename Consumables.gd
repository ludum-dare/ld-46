extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPAWN_DISTANCE = 1500
var coal = load("res://Consumables/Coal.tscn")
var logitem = load("res://Consumables/Log.tscn")
var water = load("res://Consumables/Water.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var consumables = get_children()
	for consumable in consumables:
		consumable.connect("spawnConsumables", self, "_on_OnScreenConsumable_spawnConsumables")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OnScreenConsumable_spawnConsumables():
	var consumableInstance = coal.instance()
	var child = add_child(consumableInstance)

	var spawnlocation = get_top_left_y()
	
	consumableInstance.position.x = rng.randi_range(0, 600)
	consumableInstance.position.y = spawnlocation + SPAWN_DISTANCE
	consumableInstance.connect("spawnConsumable", self, "_on_OnScreenConsumable_spawnConsumables")
	

func get_top_left_y():
	var vtrans = get_canvas_transform()
	var top_left = -vtrans.get_origin() / vtrans.get_scale()
	var vsize = get_viewport_rect().size
	return Vector2(top_left - 0.5*vsize/vtrans.get_scale()).y
