extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	(get_node("Consumables").get_node("Coal")).connect("player_coal", get_node("player1"), "_on_player_coal")
	$"CanvasLayer/Score UI".connect("start_game", self, "start")
	$music.play()

func start():
	$player1.enable_jumping()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	calc_score()
	$"CanvasLayer/Score UI".set_health($player1.health)

func calc_score():
	score = max(score, -int($player1.position.y / 100))
	$"CanvasLayer/Score UI/".score = score
