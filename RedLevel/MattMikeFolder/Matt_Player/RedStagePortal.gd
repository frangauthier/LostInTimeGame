extends Node3D

@onready var portal_center = $"Sketchfab_model/3e5d370798dd4d69b43ee2bcb29da87d_fbx/RootNode/PortalSurface_low"
@onready var portal_center_mesh = $"Sketchfab_model/3e5d370798dd4d69b43ee2bcb29da87d_fbx/RootNode/PortalSurface_low/PortalSurface_low_PortalSurface_0"

@export var portal_color_override: Color = Color.WHITE
@export var gem_scene: PackedScene
@export var gem_color: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enter_portal_area_body_entered(body):
	if GlobalRedVariable.killAmount >= 10:
		#var gem = gem_scene.instantiate() as Node3D
		#gem.scale = Vector3.ONE*0.003;
		#$GemLocation.add_child(gem)
		Globals.complete_level(gem_color);
		get_tree().change_scene_to_file("res://Common/Scenes/Levels/lost_in_time_world.tscn")


