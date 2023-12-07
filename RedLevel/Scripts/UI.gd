extends CanvasLayer

func _process(delta):
	$PanelContainer/Label.text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
	
	if(GlobalRedVariable.killAmount >= 55):
		$MarginContainer/VBoxContainer/Label.text = "ESCAPE!"
