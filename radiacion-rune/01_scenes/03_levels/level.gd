extends Node2D

@onready var playerRef = preload("res://01_scenes/01_characters/00_player.tscn")
@export var initialPosition: Node2D
@export var door: Door
@onready var obstacleRef = preload("res://01_scenes/02_objects/obstacle.tscn")

@export var myDic: Dictionary[Array, Texture2D] = {
	[Vector2.ZERO, Vector2.RIGHT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWE_pr_sprite_02coloreedr_telaRasgadoHorizontaDerecha_v01_001.png"),
	[Vector2.ZERO, Vector2.UP]: preload("res://00_assets/01_sprites/01_characters/00_band/SWE_pr_sprite_02coloreedr_telaRasgadoArriba_v01_001.png"),
	[Vector2.ZERO, Vector2.LEFT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWE_pr_sprite_02coloreedr_telaRasgadoHorizontalzquierda_v01_001.png"),
	[Vector2.ZERO, Vector2.DOWN]: preload("res://00_assets/01_sprites/01_characters/00_band/SWE_pr_sprite_02coloreedr_telaRasgadoAbajo_v01_001.png"),
	[Vector2.LEFT, Vector2.RIGHT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaRectaHorizontal_v01_002.png"),
	[Vector2.LEFT, Vector2.UP]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaAbajo_v01_001.png"),
	[Vector2.LEFT, Vector2.DOWN]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaArriba_v01.png"),
	[Vector2.DOWN, Vector2.RIGHT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaArriba_v01_003.png"),
	[Vector2.DOWN, Vector2.UP]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaRectaVertical_v01_003.png"),
	[Vector2.DOWN, Vector2.LEFT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaArriba_v01.png"),
	[Vector2.UP, Vector2.RIGHT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaIzquierdaAbajo_v01_001.png"),
	[Vector2.UP, Vector2.LEFT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaAbajo_v01_001.png"),
	[Vector2.UP, Vector2.DOWN]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaRectaVertical_v01_003.png"),
	[Vector2.RIGHT, Vector2.UP]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaIzquierdaAbajo_v01_001.png"),
	[Vector2.RIGHT, Vector2.LEFT]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaRectaHorizontal_v01_002.png"),
	[Vector2.RIGHT, Vector2.DOWN]: preload("res://00_assets/01_sprites/01_characters/00_band/SWS_pr_sprite_02colored_telaEsquinaDerechaArriba_v01_003.png"),

}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance := playerRef.instantiate() as Player
	$Entities.add_child(playerInstance)
	playerInstance.set_player(initialPosition.position)
	print('hola')
	playerInstance.bandDirections.connect(createBands)
	playerInstance.collectOneCandy.connect(collected_one_candy)
	pass # Replace with function body.

func createBands(from: Vector2, to: Vector2, current_position: Vector2) -> void:
	var bandObstacle = obstacleRef.instantiate() as Obstacle
	for key in myDic:
		if key == [from, to]:
			bandObstacle.set_band(myDic[[from, to]], current_position)
			add_child(bandObstacle)

func collected_one_candy(candyNumber):
	door.set_count_candy(door.candyGoal - candyNumber)
	if candyNumber >= door.candyGoal:
		door.open_door()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
