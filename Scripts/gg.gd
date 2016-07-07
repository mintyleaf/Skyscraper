
extends KinematicBody2D

onready var cam = get_node("Camera2D")
onready var anim_pl = get_node("AnimationPlayer")

var dir #false - left; true = right
var walk = false
var walk_dir #false - left; true = right

export var SPEED = 200

var new_anim = ""

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var mousepos = ((get_viewport().get_mouse_pos()-Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y)/2)
	*cam.get_zoom().x
	+cam.get_camera_screen_center())
	
	var walk_left = Input.is_action_pressed("walk_left")
	var walk_right = Input.is_action_pressed("walk_right")
	
	if new_anim != anim_pl.get_current_animation():
		if dir != walk_dir:
			anim_pl.play_backwards(new_anim)
		else:
			anim_pl.play(new_anim)
	
	if mousepos.x>get_global_pos().x:
		dir = true
		set_scale(Vector2(-1,1))
	else:
		dir = false
		set_scale(Vector2(1,1))
	
	if not walk_left and not walk_right:
		walk = false
		new_anim = "idle"
	elif walk_left:
		move(Vector2(-delta*SPEED,0))
		new_anim = "walk"
		walk_dir = false
	elif walk_right:
		move(Vector2(delta*SPEED,0))
		new_anim = "walk"
		walk_dir = true
		
#	if dir != walk_dir and new_anim != "":
#		new_anim = ""
#	if dir == walk_dir and new_anim != "":
#		new_anim = ""