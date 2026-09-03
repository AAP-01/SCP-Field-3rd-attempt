extends Area_threat

class_name Darkness

@onready var countdown_before_attacking: Timer = $"Countdown before attacking"
@onready var attack_speed_timer: Timer = $"Attack Speed"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Entered an AreaThreat: " + threat_name)
		print("Darkness is attacking")
		if true:	# To replace: run if the area is dark
			countdown_before_attacking.start()
	
func _on_body_exited(body: Node2D) -> void:
	print("You left an AreaThreat: " + name)
	countdown_before_attacking.stop()
	attack_speed_timer.stop()
	
# Give the player time to leave
func _on_countdown_before_attacking_timeout() -> void:
	attack_speed_timer.start()
	
# Start attacking if they don't leave
func _on_attack_speed_timeout() -> void:
	SingletonPlayerStats.health -= damage
	print(SingletonPlayerStats.health)
