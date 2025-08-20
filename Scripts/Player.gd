extends CharacterBody3D

var gravity = 1
var turn = 0
var time = 0

@export var jump_force = 15
@export var speed = 5
@export var turn_speed = 10

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	GlobalPlayer.Player_pos = global_position
	time += delta
	
	# Add the gravity.
	if !is_on_floor():
		velocity.y -= gravity

	# Get the input direction and handle the movement/deceleration.
	if time > 1:
		velocity.x = (speed + turn)
		velocity.z = (speed - turn)
		
		if turn != -speed && turn != speed:
			$Wheelbarrow/GPUParticles3D.emitting = true
			$Wheelbarrow/GPUParticles3D2.emitting = true
		else:
			$Wheelbarrow/GPUParticles3D.emitting = false
			$Wheelbarrow/GPUParticles3D2.emitting = false
	
	if Input.is_action_pressed("Space"):
		if turn < speed:
			turn += delta * turn_speed
		else:
			turn = speed
		
		if $Wheelbarrow.global_rotation.y < PI/2:
			$Wheelbarrow.global_rotation.y += delta * turn_speed
		else:
			$Wheelbarrow.global_rotation.y = PI/2
	else:
		if turn > -speed:
			turn -= delta * turn_speed
		else:
			turn = -speed
		
		if $Wheelbarrow.global_rotation.y > 0:
			$Wheelbarrow.global_rotation.y -= delta * turn_speed
		else:
			$Wheelbarrow.global_rotation.y = 0
			
	move_and_slide()
