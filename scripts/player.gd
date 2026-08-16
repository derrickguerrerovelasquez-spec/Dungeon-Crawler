extends CharacterBody2D

@export var speed = 55
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sword: Area2D = $Sword
@onready var sword_animation_player: AnimationPlayer = $Sword/AnimationPlayer

func get_input():
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction != Vector2.ZERO:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
		
	if 	Input.is_action_just_pressed("left"):
		animated_sprite_2d.flip_h = true
		sword.scale.x = -1
		
	if Input.is_action_just_pressed("right"):
		animated_sprite_2d.flip_h = false	
		sword.scale.x = 1
		
	if Input.is_action_just_pressed("attack"):
			speed = 25
			sword.visible = true
			sword_animation_player.play("swordSwing")
			
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "swordSwing":
		speed = 55
		sword.visible = false

func _process(delta: float) -> void:
	get_input()
	move_and_slide()
