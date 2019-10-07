extends RigidBody2D

onready var player = get_node("../../Player")
onready var texture = get_node("TextureRect")

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass