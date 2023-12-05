extends CharacterBody3D

var audio_streams = []
var animation = true


@export var SPEED = 500.0
@export var JUMP_VELOCITY = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _on_SlidingSound_finished():
	$"Sounds/sliding sound".play()

func _ready():
	$RootNode.rotate_x(1.4)
	$"Sounds/laughing sound3".play()
	$"Sounds/sliding sound".play()
	$"Sounds/sliding sound".volume_db = -80 
	for i in range(1, 22):  # The range function generates numbers from 1 to 21.
		var audio_file_path = "res://GreenLevel/GreenAssests/Sounds/the best sounds %d.wav" % i
		var audio_stream = load(audio_file_path)
		audio_streams.append(audio_stream)

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		$"Sounds/sliding sound".volume_db = -80
	else:
		$"Sounds/sliding sound".volume_db = 0
		if not $"Sounds/sliding sound".playing:
			$"Sounds/sliding sound".play()
			$"Sounds/sliding sound".volume_db = 0

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y += JUMP_VELOCITY
		$"Sounds/sliding sound".volume_db = -80
		$"Sounds/jumping sound2".play()
	self.velocity = velocity

# Handle rotation.
	var rotation_speed = 150.0  # Adjust this value to your liking.
	if Input.get_action_strength("move_left"):
		rotation_degrees.y += rotation_speed * delta
	if Input.get_action_strength("move_right"):
		rotation_degrees.y -= rotation_speed * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#	if direction:
#		velocity.x = direction.x * SPEED
#		velocity.z = direction.z * SPEED
	
	if is_on_floor():
		if(animation):
			$RootNode.rotate_x(-1.4)
			animation = false
		var slope_normal = get_floor_normal() + Vector3.UP *0.01
		var right_dir = transform.basis.x
		var forward_dir = right_dir.cross(slope_normal).normalized()
		velocity = forward_dir * SPEED * delta 
	move_and_slide()



func _on_gem_shard_collected():
	var audio_stream = audio_streams[randi() % audio_streams.size()]
	print(audio_stream)
	# Play the audio stream.
	var audio_player = AudioStreamPlayer.new()  # Create a new AudioStreamPlayer.
	audio_player.stream = audio_stream  # Set the audio stream to play.
	add_child(audio_player)  # Add the AudioStreamPlayer to the scene.
	audio_player.play()  #  Replace with function body.
