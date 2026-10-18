extends Node2D

@onready var playerRef = preload("res://01_scenes/01_characters/00_player.tscn")
@export var initialPosition: Node2D


@export var myDic: Dictionary[Array, Texture2D] = {
	[Vector2.LEFT, Vector2.RIGHT]: preload("res://00_assets/01_sprites/04_props/SWS_pr_sprite_placeholder_caramelo_v01_001.png"),
	[Vector2.DOWN, Vector2.RIGHT]: preload("res://00_assets/01_sprites/03_ui/99_test/LowPolyCat.png")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance := playerRef.instantiate() as Player
	$Entities.add_child(playerInstance)
	playerInstance.set_player(initialPosition.position)
	print('hola')
	playerInstance.bandDirections.connect(createBands)
	pass # Replace with function body.

func createBands(from: Vector2, to: Vector2, current_position: Vector2) -> void:
	var image = Sprite2D.new()
	for key in myDic:
		if key == [from, to]:
			print('hola')
			print(myDic[[from, to]])
			image.texture = myDic[[from, to]]
			image.position = current_position
			add_child(image)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
