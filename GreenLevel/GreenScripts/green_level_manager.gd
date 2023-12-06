extends Node3D

@export var reward_spawn: Node3D

const TIME_STONE_SCENE = preload("res://GreenLevel/GreenScenes/time_stone.tscn")
const GOLD_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_gold.tscn")
const SILVER_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_silver.tscn")
const BRONZE_COIN_SCENE = preload("res://GreenLevel/GreenScenes/simple_gem_coin_bronze.tscn")

var REWARD_TIERS = {
	GEM = 40,
	GOLD = 25,
	SILVER = 15,
	BRONZE = 1
}

var gem_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.ensure_audio_playing()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func giveReward():
	if(gem_counter >= REWARD_TIERS.GEM):
		var time_stone = TIME_STONE_SCENE.instantiate()
		time_stone.scale = Vector3.ONE*0.003
		reward_spawn.add_child(time_stone)
		print("Reward: GEM")
	elif(gem_counter >= REWARD_TIERS.GOLD):
		var gold_coin = GOLD_COIN_SCENE.instantiate()
		gold_coin.scale = Vector3.ONE * 2
		reward_spawn.add_child(gold_coin)
		print("Reward: GOLD")
	elif(gem_counter >= REWARD_TIERS.SILVER):
		var silver_coin = SILVER_COIN_SCENE.instantiate()
		silver_coin.scale = Vector3.ONE * 2
		reward_spawn.add_child(silver_coin)
		print("Reward: SILVER")
	elif(gem_counter >= REWARD_TIERS.BRONZE):
		var bronze_coin = BRONZE_COIN_SCENE.instantiate()
		bronze_coin.scale = Vector3.ONE * 2
		reward_spawn.add_child(bronze_coin)
		print("Reward: BRONZE")

func _on_gem_shard_collected():
	gem_counter += 1

func _on_finish_area_finished():
	giveReward()
