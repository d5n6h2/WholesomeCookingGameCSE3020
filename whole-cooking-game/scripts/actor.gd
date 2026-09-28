class_name Actor
extends CharacterBody2D


var move_speed : float = 400.0
var move_accel : float = 20.0
var move_decel : float = 40.0

var movement_input: Vector2 = Vector2.ZERO
var interact_input: bool = false


func _physics_process(delta: float) -> void:
	
	# lerp changes a value over time rather than instantly setting it
	# makes the movement "smoother" with accel/decel values
	if movement_input:
		velocity.x = lerp(velocity.x, movement_input.x*move_speed, move_accel*delta)
		velocity.y = lerp(velocity.y, movement_input.y*move_speed, move_accel*delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, move_decel*delta)
		velocity.y = lerp(velocity.y, 0.0, move_decel*delta)
	
	move_and_slide()


#region setters/getters


func set_movement_input(input: Vector2) -> void:
	movement_input = input


func set_interact_input(input: bool) -> void:
	interact_input = input


#endregion
