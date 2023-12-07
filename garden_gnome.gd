extends Area3D

@export var staticBody3Dplatform: StaticBody3D
@export var node3DPlatform: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if staticBody3Dplatform != null:
		staticBody3Dplatform.visible = false
		
	if node3DPlatform != null:
		node3DPlatform.visible = false
	
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
	if staticBody3Dplatform != null:
		staticBody3Dplatform.visible = true
		
	if node3DPlatform != null:
		node3DPlatform.visible = true
	BlueGlobals.score += 1

func deleteObject():
	$IceCube.queue_free() 
	
func emit_Particule():
	$CPUParticles3D.emitting=true
	$AudioStreamPlayer3D.play()


func _on_timer_timeout():
	$garden_gnome_1k2.visible=false
	$CPUParticles3D2.emitting=true
	$CollectingAudio.play()
	$CPUParticles3D2.emitting=false
	

	





func _on_player_throw():
	pass # Replace with function body.
