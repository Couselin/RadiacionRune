extends Area2D

@export var images: Array[Texture2D]
@export var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = images.pick_random()
	pass # Replace with function body.
