extends KinematicBody2D

signal riseWater(yposition)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 350.0
const SPEED = 200
const AUTO_JUMP = true
var loop_on_x = true setget set_loop_on_x, get_loop_on_x
var velocity = Vector2()
var onPlatform = false
export var health = 100
signal game_over
var timer

var can_jump = false

func enable_jumping():
	$Timer.start()
	can_jump = true

func get_loop_on_x():
	return loop_on_x

func set_loop_on_x(new_val):
	loop_on_x = new_val

func _physics_process(delta):
	apply_gravity(delta)
	rise_water(delta)
	if Input.is_action_pressed("ui_left") and not is_on_floor():
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not is_on_floor():
		velocity.x = SPEED
	else: 
		velocity.x = velocity.x / 1.2
		
	var motion = velocity * delta
	
	if can_jump:
		if Input.is_action_pressed("ui_up") and is_on_floor():
			print("Jumped")
			velocity.y -= 600
			$JumpSound.play()
		elif AUTO_JUMP and is_on_floor():
			print("AutoJumped")
			velocity.y -= 600
			$JumpSound.play()
		if Input.is_action_pressed("ui_left") and not is_on_floor():
			velocity.x = -SPEED
		elif Input.is_action_pressed("ui_right") and not is_on_floor():
			velocity.x = SPEED
		else: 
			velocity.x = velocity.x / 1.2
		
	if loop_on_x:
		if position.x <= 0 and velocity.x < 0:
			position.x = get_viewport().get_visible_rect().size[0]
		if position.x >= get_viewport().get_visible_rect().size[0] and velocity.x > 0:
			position.x = 0
	else:
		if position.x <= 0 and velocity.x < 0:
			position.x = 0
			velocity.x = 0
		if position.x  >= get_viewport().get_visible_rect().size[0] and velocity.x > 0:
			position.x = get_viewport().get_visible_rect().size[0]
			velocity.x = 0
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
	Global.Player = self
	change_animation()
	pass

func rise_water(delta):
	if velocity.y <= 0:
		emit_signal("riseWater", position.y)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_body_entered(body):
	pass # Replace with function body.

func change_animation():
	if health >= 70:
		$AnimatedSprite.animation = "large"
	elif health >= 30:
		$AnimatedSprite.animation = "medium"
	else: 
		$AnimatedSprite.animation = "small"
	pass

func _on_player_water_death(body):
	health = 0
	print(health)
	change_animation()

func _on_player_coal(body):
	if health >= 70:
		health = 100
	else:
		health += 30
	print(health)
	change_animation()
	
func _on_player_log(body):
	if health >= 90:
		health = 100
	else:
		health += 10
	print(health)
	change_animation()
	
func _on_player_water(body):
	if health <= 30:
		health = 0
		emit_signal("game_over")
	else:
		health -= 30
	print(health)
	change_animation()


func _on_Timer_timeout():
	if health <= 5:
		health = 0
		emit_signal("game_over")
	else:
		health -= 5
	print(health)
	change_animation()
	pass # Replace with function body.
