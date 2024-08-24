@tool
class_name Skill extends TextureRect


@export_enum("analysis", "flexibility", "intuition", "persistence", "strategy", "tactic") var type: String = "analysis":
	set(type_):
		type = type_
		material = load("res://entities/skill/materials/" + type + ".tres")
		texture = load("res://entities/skill/images/" + type + ".png")
@export var value: int:
	set(value_):
		value = value_
		label.text = str(value)
	get:
		return value
@export var label: Label
