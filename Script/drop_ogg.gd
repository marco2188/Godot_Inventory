extends Node2D

export(bool) var eliminable
export(int, 1,3) var index_ 
var mouse_in = false
signal drop_ogg(index)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("click_sx") and mouse_in:
			drop_obj()
		elif event.is_action_pressed("click_dx") and mouse_in:
			print('dx')

func _on_Sprite_mouse_entered():
	mouse_in = true
	pass # Replace with function body.


func _on_Sprite_mouse_exited():
	mouse_in = false
	pass # Replace with function body.

func drop_obj():
	emit_signal("drop_ogg",index_)
	if eliminable: queue_free()