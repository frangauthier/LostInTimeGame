extends CanvasLayer

func _process(delta):
	$PanelContainer/Label.text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
	
	if(GlobalRedVariable.killAmount >= GlobalRedVariable.killGoal):
		$PanelContainer/Label2.text = "ESCAPE!"
