extends RigidBody2D

export(PackedScene) var spawned_mob_scene = preload("res://Scenes/EnemyScenes/CarrierSpawnedEnemy.tscn")

var spawned_mob
var player_position
var sub_vector

var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
var spawned_mob_velocity = Vector2(rand_range(550.0, 650.0), 0.0)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	
	#gets the direction from object to player
	sub_vector = player_position - position
	
	rotation = sub_vector.angle()
	linear_velocity = velocity.rotated(rotation)
	
	#Gets the origin point of the sprite and creates an end point for a line
	#thats 2*the velocity away
	$BlasterLine.add_point($BlasterLine.points[0]+2*velocity)
	
	$BlasterLineTimer.start()
	$BlasterEnemyTimer.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BlasterEnemyTimer_timeout():
	$BlasterLine.clear_points()
	spawned_mob = spawned_mob_scene.instance()
	spawned_mob.linear_velocity = spawned_mob_velocity.rotated(rotation)
	add_child_below_node(get_tree().get_root(),spawned_mob)


func _on_BlasterLineTimer_timeout():
	$BlasterLine.default_color = Color.darkred
