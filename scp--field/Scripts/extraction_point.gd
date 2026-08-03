extends Area2D

func _on_body_entered(body: Node2D) -> void:	# This triggers when something hits this
	# Add a future mechanic here that shows the player a prompt to extract
	if body.name == "Player":
		bring_to_game_over()
		
func bring_to_game_over() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")
