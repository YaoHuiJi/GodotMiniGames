extends Control

@export var title = "未命名游戏"

# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleLabel.text = title
	pass # Replace with function body.


func _on_quit_pressed():
	Events.emit("Quit")
	get_parent().call_deferred("free")
	pass # Replace with function body.
