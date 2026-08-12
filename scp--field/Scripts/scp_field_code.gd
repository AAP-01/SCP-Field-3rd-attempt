extends Area2D

var field_code : FieldCodeData
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interact_prompt: Node2D = $"Interact Prompt"

func setup(field_code : FieldCodeData) -> void:
	self.field_code = field_code
	sprite_2d.texture = field_code.field_code_icon

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Found a field code")
		body.current_interactible = self
		show_prompt()
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.current_interactible = null
		hide_prompt()
	
func show_prompt() -> void:
	SingletonGameStats.in_interactible_zone = true
	interact_prompt.visible = true
	
func hide_prompt() -> void:
	SingletonGameStats.in_interactible_zone = false
	interact_prompt.visible = false
	
func interact() -> void:
	show_field_code()
	
func show_field_code() -> void:
	print("Observing field code")
