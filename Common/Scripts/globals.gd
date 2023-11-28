extends Node

const GEM_COLORS = {
	BLUE = "blue",
	RED = "red",
	YELLOW = "yellow",
	GREEN = "green"
}

var gem_collected = {
	"blue": false,
	"red": false,
	"yellow": false,
	"green": false,
}

func complete_level(gem_color: String):
	if [GEM_COLORS.BLUE, GEM_COLORS.RED, GEM_COLORS.YELLOW, GEM_COLORS.GREEN].has(gem_color):
		gem_collected[gem_color] = true
		check_victory()

var end_game_menu: PackedScene = preload("res://Common/Scenes/UI/EndGameMenu.tscn")
func check_victory():
	if gem_collected[GEM_COLORS.BLUE] and gem_collected[GEM_COLORS.RED] and gem_collected[GEM_COLORS.YELLOW] and gem_collected[GEM_COLORS.GREEN]:
		print("Victory!!")
		var end_menu = end_game_menu.instantiate()
		add_child(end_menu)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true

const level_scenes = {
	"blue": "res://BlueLevel/blue_level.tscn",
	"red": "res://RedLevel/red_level.tscn",
	"yellow": "res://YellowLevel/yellow_level.tscn",
	"green": "res://GreenLevel/green_level.tscn",
}
func load_level(gem_color: String):
	var next_scene = load(level_scenes[gem_color])
	get_tree().change_scene_to_packed(next_scene)
	

