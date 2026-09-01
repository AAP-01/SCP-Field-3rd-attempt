extends Node2D

class_name Threat

var threat : ThreatData
var threat_name : String
var health : float
var is_invulnerable : bool
var speed : float
var attack_speed
var damage : float

@onready var sprite_2d: Sprite2D = $Sprite2D

func setup(threat : ThreatData) -> void:
	threat_name = threat.name
	self.threat = threat
	self.health = threat.health
	self.is_invulnerable = threat.is_invulnerable
	self.speed = threat.speed
	self.attack_speed = threat.attack_speed
	self.damage = threat.damage
	sprite_2d.texture = threat.threat_sprite

func move(speed : float) -> void:
	pass
	
func die() -> void:
	pass
	
func get_hurt(damage : float) -> void:
	pass
