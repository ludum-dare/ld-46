extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = $Camera2D
var scene = load("res://Platform.tscn")
var platform = scene.instance()
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(platform)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		camera.position.y += speed
	if Input.is_action_pressed("down"):
		camera.position.y -= speed

func spawn_position(bounds):
	return 
