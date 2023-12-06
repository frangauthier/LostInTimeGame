extends CanvasLayer

func _process(delta):
	$MarginContainer/VBoxContainer/Label.text = "Killed: " + str(GlobalRedVariable.killAmount)
