extends Node3D

var projectile_scene = preload("res://BlueLevel/PlayerWorkingfolder/Scenes/web_projectile.tscn")
@export var startPosition: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_throw(throwTip: Vector3, throw_direction: Vector3):
	var ball = projectile_scene.instantiate() as RigidBody3D
	ball.position = throwTip
	var launch_force:float = 20
	ball.apply_impulse(throw_direction * launch_force)
	add_child(ball)
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body.name == "Player":
		body.global_position = startPosition.global_position
	pass
