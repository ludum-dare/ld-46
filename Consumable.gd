extends Node2D

signal spawnConsumables

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



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
	print("Entered a powerup!")
	pass # Replace with function body.
