extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	call_deferred("_disable_collision_shape")
	
func _disable_collision_shape():
	$CollisionShape3D.set_disabled(true)
	deleteObject()
	emit_Particule()
	$Timer.start()
	
func deleteObject():
	$IceCube.queue_free() 
	
func emit_Particule():
	$CPUParticles3D.emitting=true
	$AudioStreamPlayer3D.play()


func _on_timer_timeout():
	.queue_free()
	$CPUParticles3D2.emitting=true
