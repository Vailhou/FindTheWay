extends KinematicBody2D

onready var player = get_node("../../Player")
onready var texture = get_node("TextureRect")

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_info = move_and_collide(Vector2(0, 0) * 0 * delta)
	
	if collision_info:
		var bodyHit = (collision_info.collider)
		if bodyHit == player:
			texture.show()