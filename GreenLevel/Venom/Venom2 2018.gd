extends CharacterBody3D


@export var SPEED = 500.0
@export var JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _on_SlidingSound_finished():
	$"sliding sound".play()

func _ready():
	$"laughing sound3".play()
	$"sliding sound".play()
	$"sliding sound".volume_db = -80 

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		$"sliding sound".volume_db = -80
	else:
		$"sliding sound".volume_db = 0
		if not $"sliding sound".playing:
			$"sliding sound".play()
			$"sliding sound".volume_db = 0

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$"sliding sound".volume_db = -80
		$"jumping sound2".play()


# Handle rotation.
	var rotation_speed = 150.0  # Adjust this value to your liking.
	if Input.is_action_pressed("ui_left"):
		rotation_degrees.y += rotation_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees.y -= rotation_speed * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#	if direction:
#		velocity.x = direction.x * SPEED
#		velocity.z = direction.z * SPEED
	if is_on_floor():
		var slope_normal = get_floor_normal() + Vector3.UP *0.01
		var right_dir = transform.basis.x
		var forward_dir = right_dir.cross(slope_normal).normalized()
		velocity = forward_dir * SPEED * delta 
	move_and_slide()
