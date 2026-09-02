extends Area_threat

class_name Darkness

@onready var countdown_before_attacking: Timer = $"Countdown before attacking"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Entered an AreaThreat: " + threat_name)
		print("Darkness is attacking")
		countdown_before_attacking.start()
	
func _on_body_exited(body: Node2D) -> void:
	print("You left an AreaThreat: " + name)
	countdown_before_attacking.stop()
	
func attack() -> void:
	pass
	
func _on_countdown_before_attacking_timeout() -> void:
	SingletonPlayerStats.health -= 10.0
	print(SingletonPlayerStats.health)
