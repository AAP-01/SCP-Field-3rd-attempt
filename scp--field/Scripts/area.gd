extends Area2D

@export var area_type : SingletonEnums.AreaType

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Entered " + SingletonEnums.AreaType.find_key(area_type))

func _on_body_exited(body: Node2D) -> void:
	print("Left " + SingletonEnums.AreaType.find_key(area_type))
