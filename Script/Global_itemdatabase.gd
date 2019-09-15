extends Node

var url_database_item = "res://Database/database.json"

func get_item(id):
	var itemdata = {}
	itemdata = Global_data_parser.load_data(url_database_item)
	
	if !itemdata.has(str(id)):
		print("nessun oggetto")
		return
	
	#itemdata[str(id)]["id"] = int(id)
	return itemdata[str(id)]