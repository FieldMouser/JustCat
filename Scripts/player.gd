extends CharacterBody2D

var speed = 100
var player_state
var player_direction

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	
	if direction.x > 0:
		player_direction = "right"
	elif direction.x < 0:
			player_direction = "left"

	if direction.y > 0:
		player_direction = "down"
	elif direction.y < 0:
			player_direction = "up"
	
	velocity = direction * speed
	move_and_slide()

	play_animation(direction)

@warning_ignore("unused_parameter")
func play_animation(direction):
	match player_state:
		"idle":
			match player_direction:
				"right": $AnimatedSprite2D.play("idle_right")
				"left": $AnimatedSprite2D.play("idle_left")
				"up": $AnimatedSprite2D.play("idle_up")
				"down": $AnimatedSprite2D.play("idle_down")
		"walking":
			match player_direction:
				"right": $AnimatedSprite2D.play("walk_right")
				"left": $AnimatedSprite2D.play("walk_left")
				"up": $AnimatedSprite2D.play("walk_up")
				"down": $AnimatedSprite2D.play("walk_down")
