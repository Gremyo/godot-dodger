extends RigidBody2D

var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
var rotation_variation = rand_range(-PI / 4, PI / 4)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	linear_velocity = velocity.rotated(rotation)
	#Spawn a small line showing the player where the laser will be
	$BlasterEnemyTimer.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BlasterEnemyTimer_timeout():
	#Fire large laser that hits player, laser should be as wide as enemy eye
	pass # Replace with function body.
