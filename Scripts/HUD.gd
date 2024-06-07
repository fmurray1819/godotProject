extends Node2D

signal start_game
@export var COIN = 0
@onready var text:= $COINS

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func show_message(text):
	#$COINS.text = text
	#$COINS.show()

func show_message(text):
	$COINS.text = str(COIN)
	$COINS.show()

