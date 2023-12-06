extends CharacterBody3D

const LERP_VALUE : float = 0.15

const SPEED = 4.0
const JUMP_VELOCITY = 4.5
const ACCEL = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var character_mesh: Skeleton3D = $root/Skeleton3D

@onready var target: Node3D = $"."
@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var player = $'../../../Player' # Worker -> Enemy -> Enemies -> RedLevel -> Player

var hit_points: float = 3;

var target_set = false

func _process(delta):
	find_target()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if (target_set):
		auto_movement(delta)
	
	update_animation()

	move_and_slide()

func find_target():
	if(player and not target_set):
		target = player
		target_set = true

func auto_movement(delta):
	var direction = Vector3()
	
	nav.target_position = target.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
		
	velocity = velocity.lerp(direction * SPEED, ACCEL * delta)
	
	if (velocity):
		look_at(nav.get_next_path_position())

func update_animation():
	$"../AnimationTree"["parameters/conditions/is_idling"] = velocity.length() < 0.05
	$"../AnimationTree"["parameters/conditions/is_running"] = velocity.length() > 0.05

# On getting hit logic
func _on_hit_box_body_entered(body):
	
	if (body.name == "bullet"):
		hit()

func die():
	$"../AnimationPlayer".free()
	GlobalRedVariable.killAmount += 1
	print("KILLED")
	queue_free()

func hit():
	hit_points -= 1
	$"../Hit Sound".play()
	if hit_points <= 0:
		die()


func _on_danger_zone_body_entered(body):
	if (body.name == 'Player'):
		print('PLAYER_ELIMINATED')
