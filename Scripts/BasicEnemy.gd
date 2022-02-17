extends RigidBody2D

var direction
var velocity = Vector2(rand_range(150.0, 250.0), 0.0)

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.playing = true
	rotation = direction
	linear_velocity = velocity.rotated(direction)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
