extends KinematicBody2D
# This script controls movement.
export var gravity = 10 #original: 25
export var speed = 200
export var jump_force = 550

const UP = Vector2(0, -1)
var motion = Vector2()

#Controller
#var startingPos = Vector2(self.position)
#var deadZone = 0.2
#var speedMultiplier = 3

onready var playerSprite = get_node("AnimatedSprite")
onready var jump = get_node("Jump")

func _physics_process(delta):
	motion.y += gravity
	
	var collision_info = move_and_collide(Vector2(0, 0) * 0 * delta)
	if collision_info != null:
		var collider = collision_info.collider
		if collision_info and collider.has_method("_show"):
			collider._show()
	
	#Make sure at least one Joystick is connected
  	#if Input.get_connected_joypads().size() > 0:
    #	var xAxis = Input.get_joy_axis(0,JOY_AXIS_7)
    #	if abs(xAxis) > deadZone:
	#
	#		if xAxis < 0:
    #    		self.position.x-= 100 * delta * ( speedMultiplier * abs(xAxis))
    #		if xAxis > 0:
    #    		self.position.x+= 100 * delta * ( speedMultiplier * abs(xAxis))
	
	if Input.is_action_pressed("ui_right"):
		_walkright()
	
	elif Input.is_action_pressed('ui_left'):
		_walkLeft()
		
		
	else:
		motion.x = 0
		if is_on_floor():
			playerSprite._setIdleAnimation()
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up') or Input.is_joy_button_pressed(0, JOY_BUTTON_0):
			_jump()
		
	#Stops player from gaining downward speed while on groud.	
	motion = move_and_slide(motion, UP)
	
func _walkLeft():
	motion.x = -speed
	playerSprite._turn(true)
	if is_on_floor():
		playerSprite._setWalkAnimation()
	else:
		playerSprite._setFallAnimation()
			
func _walkright():
	motion.x = speed
	playerSprite._turn(false)
	if is_on_floor():
		playerSprite._setWalkAnimation()
	else:
		playerSprite._setFallAnimation()
		
func _jump():
	motion.y = -jump_force
	playerSprite._setJumpAnimation()
	jump.play()