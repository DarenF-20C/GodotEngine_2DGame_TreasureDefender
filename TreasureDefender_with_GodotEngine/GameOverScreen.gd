extends Node

func _ready():
	$GameOver.play()

##Restart and Go to the Main Scene.
func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main_page.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
