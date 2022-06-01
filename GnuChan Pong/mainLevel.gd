extends Node2D

var LeftGuy = 0
var RightGuy = 0
var countNumber = 5.0

var wait = false

onready var timerS = $Timer

func _on_leftArea_body_entered(body):
	if body.name == "Ball":
		RightGuy += 1
		if wait == false:
			wait = true

func _on_rightArea_body_entered(body):
	if body.name == "Ball":
		LeftGuy += 1
		if body.name == "Ball":
			if wait == false:
				wait = true

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

	var playerScore = ("| " + PlayerN.pNe + ": " + str(LeftGuy) + " | " + "GnuChan: " + str(RightGuy) + " |")
	$Panel/Score.text = playerScore
	
	if wait == true:
		if countNumber > 0:
			timerS.visible = not timerS.visible
			timerS.text = str(int(countNumber))
			countNumber -= 0.1
		else:
			timerS.visible = not timerS.visible
			$Ball.position = Vector2(640,360)
			wait = false
			countNumber = 5


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
