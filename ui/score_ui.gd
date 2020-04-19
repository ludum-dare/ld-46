extends Control

var score = 0

func _process(delta):
	$score.text = str(score)

func _ready():
	pass # Replace with function body.

