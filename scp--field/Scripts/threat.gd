extends Node2D

class_name Threat

var threat : ThreatData
@onready var sprite_2d: Sprite2D = $Sprite2D

func setup(threat : ThreatData) -> void:
	self.threat = threat
