extends CharacterBody2D

var walk_speed : float = SingletonPlayerStats.walk_speed
var sprint_speed : float = SingletonPlayerStats.sprint_speed

func _ready() -> void:
	for i in get_tree().get_nodes_in_group("Interactibles"):
		print(i.name)

func _physics_process(delta: float) -> void:
	process_movement(delta)
	move_and_slide()	# Executes the player's movement (uses the velocity variable)

func process_movement(delta : float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Movement
	var direction : float = Input.get_axis("Move left", "Move right")	# Essentially gets the direction the player is oriented
	
	if Input.is_action_pressed("Sprint"):
		velocity.x = direction * sprint_speed	# Sets the player's movement
	else:
		velocity.x = direction * walk_speed	# Sets the player's movement
