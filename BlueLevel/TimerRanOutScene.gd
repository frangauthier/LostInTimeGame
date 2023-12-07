extends CanvasLayer

func _ready():
	pass

func _process(_delta):
	pass

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://BlueLevel/blue_level.tscn")
	print("Clicked")
	get_tree().set_pause(false)

func _on_quit_button_pressed():
	get_tree().quit()

func _on_menu_button_pressed():
	print("Clicked")
	get_tree().set_pause(false)
	get_tree().change_scene_to_file("res://Common/Scenes/Levels/lost_in_time_world.tscn")
	pass # Replace with function body.
