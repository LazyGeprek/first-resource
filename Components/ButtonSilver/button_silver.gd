extends Button

@export var silver_to_create: int = 1

func _ready() -> void:
	pressed.connect(_on_pressed)
	text = "Produce %s silver(s)" %silver_to_create

func _on_pressed() -> void:
	ManagerSilver.manager.create_silver(silver_to_create)
