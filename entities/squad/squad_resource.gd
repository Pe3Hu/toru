class_name SquadResource extends Resource


var dungeon: DungeonResource:
	set = set_dungeon
var guild: GuildResource:
	set = set_guild
var vanguard_members: Array[MemberResource]
var reserve_members: Array[MemberResource]
var rearguard_members: Array[MemberResource]

const vanguard_count = 4
const reserve_count = 4


func set_dungeon(dungeon_: DungeonResource) -> SquadResource:
	dungeon = dungeon_
	dungeon.squad = self
	return self
	
func set_guild(guild_: GuildResource) -> SquadResource:
	guild = guild_
	guild.squads.append(self)
	init_members()
	return self
	
func init_members() -> void:
	for _i in reserve_count:
		var member = guild.members.pick_random()
		add_member(member)
	
	#roll_vanguards()
	
func add_member(member_: MemberResource) -> void:
	member_.squad = self
	reserve_members.append(member_)
	guild.members.erase(member_)
	
func roll_vanguards() -> void:
	for _i in vanguard_count:
		push_random_member("reserve")
	
func push_random_member(detachment_: String) -> void:
	var current_detachmen = get(detachment_ + "_members")
	
	if current_detachmen.size() > 0:
		var member = current_detachmen.pick_random()
		var next_detachment = Global.dict.detachment[detachment_]
		var next_detachmen = get(next_detachment + "_members")
		current_detachmen.erase(member)
		next_detachmen.append(member)
	
