
extends Panel
onready var cam = get_node('../../gg/Camera2D')

func _ready():
	pass


func _on_bt_zoom_inc_pressed():
	cam.set_zoom(Vector2(cam.get_zoom().x+1,cam.get_zoom().y+1))


func _on_bt_zoom_dec_pressed():
	cam.set_zoom(Vector2(cam.get_zoom().x-1,cam.get_zoom().y-1))
