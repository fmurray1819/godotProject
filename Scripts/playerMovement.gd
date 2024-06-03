extends RigidBody2D

# Constants
@export var GRAVITY = 500
@export var MOVE_FORCE = 1200
@export var AIR_MOVE_FORCE = 600
@export var JUMP_FORCE = -700
@export var MAX_SPEED = 600

# Variables
var raycast_ground: RayCast2D
var current_gravity = GRAVITY

func _ready():
	# Initialize raycast_ground
	raycast_ground = get_node("RayCast2D")
	# Enable custom integrator
	self.custom_integrator = true

# Physics integration
func _integrate_forces(state):
	self.angular_velocity = 0

# Main physics process
func _physics_process(delta):
	# Apply gravity
	apply_central_impulse(Vector2(0, current_gravity * delta))
	# Handle movement
	handle_movement(delta)
	# Limit horizontal speed
	limit_speed()

# Handle player movement
func handle_movement(delta):
	var horizontal_force = Vector2.ZERO
	var move_force = MOVE_FORCE if raycast_ground.is_colliding() else AIR_MOVE_FORCE
	
	if Input.is_action_pressed("ui_left"):
		horizontal_force.x -= move_force * delta
	if Input.is_action_pressed("ui_right"):
		horizontal_force.x += move_force * delta

	if horizontal_force != Vector2.ZERO:
		apply_central_impulse(horizontal_force)

# Limit player speed
func limit_speed():
	var velocity = linear_velocity
	if abs(velocity.x) > MAX_SPEED:
		velocity.x = sign(velocity.x) * MAX_SPEED
		linear_velocity = velocity

# Handle player jumping
func _input(event):
	if event.is_action_pressed("ui_up") and raycast_ground.is_colliding():
		apply_central_impulse(Vector2(0, JUMP_FORCE))
