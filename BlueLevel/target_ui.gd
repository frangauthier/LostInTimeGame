extends CanvasLayer

var progress_bar : TextureProgressBar
var time_left : float = 30.0
var max_time : float = 30.0  # Set the maximum time

func _ready():
	progress_bar = $MarginContainer2/HBoxContainer2/TextureProgressBar
	progress_bar.value = max_time  # Set the progress bar to start at 30
	$Timer.wait_time = max_time
	$Timer.start()

func _process(delta):
	time_left = max(0, time_left - delta)  # Ensure time_left doesn't go below 0
	update_progress_bar()

func update_progress_bar():
	var progress = time_left  # Use time_left directly for progress
	progress_bar.value = progress

func _on_timer_timeout():
	print("Timer ran out!")
	get_tree().change_scene_to_file("res://BlueLevel/TimerRanOutScene.tscn")


