extends Node3D

@onready var bgm_player: AudioStreamPlayer3D = $"SoundPlayers/BGM-Player"
@onready var ambiance_player: AudioStreamPlayer3D = $"SoundPlayers/Ambience-Player"
@onready var player: CharacterBody3D = $Player
@onready var spawn_point: Node3D = $SpawnPoint

const TIME_STONE_SCENE = preload("res://GreenLevel/GreenScenes/time_stone.tscn")
const GOLD_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_gold.tscn")
const SILVER_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_silver.tscn")
const BRONZE_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_bronze.tscn")

var REWARD_TIERS = {
	GEM = 50,
	GOLD = 30,
	SILVER = 20,
	BRONZE = 10
}

var gem_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ambiance_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func giveReward():
	if(gem_counter >= REWARD_TIERS.GEM):
		var time_stone = TIME_STONE_SCENE.instantiate()
		time_stone.scale = Vector3.ONE*0.003
		$SpawnPoint.add_child(time_stone)
		print("Reward: GEM")
	elif(gem_counter >= REWARD_TIERS.GOLD):
		var gold_coin = GOLD_COIN_SCENE.instantiate()
		gold_coin.scale = Vector3.ONE * 2
		$SpawnPoint.add_child(gold_coin)
		print("Reward: GOLD")
	elif(gem_counter >= REWARD_TIERS.SILVER):
		var silver_coin = SILVER_COIN_SCENE.instantiate()
		silver_coin.scale = Vector3.ONE * 2
		$SpawnPoint.add_child(silver_coin)
		print("Reward: SILVER")
	elif(gem_counter >= REWARD_TIERS.BRONZE):
		var bronze_coin = BRONZE_COIN_SCENE.instantiate()
		bronze_coin.scale = Vector3.ONE * 2
		$SpawnPoint.add_child(bronze_coin)
		print("Reward: BRONZE")

func respawn():
	player.set_position(spawn_point.global_position)

func _on_gem_shard_collected():
	gem_counter += 1

func _on_death_zone_body_entered(_body):
	print("dead")
	respawn()

func _on_goal_body_entered(_body):
	giveReward()
