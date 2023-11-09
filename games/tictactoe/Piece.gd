extends Sprite2D

var state = 0
var gridX = 0
var gridY = 0

var game

signal turn_over

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = preload("res://games/tictactoe/pieces.png")
	region_enabled = true
	region_rect = Rect2(state * 16, 0, 16, 16)

func setGrid():
	region_rect = Rect2(game.currentPlayer * 16, 0, 16, 16)
	state = game.currentPlayer
	pass

func _on_button_pressed():
	if(state == 0):
		setGrid()
		turn_over.emit()
