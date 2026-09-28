class_name SceneController
extends Node


var world_2d : Node2D # container node for holding node2D children objects
var gui : Control #container node for holding control children objects

var current_world_2d : Node2D # reference to current scene loaded as child of world_2d
var current_gui : Control # reference to current gui scene loaded as child of gui

func change_world_2d_scene(new_scene_uid: String, delete: bool = true, 
keep_running: bool = false) -> void:
	if current_world_2d != null:
		if delete:
			current_world_2d.queue_free() # removes node and its children
		elif keep_running:
			current_world_2d.visible = false
		else:
			world_2d.remove_child(current_world_2d)
	var new_scene = load(new_scene_uid).instantiate()
	world_2d.add_child(new_scene)
	current_world_2d = new_scene

func change_gui_scene(new_scene_uid: String, delete: bool = true,
keep_running: bool = false) -> void:
	if current_gui != null:
		if delete:
			current_gui.queue_free()
		elif keep_running:
			current_gui.visible = false
		else:
			gui.remove_child(current_gui)
	var new_scene = load(new_scene_uid).instantiate()
	gui.add_child(new_scene)
	current_gui = new_scene
