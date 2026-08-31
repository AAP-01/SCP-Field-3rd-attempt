extends Resource

class_name ThreatData

@export var threat_class : SingletonEnums.ThreatClass
@export var threat_sprite : Texture2D
@export var threat_scene : PackedScene	# It contains the scene of the threat to apply custom behavior
@export var name : String
@export var health : float
@export var is_invulnerable : bool
@export var speed : float
@export var attack_speed : float	# Per second
@export var damage : float
@export var field_codes : Array[FieldCodeData]
