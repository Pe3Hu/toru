class_name SkillResource extends Resource


var member: MemberResource:
	set = set_member
#var aspect: String:
	#set = set_aspect
var grid: Vector2i:
	set = set_grid


func set_grid(grid_: Vector2i) -> SkillResource:
	grid = grid_
	return self
	#
#func set_aspect(aspect_: String) -> SkillResource:
	#aspect = aspect_
	#return self
	
func set_member(member_: MemberResource) -> SkillResource:
	member = member_
	member.skills.append(self)
	member.grids[grid] = self
	return self
