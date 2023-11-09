extends Node

var currentPlayer = 1

func _ready():
	$TitleHud/Status.text = "Player: X"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_quit_pressed():
	Events.emit("Quit")
	call_deferred("free")
	pass # Replace with function body.


func _on_board_change_player():
	match currentPlayer:
		1:
			currentPlayer = 2
		2:
			currentPlayer = 1
		_:
			currentPlayer = 0
	
	if currentPlayer == 1:
		$TitleHud/Status.text = "Player: X"
	else:
		$TitleHud/Status.text = "Player: O"
	pass # Replace with function body.
