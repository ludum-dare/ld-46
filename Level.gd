extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"CanvasLayer/Score UI".connect("start_game", self, "start")
	$music.play()

func start():
	$player1.enable_jumping()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	calc_score()

func calc_score():
	score = max(score, -int($player1.position.y / 100))
	$"CanvasLayer/Score UI/".score = score
