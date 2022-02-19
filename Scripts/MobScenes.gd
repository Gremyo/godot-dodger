extends Node

export(PackedScene) var basic_mob_scene = preload("res://Scenes/EnemyScenes/BasicEnemy.tscn")
export(PackedScene) var blaster_mob_scene = preload("res://Scenes/EnemyScenes/BlasterEnemy.tscn")
export(PackedScene) var carrier_mob_scene = preload("res://Scenes/EnemyScenes/CarrierEnemy.tscn")


var avaliable_mobs

func _ready():
	avaliable_mobs = [basic_mob_scene,blaster_mob_scene,carrier_mob_scene]

func get_mob(n):
	return avaliable_mobs[n]

func mob_instantiation(mob_index,spawn_position,spawn_rotation):
	# Create a Mob instance and add it to the scene.
	# the mobspawnlocation path follower rotates to be parralel with the path
	# so we rotate to perpendicularity and then add a variation
	var mob = get_mob(mob_index).instance()
	mob.position = spawn_position
	mob.rotation = spawn_rotation + PI / 2
	return mob
