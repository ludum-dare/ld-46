extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	calc_score()

func calc_score():
	score = max(score, -int($player1.position.y / 100))
	$"CanvasLayer/Score UI/".score = score
