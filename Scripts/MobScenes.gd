extends Node

export(PackedScene) var basic_mob_scene = preload("res://Scenes/EnemyScenes/BasicEnemy.tscn")
export(PackedScene) var blaster_mob_scene = preload("res://Scenes/EnemyScenes/BlasterEnemy.tscn")
export(PackedScene) var carrier_mob_scene = preload("res://Scenes/EnemyScenes/CarrierEnemy.tscn")


var avaliable_mobs

func _ready():
	avaliable_mobs = [basic_mob_scene,blaster_mob_scene,carrier_mob_scene]

func get_mob(n):
	return avaliable_mobs[n]

func mob_instantiation(mob_index,spawn_node,player_position):
	# Create a Mob instance and add it to the scene.
	# the mobspawnlocation path follower rotates to be parralel with the path
	# so we rotate to perpendicularity and then add a variation
	var mob = get_mob(mob_index).instance()
	mob.position = spawn_node.position
	if "player_position" in mob:
		mob.player_position = player_position
	else:
		mob.rotation = spawn_node.rotation + PI / 2
	return mob
