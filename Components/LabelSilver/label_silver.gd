extends Label

func _ready() -> void:
	_update_text()
	ManagerSilver.manager.silver_updated.connect(_on_silver_updated)

func _update_text() -> void:
	text = "Silver : %s" %ManagerSilver.manager.get_silver()

func _on_silver_updated() -> void:
	_update_text()
