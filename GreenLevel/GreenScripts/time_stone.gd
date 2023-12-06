extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(0.2 * delta)
	rotate_z(0.1 * delta)

func _on_body_entered(_body):
	$PickupSound.play()
	$"1_1_0".visible = false
	MusicManager.who_laugh_the_last()
	$Hum.stop()
	$Timer.start()
	Globals.complete_level("green")
	


func _on_timer_timeout():
	queue_free()
