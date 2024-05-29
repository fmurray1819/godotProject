extends Area2D

func _ready():
	# Connect signals for body entering and exiting the area
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.has_method("emit_signal"):
		body.emit_signal("entered_water")

func _on_body_exited(body):
	if body.has_method("emit_signal"):
		body.emit_signal("exited_water")
