extends RigidBody2D

export(PackedScene) var spawned_mob_scene = preload("res://Scenes/EnemyScenes/CarrierSpawnedEnemy.tscn")
var spawned_mob

var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
var spawned_mob_velocity = Vector2(rand_range(650.0, 750.0), 0.0)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	linear_velocity = velocity.rotated(rotation)
	#Spawn a small line showing the player where the laser will be
	$BlasterEnemyTimer.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BlasterEnemyTimer_timeout():
	spawned_mob = spawned_mob_scene.instance()
	spawned_mob.linear_velocity = spawned_mob_velocity.rotated(rotation)
	add_child_below_node(get_tree().get_root(),spawned_mob)
