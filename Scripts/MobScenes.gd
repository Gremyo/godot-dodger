extends Node

export(PackedScene) var basic_mob_scene = preload("res://Scenes/EnemyScenes/BasicEnemy.tscn")

var avaliable_mobs

func _ready():
	avaliable_mobs = [basic_mob_scene]

func get_mob(n):
	return avaliable_mobs[n]
