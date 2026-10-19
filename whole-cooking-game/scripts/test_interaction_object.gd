extends MeshInstance2D


@export var interactable: Interactable


func _ready() -> void:
	interactable.interact = _on_interact


func _on_interact() -> void:
	if interactable.is_interactable:
		interactable.is_interactable = false
		print("interacted")
