extends Area2D

var health = 100
var damage = 10

func _on_body_entered(body: Node2D) -> void:
	
	print(body.name)
	
	if body.has_method("take_damage"):
		body.take_damage(10)


	
