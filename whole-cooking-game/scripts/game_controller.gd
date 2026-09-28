extends Node

var scene_controller : SceneController = SceneController.new()

@export var world_2d : Node2D
@export var gui : Control


func _ready() -> void:
	initialize_scene_controller()
	scene_controller.change_world_2d_scene("uid://c4nq8144xatta") # uid of player_movement_test_scene
	# we don't have a signal bus for the actors and the input controller to communicate
	# so for now, just gonna hardcode and set it as task
	var actors = get_tree().get_nodes_in_group("actor")
	$InputController.actor_one = actors[0]
	$InputController.actor_two = actors[1]

func initialize_scene_controller() -> void:
	if not scene_controller:
		print("game_controller: Error: scene_controller object empty. Cannot initialize scene controller.")
		return
	if world_2d:
		scene_controller.world_2d = world_2d
	if gui:
		scene_controller.gui = gui
