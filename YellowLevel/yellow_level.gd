extends Node3D

@export var tire_max_count = 3
@export var football_max_count = 2

var tire_retrieved_count = 0
var football_retrieved_count = 0

var victory = false
#@onready var tire_label_score = $UI/CanvasLayer/MarginContainer/HBoxContainer2/TireScore
#@onready var football_label_score = $UI/CanvasLayer/MarginContainer/HBoxContainer/FootballScore
## Called when the node enters the scene tree for the first time.
#func _ready():
#	update_labels()
#
func update_labels():
#	tire_label_score.text = str(tire_retrieved_count) + "/" + str(tire_max_count)
#	football_label_score.text = str(football_retrieved_count) + "/" + str(football_max_count)
	pass
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		tire_retrieved_count += 1
	pass
#
#
func _on_tire_entered(area):
	print("Tire entered")	
	tire_retrieved_count += 1
	update_labels()
	check_victory()


func _on_tire_exited(area):
	tire_retrieved_count -= 1
	update_labels()
	check_victory()


func _on_football_entered(area):
	print("FOOTBALL entered")
	football_retrieved_count += 1
	update_labels()
	check_victory()


func _on_football_exited(area):
	print("FOOTBALL exited")
	football_retrieved_count -= 1
	update_labels()
	check_victory()

func check_victory():
	if tire_retrieved_count >= 2 and not victory:
		Globals.complete_level("yellow")
		victory = true
		$Spawned/Yellow_gem.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property($TireEnclosure/LowWall, "position", $TireEnclosure/LowWall.position + Vector3(0, 1.961, 0), 3)
	pass
