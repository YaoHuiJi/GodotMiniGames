extends Control

signal reset_game


func _on_button_pressed():
	reset_game.emit()
	pass # Replace with function body.
