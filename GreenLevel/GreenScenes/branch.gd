extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var physics_material = PhysicsMaterial.new()
	physics_material.friction = 0.1
	$MeshInstance3D/StaticBody3D.physics_material_override = physics_material

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
