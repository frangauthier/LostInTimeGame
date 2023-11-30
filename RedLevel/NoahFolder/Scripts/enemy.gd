extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ACCEL = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var target: Node3D = $"."
@onready var nav: NavigationAgent3D = $NavigationAgent3D

var target_set = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if (target_set):
		auto_movement(delta)
	
	update_animation()

	move_and_slide()

func find_target():
	# TODO: Logic to find the player.
	pass

func auto_movement(delta):
	var direction = Vector3()
	
	nav.target_position = target.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, ACCEL * delta)

func update_animation():
	$"../AnimationTree"["parameters/conditions/is_idling"] = velocity.length() < 0.05
	$"../AnimationTree"["parameters/conditions/is_running"] = velocity.length() > 0.05
