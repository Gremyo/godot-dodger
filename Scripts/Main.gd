extends Node

var score
var intentional_music_stop = false

func _ready():
	randomize()
	$Player.start($StartPosition.position)
	$BGMusic.play()
	
func game_over():
	$BGMusic.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$DeathSound.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	if !$BGMusic.is_playing():
		$BGMusic.play()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation");
	mob_spawn_location.offset = randi()
	var random_mob_index = (randi() % 3)
	var mob = $MobScenes.mob_instantiation(random_mob_index,mob_spawn_location.position,mob_spawn_location.rotation)
	add_child(mob)
