extends Node3D
var audio_player = AudioStreamPlayer.new()
var playing_music = false
var audio_player2 = AudioStreamPlayer.new()

func _ready():
	add_child(audio_player)
	audio_player.stream = preload("res://GreenLevel/GreenAssests/Sounds/John_Bartmann_-_01_-_Mad_Hatter_Tea_Party(chosic.com).mp3")
	audio_player.volume_db = -16
	add_child(audio_player2)
	
	audio_player2.stream = preload("res://GreenLevel/GreenAssests/Sounds/laughin last.wav")
func ensure_audio_playing():
	if not playing_music:
		audio_player.play()
		playing_music = true
func stop_music():
	if playing_music:
		audio_player.stop()
		playing_music = false
		
func who_laugh_the_last():
	audio_player2.play()
