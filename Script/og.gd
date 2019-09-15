extends Node2D

export var _name = ""
export var _icon = ""
export var _description = ""
export var _id: int

var mouse_in = false
signal obj_used(id)

func _ready():
	$og_Sprite.texture = load(_icon)
	print(_id)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("click_sx") and mouse_in:
			use_obj()

func _on_og_Sprite_mouse_entered():
	mouse_in = true
	pass # Replace with function body.


func _on_og_Sprite_mouse_exited():
	mouse_in = false
	pass # Replace with function body.

func use_obj():
	emit_signal("obj_used",_id)
	pass

