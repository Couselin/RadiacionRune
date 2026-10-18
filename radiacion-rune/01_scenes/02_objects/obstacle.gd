extends Area2D
class_name Obstacle

@export var image: Texture2D
@export var sprite: Sprite2D



func set_band(texture: Texture2D, current_position: Vector2) -> void:
	$Sprite2D.texture = texture
	$Sprite2D.scale *= 0.25
	position = current_position




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
