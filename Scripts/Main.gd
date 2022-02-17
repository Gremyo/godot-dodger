extends Node

var score

func _ready():
	randomize()
	new_game()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_ScoreTimer_timeout():
	score += 1

func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation");
	mob_spawn_location.offset = randi()

	# Create a Mob instance and add it to the scene.
	var mob = $MobScenes.get_mob(0).instance()
	mob.position = mob_spawn_location.position
	mob.direction = mob_spawn_location.rotation + PI / 2
	mob.direction += rand_range(-PI / 4, PI / 4)
	add_child(mob)
