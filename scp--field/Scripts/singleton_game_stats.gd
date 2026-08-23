extends Node

class_name GameStats

var win : bool = false
var in_interactible_zone : bool = false
var threat_list : Array[ThreatData]	# Threats inserted in the game
var field_code_list : Array[FieldCodeData]	# Field codes from the threat inserted into the game
var area_list : Array[Area2D]	# Areas in the game

func _ready() -> void:
	pass

func add_areas_to_list() -> void:	# Keeps track of all areas in the map
	if area_list.is_empty():
		print("Nothing added")
	else:
		for child in area_list:
			print(child.name)

func add_field_codes_to_list() -> void:
	for child in field_code_list:
		print(child.name)
