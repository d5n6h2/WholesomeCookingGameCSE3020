extends Node


@export var actor_one: Actor
@export var actor_two: Actor


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("actor_one_interact"):
		if actor_one.has_method("set_interact_input"):
			actor_one.set_interact_input(true)
	if event.is_action_pressed("actor_two_interact"):
		if actor_two.has_method("set_interact_input"):
			actor_two.set_interact_input(true)


func _process(_delta: float) -> void:
	if not actor_one or not actor_two:
		return
	
	set_actor_one_inputs()
	set_actor_two_inputs()
	

func set_actor_one_inputs() -> void:
	var actor_one_movement_input: Vector2 = Input.get_vector("actor_one_left", "actor_one_right", "actor_one_up", "actor_one_down")
	if actor_one.has_method("set_movement_input"):
		actor_one.set_movement_input(actor_one_movement_input)
	
	#if actor_one.has_method("set_interact_input"):
		#actor_one.set_interact_input(Input.is_action_pressed("actor_one_interact"))


func set_actor_two_inputs() -> void:
	var actor_two_movement_input: Vector2 = Input.get_vector("actor_two_left", "actor_two_right", "actor_two_up", "actor_two_down")
	if actor_two.has_method("set_movement_input"):
		actor_two.set_movement_input(actor_two_movement_input)
	
	#if actor_two.has_method("set_interact_input"):
		#actor_two.set_interact_input(Input.is_action_pressed("actor_two_interact"))
