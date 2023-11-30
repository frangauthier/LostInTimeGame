extends Node3D

@onready var bgm_player: AudioStreamPlayer3D = $"SoundPlayers/BGM-Player"
@onready var ambience_player: AudioStreamPlayer3D = $"SoundPlayers/Ambience-Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	ambience_player.play()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
