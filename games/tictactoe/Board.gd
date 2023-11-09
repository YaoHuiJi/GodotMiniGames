extends Node2D

signal turn_over(x, y, state)

var boardSize = 412

func getLeftCorner() -> Vector2:
	var screen:Rect2 = get_viewport_rect()
	var sw = screen.size.x
	var sh = screen.size.y
	var x = sw/2.0 - boardSize/2.0
	var y = sh/2.0 - boardSize/2.0
	
	return Vector2(x, y)

func getGridPosition(gridX, gridY) -> Vector2:
	var leftCorner = getLeftCorner()
	var x = leftCorner.x + (gridY * boardSize/3)
	var y = leftCorner.y + (gridX * boardSize/3)
	return Vector2(x, y)
	
func _draw():
	#drawGridLine()
	pass

func drawGridLine():
	var leftCorner = getLeftCorner()
	var x = leftCorner.x
	var y = leftCorner.y
	var rec = Rect2(x, y, boardSize,boardSize)

	draw_rect(rec, Color.GRAY, false, 4)
	
	var r1_s = Vector2(x, y + boardSize/3.0)
	var r1_e = Vector2(x + boardSize, y + boardSize/3.0)
	draw_line(r1_s, r1_e, Color.GRAY, 4)
	
	var r2_s = Vector2(x, y + boardSize/3.0*2)
	var r2_e = Vector2(x + boardSize, y + boardSize/3.0*2)
	draw_line(r2_s, r2_e, Color.GRAY, 4)
	
	var c1_s = Vector2(x + boardSize/3.0, y )
	var c1_e = Vector2(x + boardSize/3.0, y + boardSize)
	draw_line(c1_s, c1_e, Color.GRAY, 4)
	
	var c2_s = Vector2(x + boardSize/3.0*2, y )
	var c2_e = Vector2(x + boardSize/3.0*2, y + boardSize)
	draw_line(c2_s, c2_e, Color.GRAY, 4)

func passSignal(x, y, state):
	turn_over.emit(x, y, state)
	pass

func reset():
	for child in get_children():
		child.reset()
	pass

func _ready():
	print("board ready")
	for row in range(3):
		for col in range(3):
			var piece = preload("res://games/tictactoe/Piece.tscn").instantiate()
			var textureSize = piece.texture.get_height()
			piece.position = getGridPosition(row, col)
			piece.scale.x = boardSize/3.0/textureSize
			piece.scale.y = boardSize/3.0/textureSize
			
			piece.gridX = row
			piece.gridY = col
			
			piece.state = 0
			
			piece.turn_over.connect(passSignal)
			
			piece.game = get_parent()
			
			add_child(piece)
	pass
