extends CanvasLayer


var progress_bar : TextureProgressBar
var time_left : float = 30.0

func _ready():
	progress_bar = $MarginContainer2/HBoxContainer2/TextureProgressBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$TargetContainer/HBoxContainer/TargetVar.text = str(Globals.targetDestroyed)
	update_progress_bar()
	pass

func update_progress_bar():
	# Calculate the progress based on the remaining time
	var progress = time_left / 30.0
	# Update the progress bar value
	progress_bar.value = progress

func _on_timer_timeout():
	# Display a message when the timer runs out
	print("Timer ran out!")
	# Reload the scene (replace 'blue_level' with your actual scene name)
	get_tree().change_scene("res://blue_level.tscn")
