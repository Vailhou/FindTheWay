extends AnimatedSprite

const IDLE_ANIM_SPEED = 2
const WALK_ANIM_SPEED = 5

var idle = 'idle'
#var walk = 'walk'
var jump = 'jump'
var fall = 'fall'
var still = 'still'

func _turn(turnedLeft):
	flip_h = turnedLeft

func _setIdleAnimation():
	if animation == idle and get_speed_scale() != IDLE_ANIM_SPEED:
		set_speed_scale(IDLE_ANIM_SPEED)
	else:
		animation = idle
		#spritespeed

func _setWalkAnimation():
	if animation == idle and get_speed_scale() != WALK_ANIM_SPEED:
		set_speed_scale(WALK_ANIM_SPEED)
	else:
		animation = idle

func _setJumpAnimation():
	_setAnimation(jump)
		#yield(get_tree().create_timer(0.07), "timeout")
		#animation = still
		
func _setFallAnimation():
	_setAnimation(fall)
		
func _setStillAnimation():
	_setAnimation(still)
		
func _setAnimation(anim):
	if animation != anim:
		animation = anim