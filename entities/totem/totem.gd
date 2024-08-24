@tool
class_name Totem extends TextureRect


@export_enum("oath", "calmness", "deception", "rage") var type: String = "oath":
	set(type_):
		type = type_
		material = load("res://entities/totem/materials/" + type + ".tres")
		texture = load("res://entities/totem/images/" + type + ".png")
@export var value: int:
	set(value_):
		value = value_
		label.text = str(value)
	get:
		return value
@export var label: Label
