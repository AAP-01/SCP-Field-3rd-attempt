extends Node

class_name GameManager

var threat_list : Array[ThreatData] = SingletonGameStats.threat_list
var field_code_list : Array[FieldCodeData] = SingletonGameStats.field_code_list
var field_code_amount : int
const AREA_THREAT = preload("res://Scenes/area_threat.tscn")
@onready var field_codes_parent: Node = $"../Field Codes"

func _ready() -> void:
	field_code_amount = 3
	select_threat()
	for field_code in field_code_list:
		print(field_code.name)
	
func select_threat() -> void:	# Select the ThreatData resource
	threat_list.append(SingletonThreatList.list[randi_range(0, SingletonThreatList.list.size() - 1)])
	
func setup_threat() -> void:	# Spawn the Threat scene
	for threat in threat_list:
		match threat.threat_class:
			SingletonEnums.ThreatClass.MOBILE_THREAT:
				var mobile_threat = AREA_THREAT.instantiate()	# Create an instance in memory
				mobile_threat.position = Vector2(100, 200)	# Set the position
				add_child(mobile_threat)	# Spawn the threat in the scene
				
			SingletonEnums.ThreatClass.AREA_THREAT:
				var area_threat = AREA_THREAT.instantiate()
				setup_area_threat_size(area_threat, select_spawn_area())
				add_child(area_threat)

func select_field_codes() -> void:	# Select the FieldCodeData resource
	for i in field_code_amount:
		field_code_list.append(threat_list[0].field_codes[randi_range(0, threat_list[0].field_codes.size() - 1)])
		
func setup_field_codes() -> void:	# Assign the SCPFieldCode nodes to one field code resource each
	pass
	
func select_spawn_area() -> Area2D:
	var spawn_area : Area2D = SingletonGameStats.area_list[randi_range(0, SingletonGameStats.area_list.size() - 1)]
	return spawn_area
	
func setup_area_threat_size(area_threat : Area2D, spawn_area : Area2D) -> void:
	var area_threat_shape = area_threat.get_node("CollisionShape2D").shape.size
	var spawn_area_shape = spawn_area.get_node("CollisionShape2D").shape.size
	area_threat_shape = spawn_area_shape
