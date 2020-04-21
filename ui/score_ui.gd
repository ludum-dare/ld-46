extends Control

signal start_game
signal restart_game

var score = 0

func set_health(val):
	$healthbar.value = min(max(val, 0), 100)
	
func present_restart():
	$replay.visible = true

func _process(delta):
	$score.text = str(score)
	if Input.is_action_pressed("start"):
		if $start.visible:
			$start.visible = false
			emit_signal("start_game")
		elif $replay.visible:
			emit_signal("restart_game")

func _ready():
	pass # Replace with function body.

