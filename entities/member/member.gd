class_name Member extends PanelContainer


@export var skills: Control

@onready var skill_scene = preload("res://entities/skill/skill.tscn")

var squad: Squad:
	set = set_squad
var resource: MemberResource:
	set = set_resource


func set_squad(squad_: Squad) -> Member:
	squad = squad_
	squad.members.add_child(self)
	init_skills()
	return self
	
func set_resource(resource_: MemberResource) -> Member:
	resource = resource_
	return self
	
func init_skills() -> void:
	var skill_size = Vector2(32, 32)
	var n = 3
	custom_minimum_size = skill_size * n
	
	for _i in n:
		for _j in n:
			if _i != n/2 or _j != n/2:
				Global.rng.randomize()
				var random = Global.rng.randf_range(0, 1)
				
				if random > 0.5:
					var grid = Vector2i(_j, _i)
					var skill = skill_scene.instantiate()
					skills.add_child(skill)
					skill.position = skill_size * Vector2(grid)
					Global.rng.randomize()
					skill.value = Global.rng.randi_range(1, 3)
					skill.type = Global.arr.skill.pick_random()
