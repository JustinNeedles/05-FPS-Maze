extends Control

func _on_Play_pressed():				# if we restart, then unpause the game and the reload the scene
	Global.coinCollected = 0
	get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
