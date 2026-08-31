extends Area_threat

class_name Darkness

func _on_body_entered(body: Node2D) -> void:
	print("Entered an AreaThreat: " + threat.name)
	print("Darkness is attacking")
	
func _on_body_exited(body: Node2D) -> void:
	print("You left an AreaThreat: " + threat.name)
	
func attack() -> void:
	pass
