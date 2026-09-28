extends Node

@export var actor_one: Actor
@export var actor_two: Actor



func _process(_delta: float) -> void:
	if not actor_one or not actor_two:
		return
	
	var actor_one_movement_input: Vector2 = Input.get_vector("actor_one_left", "actor_one_right", "actor_one_up", "actor_one_down")
	if actor_one.has_method("set_movement_input"):
		actor_one.set_movement_input(actor_one_movement_input)
	
	
	var actor_two_movement_input: Vector2 = Input.get_vector("actor_two_left", "actor_two_right", "actor_two_up", "actor_two_down")
	if actor_two.has_method("set_movement_input"):
		actor_two.set_movement_input(actor_two_movement_input)
	
