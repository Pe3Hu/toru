class_name MemberResource extends Resource


var guild: GuildResource:
	set = set_guild
var aspect: String:
	set = set_aspect
var skills: Array[SkillResource]
var grids: Dictionary
var squad: SquadResource


func set_aspect(aspect_: String) -> MemberResource:
	aspect = aspect_
	return self
	
func set_guild(guild_: GuildResource) -> MemberResource:
	guild = guild_
	guild.members.append(self)
	init_skills()
	return self
	
func init_skills() -> void:
	var n = 5
	
	for _i in n:
		for _j in n:
			var grid = Vector2i(_j, _i)
			var skill = SkillResource.new()
			skill.set_grid(grid).set_member(self)
