extends Node

onready var file = File.new()

func load_data(url):
	if url == null: return
	if !file.file_exists(url): return
	file.open(url, File.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data

func write_data(url, dict):
	if url == null: return
	file.open(url, File.WRITE)
	file.store_line(to_json(dict))
	file.close()
	return

func load_inv(url):
	var i
	if url == null: return
	if !file.file_exists(url): return
	file.open(url, File.READ)
	i = file.get_var()
	file.close()
	return i

func write_inv(url,i):
	if url == null: return
	file.open(url, file.WRITE)
	file.store_var(i)
	file.close()