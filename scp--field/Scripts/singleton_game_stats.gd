extends Node

class_name GameStats

var win : bool = false
var in_interactible_zone : bool = false
var threat_list : Array[ThreatData]
var field_code_list : Array[FieldCodeData]
var area_list : Array[Area2D]

@onready var areas: Node = $Areas	# The script can't find this node fix it

func _ready() -> void:
	add_areas_to_list()

func add_areas_to_list() -> void:	# Keeps track of all areas in the map
	for child in areas.get_children():
		area_list.append(child)
