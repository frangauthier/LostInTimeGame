extends Node3D
var audio_player = AudioStreamPlayer.new()
var playing_music = false

func _ready():
	add_child(audio_player)
	audio_player.stream = preload("res://GreenLevel/GreenAssests/Sounds/John_Bartmann_-_01_-_Mad_Hatter_Tea_Party(chosic.com).mp3")
	audio_player.volume_db = -9
func ensure_audio_playing():
	if not playing_music:
		audio_player.play()
		playing_music = true
