extends CanvasLayer

func _process(delta):
	$MarginContainer/VBoxContainer/Label.text = "Killed: " + str(GlobalRedVariable.killAmount)
	
	if(GlobalRedVariable.killAmount >= 55):
		$MarginContainer/VBoxContainer/Label.text = "ESCAPE!"
