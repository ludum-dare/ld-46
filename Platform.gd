extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# platform is exciting free it up
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	# need to let 
	queue_free()


# platform is entering the scene
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	pass # Replace with function body.
