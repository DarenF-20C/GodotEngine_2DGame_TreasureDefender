extends Node

		
func _ready():
	$BGM.play()
	
##Restart and Go to the Main Scene.

func _on_EasyBtn_pressed():
	$OnClicked.play()
	get_tree().paused = false
	get_tree().change_scene("res://main.tscn")

func _on_HardBtn_pressed():
	$OnClicked.play()
	get_tree().paused = false
	get_tree().change_scene("res://hard.tscn")
