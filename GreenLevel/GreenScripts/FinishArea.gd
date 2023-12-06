extends Area3D

signal finished

func _on_body_entered(body):
	print(body)
	if(body.name =="Venom"):

		finished.emit()
