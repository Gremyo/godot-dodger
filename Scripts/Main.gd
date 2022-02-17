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
	
func mob_instantiation(mob_index,spawn_position,spawn_rotation):
	# Create a Mob instance and add it to the scene.
	# the mobspawnlocation path follower rotates to be parralel with the path
	# so we rotate to perpendicularity and then add a variation
	var mob = $MobScenes.get_mob(mob_index).instance()
	mob.position = spawn_position
	mob.rotation = spawn_rotation + PI / 2 + mob.rotation_variation
	return mob

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_ScoreTimer_timeout():
	score += 1

func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation");
	mob_spawn_location.offset = randi()
	var mob = mob_instantiation(0,mob_spawn_location.position,mob_spawn_location.rotation)
	add_child(mob)
