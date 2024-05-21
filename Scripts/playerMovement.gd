extends RigidBody2D

const GRAVITY = 500
const MOVE_FORCE = 1200  # Adjust this value to control the speed of horizontal movement
const JUMP_FORCE = -700  # Adjust this value to control the jump force

func _physics_process(delta):
	# Apply gravity
	apply_central_impulse(Vector2(0, GRAVITY * delta))
	
	# Initialize horizontal force to zero
	var horizontal_force = Vector2.ZERO
	
	# Handle left and right movement
	if Input.is_action_pressed("ui_left"):
		print("Moving left")
		horizontal_force.x -= MOVE_FORCE * delta
	if Input.is_action_pressed("ui_right"):
		print("Moving right")
		horizontal_force.x += MOVE_FORCE * delta
		
	# Apply horizontal movement force
	if horizontal_force != Vector2.ZERO:
		apply_central_impulse(horizontal_force)
	
	# Handle jumping
	if Input.is_action_just_pressed("ui_up"):
		print("Jumping")
		apply_central_impulse(Vector2(0, JUMP_FORCE))
