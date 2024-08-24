class_name Squad extends PanelContainer


@export var dungeon: PanelContainer:
	set = set_dungeon
@export var members: GridContainer

@onready var member_scene = preload("res://entities/member/member.tscn")

var resource: SquadResource


func set_dungeon(dungeon_: Dungeon) -> Squad:
	dungeon = dungeon_
	return self
	
func set_resource(resource_: SquadResource) -> Squad:
	resource = resource_
	return self
	
func _ready() -> void:
	pass
	for member_resource in resource.reserve_members:
		var member = member_scene.instantiate()
		member.set_resource(member_resource).set_squad(self)
