extends Node

var inv = []
var inv_pos = [Vector2(312,545),Vector2(392,545),Vector2(472,545),Vector2(552,545),Vector2(632,545),Vector2(712,545)]

func _ready():
	inv = Game_Manager.inventario
	update_inv(inv)

func update_inv(i):
	for obj in $obj_list.get_children():
		obj.queue_free()
	var inv_lens = len(i)
	if inv_lens == 0 : return
	for j in inv_lens:
		create_inv_og(str(i[j]),inv_pos[j],j)

func create_inv_og(index_og,index_pos,j):
	var ogg_data = Global_itemdatabase.get_item(index_og)
	var ogg = load('res://Scene/og.tscn').instance()
	ogg._name = ogg_data['name']
	ogg._icon = ogg_data['icon']
	ogg._description = ogg_data['description']
	ogg._id = j
	ogg.global_position = index_pos
	ogg.connect('obj_used',self,'remove_obj')
	$obj_list.add_child(ogg)

func add_obj(id):
	if len(inv) == 6: return
	inv.append(id)
	update_inv(inv)
	print(inv)

func remove_obj(id):
	inv.remove(id)
	update_inv(inv)
	print(inv)

func save_inventory(i):
	Global_data_parser.write_inv("res://Database/inventory.save",i)

func _on_Button_pressed():
	save_inventory(inv)
	pass # Replace with function body.
