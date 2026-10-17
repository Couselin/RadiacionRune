extends CharacterBody2D

var speed := 500
var direction: Vector2


func get_input() -> void:
	direction = Input.get_vector("left", "right", "up", "down")


func _physics_process(delta) -> void:
	get_input()
	velocity = direction * speed
	move_and_slide()
