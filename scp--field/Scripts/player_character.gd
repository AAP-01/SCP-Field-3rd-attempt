extends CharacterBody2D

const WALK_SPEED = 150.0
const SPRINT_SPEED = 250.0

func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()	# Executes the player's movement (uses the velocity variable)

func process_movement() -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Move left", "Move right", "Move up", "Move down")	# Essentially gets the direction the player is oriented
	
	if Input.is_action_pressed("Sprint"):
		velocity = direction * SPRINT_SPEED	# Sets the player's movement
	else:
		velocity = direction * WALK_SPEED	# Sets the player's movement
