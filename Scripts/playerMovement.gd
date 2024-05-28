extends RigidBody2D

const GRAVITY = 500
const MOVE_FORCE = 1200  # Adjust this value to control the speed of horizontal movement
const AIR_MOVE_FORCE = 600  # Adjust this value to control the speed of horizontal movement in the air
const JUMP_FORCE = -700  # Adjust this value to control the jump force
const MAX_SPEED = 600  # Maximum horizontal speed

var raycast_ground: RayCast2D

func _ready():
	# Reference to the RayCast2D node
	raycast_ground = get_node("RayCast2D")
	self.custom_integrator = true

func _integrate_forces(state):
	self.angular_velocity = 0

func _physics_process(delta):
	# Apply gravity
	apply_central_impulse(Vector2(0, GRAVITY * delta))
	
	# Initialize horizontal force to zero
	var horizontal_force = Vector2.ZERO
	
	# Determine movement force based on whether the player is on the ground
	var move_force = MOVE_FORCE
	if not raycast_ground.is_colliding():
		move_force = AIR_MOVE_FORCE

	# Handle left and right movement
	if Input.is_action_pressed("ui_left"):
		print("Moving left")
		horizontal_force.x -= move_force * delta
	if Input.is_action_pressed("ui_right"):
		print("Moving right")
		horizontal_force.x += move_force * delta
		
	# Apply horizontal movement force if it's not zero
	if horizontal_force != Vector2.ZERO:
		apply_central_impulse(horizontal_force)
	
	# Limit horizontal speed
	var velocity = linear_velocity
	if abs(velocity.x) > MAX_SPEED:
		velocity.x = sign(velocity.x) * MAX_SPEED
		linear_velocity = velocity
	
	# Handle jumping
	if Input.is_action_just_pressed("ui_up") and raycast_ground.is_colliding():
		print("Jumping")
		apply_central_impulse(Vector2(0, JUMP_FORCE))
