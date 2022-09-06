extends Node

#Play Victory Sounds
func _ready():
	$VictorySound.play()

## Go to the Hard Level Scene.
func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://hard.tscn")

## Quit
func _on_QuitButton_pressed():
	get_tree().quit()
