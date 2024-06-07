extends Node2D

@onready var area_2d = $Area2D
@onready var player = %Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body == player:
		player.COIN += 1
		self.queue_free()
		print("COIN: ", player.COIN)
