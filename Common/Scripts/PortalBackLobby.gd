extends Node3D

@onready var portal_center = $"magic_portal/Sketchfab_model/3e5d370798dd4d69b43ee2bcb29da87d_fbx/RootNode/PortalSurface_low"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	portal_center.rotate_z(0.5 * delta)
	



func _on_enter_portal_area_body_entered(body):
	print(body.name)
	if(body.name == "Venom"):
		MusicManager.stop_music()
		
	Globals.load_level("lobby")
