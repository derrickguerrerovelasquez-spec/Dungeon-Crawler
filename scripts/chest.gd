extends StaticBody2D

var player_nearby = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_nearby = true
	
	if player_nearby:
		print("Player detected")
	
