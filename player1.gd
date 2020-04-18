extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 350.0
const WALK_SPEED = 200
const AUTO_JUMP = false
var velocity = Vector2()
var onPlatform = false

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = velocity.x / 1.2
	var motion = velocity * delta
	if Input.is_action_just_pressed("ui_up") and onPlatform:
		velocity.y -= 700
	move_and_slide(velocity, Vector2(0, -1)) # Move down 1 pixel per physics frame
	if get_slide_count() == 0:
		onPlatform = false
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		onPlatform = true
		
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
