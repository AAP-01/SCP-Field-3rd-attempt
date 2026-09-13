extends Node2D

var power : float = 100.0
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var timer: Timer = $Timer

signal light_activated_or_deactivated

func _ready() -> void:
	timer.start()

func _process(delta: float) -> void:
	activate()

func activate() -> void:
	if power <= 0:
		point_light_2d.enabled = false
		SingletonPlayerStats.is_light_on = false
		
	if Input.is_action_just_pressed("Light"):
		if point_light_2d.enabled:
			point_light_2d.enabled = false
			SingletonPlayerStats.is_light_on = false
			timer.paused = true
			light_activated_or_deactivated.emit()
		else:
			point_light_2d.enabled = true
			SingletonPlayerStats.is_light_on = true
			timer.paused = false
			light_activated_or_deactivated.emit()
			
		
func _on_timer_timeout() -> void:
	if power > 0:
		power -= 1
		print("Power level: " + str(power))
	else:
		timer.stop()
		print("Lantern ran out of power")
