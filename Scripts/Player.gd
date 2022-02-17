extends Area2D

export var player_speed = 400
var screen_size
signal hit

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_right"):
		velocity.x += 1
	if Input.is_action_pressed("player_move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("player_move_down"):
		velocity.y += 1
	if Input.is_action_pressed("player_move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
		$AnimatedSprite.play()
		if velocity.x != 0:
			$AnimatedSprite.flip_h = velocity.x < 0
		if velocity.y != 0:
			$AnimatedSprite.flip_v = velocity.y > 0
			$AnimatedSprite.animation = "up"
		else:
			$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	hide() # Player disappears after being hit.
	emit_signal("hit") # We recieve a signal and then send out another signal
	# set_deferred is used to change properties once the engine has determined
	# that it is safe to make the changed, changing these properties otherwise
	# could raise exceptions if it happens during physics calculations
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
