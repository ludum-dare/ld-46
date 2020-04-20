extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = 0
	limit_right = get_viewport().get_visible_rect().size[0]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var potential_limit_bottom = get_global_position()[1] + (get_viewport().get_visible_rect().size[1] / 2)
	if potential_limit_bottom < limit_bottom:
		limit_bottom = potential_limit_bottom

