extends Node3D

@export_enum("Building", "Plank") var Prefab_Type: String

func _ready() -> void:
	if name == Prefab_Type:
		visible = true
	else:
		visible = false
