extends RigidBody2D

export(PackedScene) var spawned_mob_scene = preload("res://Scenes/EnemyScenes/CarrierSpawnedEnemy.tscn")
var spawned_mob_1
var spawned_mob_2
var spawned_mob_velocity = Vector2(rand_range(350.0, 450.0), 0.0)

var velocity = Vector2(rand_range(100.0, 200.0), 0.0)
var rotation_variation = rand_range(-PI / 4, PI / 4)

func _ready():
	rotation += rotation_variation
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	linear_velocity = velocity.rotated(rotation)
	$CarrierEnemyTimer.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_CarrierEnemyTimer_timeout():
	spawned_mob_1 = spawned_mob_scene.instance()
	spawned_mob_2 = spawned_mob_scene.instance()
	spawned_mob_1.position += Vector2(50,0).rotated(PI/2)
	spawned_mob_2.position += -Vector2(50,0).rotated(PI/2)
	spawned_mob_1.linear_velocity = spawned_mob_velocity.rotated(rotation)
	spawned_mob_2.linear_velocity = spawned_mob_velocity.rotated(rotation)
	add_child_below_node(get_tree().get_root(),spawned_mob_1)
	add_child_below_node(get_tree().get_root(),spawned_mob_2)
