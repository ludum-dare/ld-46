extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	(get_node("Consumables").get_node("Coal")).connect("player_coal", get_node("player1"), "_on_player_coal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	calc_score()

func calc_score():
	score = max(score, -int($player1.position.y / 100))
	$"CanvasLayer/Score UI/".score = score
