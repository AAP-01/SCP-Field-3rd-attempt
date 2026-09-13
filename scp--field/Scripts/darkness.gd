extends Area_threat

class_name Darkness

@onready var countdown_before_attacking: Timer = $"Countdown before attacking"
@onready var attack_speed_timer: Timer = $"Attack Speed"
@onready var area_threat: Area_threat = $"."
@onready var lantern = $"../../Player/Lantern"	# It goes back two times because Darkness is a child of Game Manager. Kepp that in mind
var is_in_area : bool = false

signal darkness_area_entered

func _ready() -> void:
	# Entering Darkness' area and toggling the lantern makes the game check if both conditions allow it to attack
	darkness_area_entered.connect(attack)
	lantern.light_activated_or_deactivated.connect(attack)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Entered an AreaThreat: " + threat_name)
		is_in_area = true
		darkness_area_entered.emit()
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("You left an AreaThreat: " + name)
		is_in_area = false
		darkness_area_entered.emit()
		
func attack():
	if !SingletonPlayerStats.is_light_on and is_in_area:
		countdown_before_attacking.start()
	else:
		countdown_before_attacking.stop()
		attack_speed_timer.stop()
		
# Give the player time to leave
func _on_countdown_before_attacking_timeout() -> void:
	attack_speed_timer.start()
	
# Start attacking if they don't leave
func _on_attack_speed_timeout() -> void:
	print("Darkness is attacking")
	SingletonPlayerStats.health -= damage
	print(SingletonPlayerStats.health)
