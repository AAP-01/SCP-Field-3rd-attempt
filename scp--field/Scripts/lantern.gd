extends Node2D

var power : float = 12.0
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var timer: Timer = $Timer

signal light_activated_or_deactivated

func _ready() -> void:
	# This part is to boot the timer so that activating it later will actually change its state
	timer.start()
	
	if !point_light_2d.enabled:
		timer.paused = true

func _process(delta: float) -> void:
	activate()

func activate() -> void:
	# Dead lantern
	if power <= 0:
		point_light_2d.enabled = false
		timer.stop()
		light_activated_or_deactivated.emit()
		
	if Input.is_action_just_pressed("Light"):
		# Turn off
		if point_light_2d.enabled:
			point_light_2d.enabled = false
			timer.paused = true
			light_activated_or_deactivated.emit()
		# Turn on
		else:
			point_light_2d.enabled = true
			timer.paused = false
			light_activated_or_deactivated.emit()
			
func _on_timer_timeout() -> void:
	if power > 0:
		power -= 1
		print("Power level: " + str(power))
	else:
		timer.stop()
		print("Lantern ran out of power")
