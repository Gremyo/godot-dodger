extends RigidBody2D

#export(PackedScene) var basic_mob_scene = preload("res://Scenes/EnemyScenes/CarrierSpawnedEnemy.tscn")

var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
var rotation_variation = rand_range(-PI / 4, PI / 4)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	linear_velocity = velocity.rotated(rotation)
	$CarrierEnemyTimer.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_CarrierEnemyTimer_timeout():
	# Spawn smaller enemies and fire them forward
	pass # Replace with function body.
