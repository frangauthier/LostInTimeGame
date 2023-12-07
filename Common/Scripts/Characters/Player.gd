extends CharacterBody3D

const LERP_VALUE : float = 0.15

var snap_vector : Vector3 = Vector3.DOWN
var speed : float


@export_group("Movement variables")
@export var walk_speed : float = 4.0
@export var run_speed : float = 10.0
@export var jump_strength : float = 15.0
@export var gravity : float = 50.0
@export var jump_push : float = 300

const ANIMATION_BLEND : float = 7.0

@onready var player_mesh : Node3D = $Sketchfab_model
@onready var spring_arm_pivot : Node3D = $SpringArmPivot
@onready var animator : AnimationTree = $AnimationTree
@onready var animationPlayer : AnimationPlayer = $AnimationPlayer2

var can_move = true
var can_throw = true
var is_wall_jump = false
signal throw

func _physics_process(delta):
	var move_direction : Vector3 = Vector3.ZERO
	move_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_direction.z = Input.get_action_strength("move_backwards") - Input.get_action_strength("move_forwards")
	move_direction = move_direction.rotated(Vector3.UP, spring_arm_pivot.rotation.y)
	
	velocity.y -= gravity * delta
	if can_move:
		if Input.is_action_pressed("run"):
			speed = run_speed
		else:
			speed = walk_speed
		
		velocity.x = move_direction.x * speed
		velocity.z = move_direction.z * speed
		
		if move_direction and not is_wall_jump:
			player_mesh.rotation.y = lerp_angle(player_mesh.rotation.y, atan2(velocity.x, velocity.z), LERP_VALUE)
		
		var just_landed := is_on_floor() and snap_vector == Vector3.ZERO
		var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
		if is_jumping:
			$AudioStreamPlayer3D.play()
			velocity.y = jump_strength
			snap_vector = Vector3.ZERO
		elif just_landed:
			snap_vector = Vector3.DOWN
			is_wall_jump = false
			
	apply_floor_snap()
	move_and_slide()
	wallJump(move_direction.x)
	animate(delta)
	
	for col_idx in get_slide_collision_count():
		var collision := get_slide_collision(col_idx)
		if collision.get_collider() is RigidBody3D:
			collision.get_collider().apply_central_impulse(-collision.get_normal() * 0.3)
			collision.get_collider().apply_impulse(-collision.get_normal() * 0.01, collision.get_position())
	

func animate(delta):
	if is_on_floor():
		animator.set("parameters/ground_air_transition/transition_request", "grounded")
		shoot()
		
		if velocity.length() > 0:
			if speed == run_speed:
				animator.set("parameters/iwr_blend/blend_amount", lerp(animator.get("parameters/iwr_blend/blend_amount"), 1.0, delta * ANIMATION_BLEND))
			else:
				animator.set("parameters/iwr_blend/blend_amount", lerp(animator.get("parameters/iwr_blend/blend_amount"), 0.0, delta * ANIMATION_BLEND))
		else:
			animator.set("parameters/iwr_blend/blend_amount", lerp(animator.get("parameters/iwr_blend/blend_amount"), -1.0, delta * ANIMATION_BLEND))
	else:
		animator.set("parameters/ground_air_transition/transition_request", "air")

func shoot():
	if Input.is_action_pressed("LeftClick") and can_throw:
		velocity = Vector3.ZERO
		can_throw = false
		can_move = false
		animationPlayer.play("Throw")
		
func setMoving():
	can_move = true

func shootBall():
	var throwTip = $Sketchfab_model/throwTip.global_position
	var throw_direction : Vector3 = Vector3.ZERO
	throw_direction = -player_mesh.basis.z
	throw_direction.y = $SpringArmPivot.rotation_degrees.x
	#TTOOO DOOOOO
	
	throw.emit(throwTip, throw_direction.normalized())
	$Timer.start()
	
func wallJump(direction):
	if is_on_wall_only() and Input.is_action_just_pressed("jump") and not is_wall_jump:
		is_wall_jump = true
		velocity.y = jump_strength
		animationPlayer.play("swingEnd")
		animationPlayer.advance(0.6)
		print(direction)
		velocity.x = -direction * jump_push
		
func _on_timer_timeout():
	can_throw = true
	pass # Replace with function body.
