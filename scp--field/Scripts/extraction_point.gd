extends Area2D

@onready var interact_prompt: Node2D = $"Interact Prompt"

func _on_body_entered(body: Node2D) -> void:	# This triggers when something hits this
	# Add a future mechanic here that shows the player a prompt to extract
	if body.name == "Player":
		print("Reached extraction point")
		show_prompt()
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		hide_prompt()
	
func show_prompt() -> void:
	interact_prompt.visible = true
	
func hide_prompt() -> void:
	interact_prompt.visible = false
		
func bring_to_game_over() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")
