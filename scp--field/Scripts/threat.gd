extends Node2D

class_name Threat

var threat : ThreatData

@onready var sprite_2d: Sprite2D = $Sprite2D

func setup(threat : ThreatData) -> void:
	self.threat = threat

func move(speed : float) -> void:
	pass
	
func die() -> void:
	pass
	
func get_hurt(damage : float) -> void:
	pass
