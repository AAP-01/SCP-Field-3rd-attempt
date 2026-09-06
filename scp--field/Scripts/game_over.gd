extends Control

@onready var game_over_message: Label = $"Game Over Message"
@onready var restart: Button = $HBoxContainer/Restart
@onready var menu: Button = $HBoxContainer/Menu

func _ready() -> void:
	change_game_over_text()
	
func change_game_over_text() -> void:
	if SingletonGameStats.win:
		game_over_message.text = "You escaped!"
	else:
		game_over_message.text = "You died..."
