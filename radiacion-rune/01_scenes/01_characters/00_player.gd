extends CharacterBody2D

var speed := 500
var direction: Vector2


func _ready() -> void:
	get_parent().get_parent().initial_pos.connect(set_initial_character_pos)
	pass

func set_initial_character_pos(initial_pos):
	position = initial_pos.position


func move_character():
	
	pass

func get_input() -> void:
	direction = Input.get_vector("left", "right", "up", "down")


func _physics_process(delta) -> void:
	get_input()
	velocity = direction * speed
	move_and_slide()


func _on_vision_right_body_entered(body: TileMapLayer) -> void:
	if body.is_in_group("floor"):
		print("suelo derecha")
	pass # Replace with function body.
func _on_vision_left_body_entered(body: TileMapLayer) -> void:
	pass # Replace with function body.
func _on_vision_up_body_entered(body: TileMapLayer) -> void:
	pass # Replace with function body.
func _on_vision_down_body_entered(body: TileMapLayer) -> void:
	pass # Replace with function body.
