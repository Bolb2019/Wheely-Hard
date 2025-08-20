extends Node3D

var x = 0
var y = 0

var Prefab = preload("res://Scenes/map_prefabs.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_scene(self, Prefab, x, y, Vector3(1, 1, 1), 0) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalPlayer.new == true:
		print("hi")
		if randi() % 2 == 0:
			y += 1
			make_scene(self, Prefab, x, y, Vector3(1, 1, 1), 0)
		else:
			x += 1
			make_scene(self, Prefab, x, y, Vector3(1, 1, 1), PI/2)
		GlobalPlayer.new = false


func make_scene(parent, scene, posx, posz, size: Vector3, rot):
	var instance = scene.instantiate()
	instance.position.x = posx
	instance.position.z = posz
	instance.scale = size
	instance.rotation.y = rot

	#insert other actions to fit your needs here
  
	add_child(instance)
