extends Node

class_name GameManager

var threat_list : Array[ThreatData] = SingletonGameStats.threat_list
var field_code_list : Array[FieldCodeData] = SingletonGameStats.field_code_list
var area_list : Array[Area2D] = SingletonGameStats.area_list
var field_code_amount : int
const AREA_THREAT = preload("res://Scenes/area_threat.tscn")
@onready var field_codes_parent: Node = $"../Field Codes"
@onready var areas_parent: Node = $"../Areas"


func _ready() -> void:
	for area in areas_parent.get_children():
		area_list.append(area)
		
	field_code_amount = 3
	select_threat()
	setup_threat()
# =====================================================================================================================================================================
func select_threat() -> void:	# Select the ThreatData resource
	for i in field_code_amount:
		threat_list.append(SingletonThreatList.list[randi_range(0, SingletonThreatList.list.size() - 1)])	# Only adds the resource
	
func setup_threat() -> void:	# Spawn the Threat scene
	for threat in threat_list:	# To fix: CollisionSHape2D are sized wrong if there are multiple threats spawning
		var spawn_area = select_spawn_area()
		print(spawn_area.name)
		
		match threat.threat_class:
			SingletonEnums.ThreatClass.MOBILE_THREAT:
				var mobile_threat = AREA_THREAT.instantiate()	# Create an instance in memory (CHANGE TO MOBILE_THREAT WHEN THE CLASS IS ADDED)
				add_child(mobile_threat)	# Spawn the threat in the scene
				setup_mobile_threat_position(mobile_threat, spawn_area)	# Set the position
				
			SingletonEnums.ThreatClass.AREA_THREAT:
				var area_threat = AREA_THREAT.instantiate()
				add_child(area_threat)
				setup_area_threat_size(area_threat, spawn_area)
				area_threat.position = spawn_area.position
# =====================================================================================================================================================================
func select_field_codes() -> void:	# Select the FieldCodeData resource
	for i in field_code_amount:
		field_code_list.append(threat_list[0].field_codes[randi_range(0, threat_list[0].field_codes.size() - 1)])
		
func setup_field_codes() -> void:	# Assign the SCPFieldCode nodes to one field code resource each
	pass
# =====================================================================================================================================================================
func select_spawn_area() -> Area2D:
	var spawn_area : Area2D = areas_parent.get_children()[randi_range(0, areas_parent.get_children().size() - 1)]
	return spawn_area
	
func setup_area_threat_size(area_threat : Area2D, spawn_area : Area2D) -> void:
	var new_area_shape = area_threat.get_node("CollisionShape2D").shape.duplicate()	# Gotta duplicate it because it's a shared resource
	var spawn_area_shape = spawn_area.get_node("CollisionShape2D").shape
	
	new_area_shape.extents = spawn_area_shape.extents
	area_threat.get_node("CollisionShape2D").shape = new_area_shape	# The spawned area threat gets its unique CollisionShape2D
	
func setup_mobile_threat_position(mobile_threat : Area2D, spawn_area : Area2D) -> void:
	mobile_threat.position = spawn_area.position
# =====================================================================================================================================================================
