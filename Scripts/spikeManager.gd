extends Area2D

func _on_Spike_body_entered(body):
	print("entered")
	if body.name == "Player":
		print("foundplayer")
		# Restart the scene
		get_tree().reload_current_scene()
		print("didnt restart")
