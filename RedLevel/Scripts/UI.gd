extends CanvasLayer

func _process(delta):
	$PanelContainer/Label.text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
	
	if(GlobalRedVariable.killAmount >= 55):
		$PanelContainer/Label2.text = "ESCAPE!"
