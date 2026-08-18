extends Node

class_name GameManager

var threats : Array[Threat]

func _ready() -> void:
	pass
	
func select_threat() -> void:
	threats.append(SingletonThreatList.list[randi_range(0, SingletonThreatList.list.size() - 1)])
