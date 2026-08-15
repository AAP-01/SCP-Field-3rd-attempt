extends Node2D

var power : float = 100.0
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start()

func _process(delta: float) -> void:
	activate()

func activate() -> void:
	if power <= 0:
		point_light_2d.enabled = false
		
	if Input.is_action_just_pressed("Light"):
		if point_light_2d.enabled:
			point_light_2d.enabled = false
			timer.paused = true
		else:
			point_light_2d.enabled = true
			timer.paused = false
		
func _on_timer_timeout() -> void:
	if power > 0:
		power -= 1
		print("Power level: " + str(power))
	else:
		timer.stop()
		print("Lantern ran out of power")
