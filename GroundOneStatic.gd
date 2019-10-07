extends StaticBody2D

onready var texture = get_node("TextureRect")
onready var blockReveal = get_node("BlockReveal")

func _ready():
	_hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _hide():
	texture.hide()

func _show():
	if not texture.is_visible():
		texture.show()
		blockReveal.play()