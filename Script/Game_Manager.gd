extends Node

var inventario: Array

func _ready():
	inventario = Global_data_parser.load_inv("res://Database/inventory.save")