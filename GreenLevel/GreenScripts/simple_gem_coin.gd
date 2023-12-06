extends Node3D

signal collected

var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate_y(delta * 0.5)

func _on_body_entered(_body):
	if !is_collected:
		$"1".visible = false
		is_collected = true
		$PickupSound.play()
		MusicManager.who_laugh_the_last()
		collected.emit()
		$Timer.start()


func _on_timer_timeout():
	queue_free()
