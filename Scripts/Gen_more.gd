extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("made") # Replace with function body.
	await get_tree().create_timer(6).timeout
	$"..".queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	print("hi1")
	GlobalPlayer.new = true
