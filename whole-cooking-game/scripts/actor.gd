class_name Actor
extends Node2D


#region Components

@export var character_body : ActorMovement
@export var interaction_component : Node2D

#endregion


var move_speed : float = 400.0
var move_accel : float = 20.0
var move_decel : float = 40.0


func _ready() -> void:
	add_to_group("actor")



#region setters/getters


func set_movement_input(input: Vector2) -> void:
	character_body.set_movement_input(input)


func set_interact_input(input: bool) -> void:
	interaction_component.set_interact_input(input)


#endregion
