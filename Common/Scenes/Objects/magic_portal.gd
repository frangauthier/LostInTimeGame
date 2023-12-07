extends Node3D

@onready var portal_center = $"Sketchfab_model/3e5d370798dd4d69b43ee2bcb29da87d_fbx/RootNode/PortalSurface_low"
@onready var portal_center_mesh = $"Sketchfab_model/3e5d370798dd4d69b43ee2bcb29da87d_fbx/RootNode/PortalSurface_low/PortalSurface_low_PortalSurface_0"

@export var portal_color_override: Color = Color.WHITE
@export var gem_scene: PackedScene
@export var gem_color: String

# Called when the node enters the scene tree for the first time.
func _ready():
	var material = portal_center_mesh.get_active_material(0)
	material.albedo_color = portal_color_override

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	portal_center.rotate_z(0.5 * delta)


func _on_complete_button_body_entered(body):
	var gem = gem_scene.instantiate() as Node3D
	gem.scale = Vector3.ONE*0.003;
	$GemLocation.add_child(gem)
	Globals.complete_level(gem_color);


func _on_enter_portal_area_body_entered(body):
	get_tree().change_scene_to_file("res://BlueLevel/world.tscn")
