# Consider removing the AreaThreat script, it doesn't do anything that the specific threat doesn't
extends Threat

class_name Area_threat

var is_in_area : bool = false

func move(speed : float) -> void:	# Moves area to area
	pass
