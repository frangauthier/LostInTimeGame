extends Node3D

var rotation_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Float")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate_y(delta * rotation_speed)
