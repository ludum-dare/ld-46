extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 350.0
const SPEED = 200
const AUTO_JUMP = true
var loop_on_x = true setget set_loop_on_x, get_loop_on_x
var velocity = Vector2()
var onPlatform = false

func get_loop_on_x():
	return loop_on_x

func set_loop_on_x(new_val):
	loop_on_x = new_val

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
		$JumpSound.play()
	elif AUTO_JUMP and is_on_floor():
		print("AutoJumped")
		velocity.y -= 600
		$JumpSound.play()
	if position.x <= 0 and velocity.x < 0:
		position.x = get_viewport().get_visible_rect().size[0]
	if position.x >= get_viewport().get_visible_rect().size[0] and velocity.x > 0:
		position.x = 0
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
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
