extends Area2D
class_name Obstacle

@export var images: Array[Texture2D]
@export var sprite: Sprite2D



func set_band(texture: Texture2D, current_position: Vector2) -> void:
	$Sprite2D.texture = texture
	position = current_position

func set_random_obstacle():
	$Sprite2D.texture = images.pick_random()
	$Sprite2D.scale *= 0.25


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_random_obstacle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
