extends Threat

class_name Area_threat

func move(speed : float) -> void:	# Moves area to area
	pass

func _on_body_entered(body: Node2D) -> void:
	print("You entered an AreaThreat")

func _on_body_exited(body: Node2D) -> void:
	print("You left an AreaThreat")
