extends Node3D

signal collected

const ROTATION_SPEED = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.rotation = Vector3(rotation.x, randf(), rotation.z)
	$AnimationPlayer.play("Float")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate_y(delta * ROTATION_SPEED)

func _on_area_3d_body_entered(body):
	$PickupSound.play()
	collected.emit()
	queue_free()

