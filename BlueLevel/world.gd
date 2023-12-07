extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var globals = preload("res://BlueLevel/Globals.gd").new()
	add_child(globals)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
