extends RigidBody2D

var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
var rotation_variation = rand_range(-PI / 4, PI / 4)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	linear_velocity = velocity.rotated(rotation)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
