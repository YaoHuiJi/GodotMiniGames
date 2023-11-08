extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.addListener("Quit",quit_to_main)
	pass # Replace with function body.
	
func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		Events.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func quit_to_main():
	print("退回主界面")
	$MainMenu.show()

func _on_main_menu_open_game(gameId,gameName):
	$MainMenu.hide()
	
	match gameId:
		0:
			print("打开游戏: ", gameName)
			var tictactoe = preload("res://games/tictactoe/TicTacToe.tscn").instantiate()
			add_child(tictactoe)
		_:
			print("游戏还没实现：",gameId)
		
	pass # Replace with function body.
