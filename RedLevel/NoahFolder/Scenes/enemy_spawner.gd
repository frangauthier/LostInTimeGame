extends Node3D

var enemyScene: PackedScene = preload("res://RedLevel/NoahFolder/Scenes/enemy.tscn")
@onready var timer: Timer = $Timer
var spawn_position

@onready var count: float = 0

func _ready():
	spawn_position = $".".global_position
	
	spawnEnemy()
	
	setTimer()
	timer.start()


func _process(delta):
	
	if timer.is_stopped():
		setTimer()
		timer.start()
		spawnEnemy()
	
	pass

func setTimer():
	timer.wait_time = randf_range(1, 5)
	pass

func spawnEnemy():
	print('Spawning...')
	
	var enemy = enemyScene.instantiate() as Node3D
	$"../Enemies".add_child(enemy)
	enemy.global_position = spawn_position
