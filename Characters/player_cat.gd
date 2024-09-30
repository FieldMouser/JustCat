extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction: Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree

var input_direction : Vector2 = Vector2.ZERO
func _ready():
	animation_tree.set("parameters/Idle/blend_position", starting_direction)

func _process(delta):
	update_animation_parameters()
	
func _physics_process(_delta):
	input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = input_direction * move_speed
	
	move_and_slide()

func update_animation_parameters():
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	animation_tree["parameters/Idle/blend_position"] = input_direction
	animation_tree["parameters/Walk/blend_position"] = input_direction
	
	
