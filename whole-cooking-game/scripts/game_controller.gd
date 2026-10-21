extends Node

var scene_controller:= SceneController.new()

@export var world_2d : Node2D
@export var gui : Control


func _ready() -> void:
	initialize_scene_controller()
	scene_controller.change_world_2d_scene("uid://c4nq8144xatta") # uid of main_menu scene


func initialize_scene_controller() -> void:
	if not scene_controller:
		print("game_controller: Error: scene_controller object empty. Cannot initialize scene controller.")
		return
	if world_2d:
		scene_controller.world_2d = world_2d
	if gui:
		scene_controller.gui = gui
