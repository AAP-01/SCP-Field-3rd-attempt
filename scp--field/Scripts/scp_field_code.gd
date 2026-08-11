extends Area2D

var field_code : FieldCodeData
@onready var sprite_2d: Sprite2D = $Sprite2D

func setup(field_code : FieldCodeData) -> void:
	self.field_code = field_code
	sprite_2d.texture = field_code.field_code_icon

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Found a field code")
		show_prompt()
		
func show_prompt() -> void:
	pass
	
func interact() -> void:
	pass
