extends Node2D

@onready var playerRef = preload("res://01_scenes/01_characters/00_player.tscn")
@export var initialPosition: Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance = playerRef.instantiate() as Player
	$Entities.add_child(playerInstance)
	playerInstance.set_player(initialPosition.position)
	print('hola')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
