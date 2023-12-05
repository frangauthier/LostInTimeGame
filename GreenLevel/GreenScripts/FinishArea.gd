extends Area3D

signal finished

func _on_body_entered(body):
	finished.emit()
