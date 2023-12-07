extends CanvasLayer

func _process(delta):
	$MarginContainer2/VBoxContainer/Label2.text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
