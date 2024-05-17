extends RigidBody2D

const GRAVITY = 500

func _physics_process(delta):
	# Apply gravity
	apply_central_impulse(Vector2(0, GRAVITY * delta))
