extends CanvasLayer

@export_group("Atlas Animation")
@export var texture_to_animate: TextureRect
@export var atlas_texture: AtlasTexture
@export var atlas_total_columns: int
@export var atlas_total_rows: int
@export var atlas_texture_width: int
@export var atlas_texture_height: int
@export var frames_per_second: float = 5.0

@onready var counter_label: Label = $CollectionContainer/VBoxContainer/HBoxContainer/Counter

var atlas_rect: Rect2
var current_frame: float = 0
var total_frames
var gem_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(texture_to_animate, "Texture to animate not set in the inspector.")
	assert(atlas_texture, "Atlas texture not set in the inspector.")
	
	atlas_rect = atlas_texture.get_region()
	total_frames = atlas_total_columns * atlas_total_rows - 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gem_shard_animation(delta)

func gem_shard_animation(delta: float):
		# Increment current frame based on time
	current_frame += delta * frames_per_second
	
	# Wrap the frame index to stay within bounds
	current_frame = fmod(current_frame, total_frames)
	
	# Cast the current frame to an integer when setting the region
	var current_atlas_frame = int(current_frame)
	
	# Calculate the current column and row based on the frame index
	var current_column = current_atlas_frame % atlas_total_columns
	var current_row = current_atlas_frame / atlas_total_columns
	
	# Calculate the new region position
	var new_region_x = current_column * atlas_texture_width
	var new_region_y = current_row * atlas_texture_height
	
	# Set the new region for the AtlasTexture
	atlas_rect.position = Vector2(new_region_x, new_region_y)
	atlas_texture.set_region(atlas_rect)
	
	# Update the texture in the TextureRect
	texture_to_animate.texture = atlas_texture


func _on_gem_shard_collected():
	gem_counter += 1
	counter_label.text = "x " + str(gem_counter)
