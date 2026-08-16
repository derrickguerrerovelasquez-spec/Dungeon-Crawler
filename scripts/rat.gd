extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var health = 30

func take_damage(damage):
	
	health -= damage
	print("Rat Health: ", health)
	animated_sprite_2d.play("damage")
	
	if health <=0:
		health = 0
		queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	
	if animated_sprite_2d.animation == "damage":
		animated_sprite_2d.play("idle")
