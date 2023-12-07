extends CanvasLayer

func _process(delta):
	$"../Label".text = "Dummies Smashed: " + str(GlobalRedVariable.killAmount)
	
	if(GlobalRedVariable.killAmount < GlobalRedVariable.killGoal):
		$"../Label2".text = "DESTORY " + str(GlobalRedVariable.killGoal) + " DUMMIES"
	else:
		$"../Label2".text = "ESCAPE!"
