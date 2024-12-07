extends Node

const SAVE_DIR = "user://Saves/"
const SAVE_FILE_NAME = "save.json"
const SECURITY_KEY = "123456"

func _ready():
	verify_save_directory(SAVE_DIR)

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

"""
func save_data(path : String):
	var file = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, SECURITY_KEY)
	if file == null:
		print(FileAccess.get_open_error())
		return
	
	var data = {
		"GameData":{
			"total_silver": GameData.total_silver
		}
	}
	
	var json_string = JSON.stringify(data, "\t")

func load_data(path : String):
	if FileAccess.file_exists(path):
		var file = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, SECURITY_KEY)
		if file == null:
			print(FileAccess.get_open_error())
			return
		var content = file.get_as_text()
		file.close()
		
		var data = JSON.parse_string(content)
		if data == null:
			printerr("Can't parse %s" % [path])
			return
		
	else:
		printerr("No file at %s" % [path])
"""
