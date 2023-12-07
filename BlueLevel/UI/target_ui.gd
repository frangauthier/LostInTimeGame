extends CanvasLayer

var progress_bar : TextureProgressBar
@export var time_left : float = 30.0
@export var max_time : float = 30.0  # Set the maximum time
var targetCount : int

func _ready():
	progress_bar = $SliderContainer/HBoxContainer2/TextureProgressBar
	progress_bar.value = max_time
	$Timer.wait_time = max_time
	$Timer.start()

func _process(delta):
	time_left = max(0, time_left - delta)
	update_progress_bar()
	update_target()

func update_progress_bar():
	var progress = time_left
	progress_bar.value = progress

func _on_timer_timeout():
	print("Timer ran out!")
	get_tree().change_scene_to_file("res://BlueLevel/TimerRanOutScene.tscn")

func update_target():
		targetCount = BlueGlobals.score
		print(BlueGlobals.score)
		$TargetContainer/HBoxContainer/TargetVar.text = str(targetCount)
