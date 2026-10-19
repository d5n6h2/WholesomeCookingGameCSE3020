extends Node2D


var current_interactions := []
var can_interact := true


func _process(_delta: float) -> void:
	if not current_interactions and can_interact:
		return
	
	current_interactions.sort_custom(_sort_by_nearest)
	if current_interactions[0].is_interactable:
		# interaction is possible
		# show tooltip
		pass


func _sort_by_nearest(area1, area2):
	var area1_distance = global_position.distance_to(area1.global_position)
	var area2_distance = global_position.distance_to(area2.global_position)
	
	return area1_distance < area2_distance


func _on_interact_range_area_entered(area: Area2D) -> void:
	current_interactions.push_front(area)


func _on_interact_range_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)

func set_interact_input(input: bool) -> void:
	if not input:
		return
	
	if not can_interact:
		return
	
	if current_interactions:
		can_interact = false
		await current_interactions[0].interact.call()
		
		can_interact = true
