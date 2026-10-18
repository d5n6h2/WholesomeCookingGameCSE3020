class_name Interactable
extends Area2D


@export var interact_name: String = ""
@export var is_interactable: bool = true
@export var interaction_priority: int = 0


var interact: Callable = func():
	pass
