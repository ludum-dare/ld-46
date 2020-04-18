extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 350.0
const SPEED = 200
const AUTO_JUMP = true
var velocity = Vector2()
var onPlatform = false

func _physics_process(delta):
	apply_gravity(delta)
	if Input.is_action_pressed("ui_left") and not is_on_floor():
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not is_on_floor():
		velocity.x = SPEED
	else: 
		velocity.x = velocity.x / 1.2
		
	var motion = velocity * delta
	if Input.is_action_pressed("ui_up") and is_on_floor():
		print("Jumped")
		velocity.y -= 600
	elif AUTO_JUMP and is_on_floor():
		print("AutoJumped")
		velocity.y -= 600
	move_and_slide(velocity, Vector2(0, -1)) # Move down 1 pixel per physics frame
	# if get_slide_count() == 0:
	# 	onPlatform = false
	# for i in range(get_slide_count()):
	#	var collision = get_slide_collision(i)
	# 	onPlatform = true

func apply_gravity(delta):
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += delta * GRAVITY
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
