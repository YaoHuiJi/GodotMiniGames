extends Control

signal openGame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_list_item_activated(index):
	var name = $GameList.get_item_text(index)
	openGame.emit(index,name)
	pass # Replace with function body.
