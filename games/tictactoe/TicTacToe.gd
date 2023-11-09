extends Node

var currentPlayer = 1

var pieces =[[0,0,0],[0,0,0],[0,0,0]]

func _ready():
	$TitleHud/Status.text = "Player: X"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_quit_pressed():
	Events.emit("Quit")
	call_deferred("free")
	pass # Replace with function body.
	
func check_winner():
	var winner = -1
	
	#判断行
	for row in range(3):
		if((pieces[row][0] == pieces[row][1] && pieces[row][0] == pieces[row][2]) && pieces[row][0] != 0 ):
			winner = pieces[row][0]
	
	#判断列
	for col in range(3):
		if((pieces[0][col] == pieces[1][col] && pieces[0][col]  == pieces[2][col]) && pieces[0][col]!=0):
			winner = pieces[0][col]
	
	#判断对角线
	if ((pieces[0][0] == pieces[1][1] && pieces[0][0] == pieces[2][2]) and pieces[0][0] != 0):
		winner = pieces[0][0]
	if ((pieces[0][2] == pieces[1][1] && pieces[0][2] == pieces[2][0]) and pieces[0][2] != 0):
		winner = pieces[0][2]
		
	var isDraw = true
	
	if winner == -1:
		#平局
		for row in range(3):
			for col in range(3):
				if(pieces[row][col]==0):
					isDraw = false
		
		if(isDraw):
			winner = 0
	
	
	return winner
	

func game_over(winner):
	$GameOver.show()
	$Board.hide()
	$TitleHud.hide()
	
	if winner == 0:
		$GameOver/Winner.text = "平局！"
	else:
		if winner == 1:
			$GameOver/Winner.text = "赢方是X！"	
		else:
			$GameOver/Winner.text = "赢方是O！"	
		
	pass

func _on_board_turn_over(x, y, state):
	var winner = check_winner()
	
	if(winner != -1):
		return
	
	pieces[x][y] = state
	
	winner = check_winner()
	
	if(winner != -1):
		game_over( winner )
		return 
	
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

func reset():
	pieces =[[0,0,0],[0,0,0],[0,0,0]]
	$Board.reset()
	pass

func _on_game_over_reset_game():
	reset()
	
	$GameOver.hide()
	$Board.show()
	$TitleHud.show()
