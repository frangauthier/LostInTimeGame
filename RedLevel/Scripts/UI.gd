extends CanvasLayer

func _process(delta):
	$PanelContainer/Label.text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
