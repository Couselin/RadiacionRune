extends Area2D
class_name Door

@export var candyGoal: int = 0
@export var images: Array[Texture2D]
@export var sprite: Sprite2D

var abierta = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = images[0]
	$Label.text = str(candyGoal)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func open_door():
	sprite.texture = images[1]
	collision_layer = 8
	
func set_count_candy(number):
	$Label.text = str(number)
	
	
