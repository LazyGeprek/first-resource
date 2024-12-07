class_name ManagerSilver
extends Node

static var manager: ManagerSilver
var data: GameData

func _init() -> void:
	if not manager: 
		manager = self
	else: 
		queue_free()
		
	data = GameData.new()

# Newsletters
signal silver_updated
signal silver_created(quantity: int)
signal silver_spent(quantity: int)

# an underscore before a variable name means its private
var _silver : int = data.total_silver

# this is to get the silver 
func get_silver() -> int:
	return _silver

# add silver. checks if quantity is positive
func create_silver(quantity: int) -> void:
	if quantity <= 0:
		return

	_silver += quantity

	silver_created.emit(quantity)
	silver_updated.emit()
	data.total_silver = _silver

# check if you can spend
func can_spend(quantity: int) -> bool:
	if quantity < 0:
		return false
	if quantity > _silver:
		return false
	return true

# spend the silvers
func spend_silver(quantity: int) -> Error:
	if quantity < 0:
		return Error.FAILED

	if quantity > _silver:
		return Error.FAILED
	
	_silver -= quantity
	
	silver_spent.emit(quantity)
	silver_updated.emit()
	data.total_silver = _silver
	
	return Error.OK
