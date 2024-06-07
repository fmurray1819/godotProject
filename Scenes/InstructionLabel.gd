extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Start the timer
	$HideTimer.start()

# Called when the timer times out
func _on_hide_timer_timeout():
	hide()
