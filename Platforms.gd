extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPAWN_DISTANCE = 300
var scene = load("res://Platform.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var platforms = get_children()
	for platform in platforms:
		platform.connect("spawnPlatforms", self, "_on_OnScreenPlatform_spawnPlatforms")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OnScreenPlatform_spawnPlatforms():
	var platformInstance = scene.instance()
	var child = add_child(platformInstance)

	var spawnlocation = get_top_left_y()
	
	platformInstance.position.x = rng.randi_range(0, 600)
	platformInstance.position.y = spawnlocation + SPAWN_DISTANCE
	platformInstance.connect("spawnPlatforms", self, "_on_OnScreenPlatform_spawnPlatforms")
	

func get_top_left_y():
	var vtrans = get_canvas_transform()
	var top_left = -vtrans.get_origin() / vtrans.get_scale()
	var vsize = get_viewport_rect().size
	return Vector2(top_left - 0.5*vsize/vtrans.get_scale()).y
