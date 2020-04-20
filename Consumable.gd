extends Node2D

signal spawnConsumables
signal player_coal
signal player_log
signal player_water

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var consumable_type = "Not Specified" setget set_consumable_type, get_consumable_type

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Player.connect("player_coal", Global.Player, "_on_player_coal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_consumable_type(new_type):
	consumable_type = new_type
	
func get_consumable_type():
	return consumable_type

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	var value = get_bottom_left()
	if (position.y > value):
		emit_signal("spawnConsumables")
		queue_free()
	


# platform is entering the scene
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	pass
	
func get_bottom_left():
	var vtrans = get_canvas_transform()
	var top_left = -vtrans.get_origin() / vtrans.get_scale()
	var vsize = get_viewport_rect().size
	return Vector2(top_left + 0.5 * vsize / vtrans.get_scale()).y


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Entered a powerup!")
		print(consumable_type)
		if (consumable_type == "Coal"):
			hide()
			Global.Player._on_player_coal("")
		elif (consumable_type == "Log"):
			hide()
			Global.Player._on_player_log("")
		elif (consumable_type == "Water"):
			hide()
			Global.Player._on_player_water("")
			
	pass # Replace with function body.
