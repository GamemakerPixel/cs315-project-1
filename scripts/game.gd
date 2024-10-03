extends Node2D

@export_file var menu: String

var max_score: int
var score := 0


func _ready() -> void:
	max_score = $Enemies.get_child_count()


func _on_enemy_defeated() -> void:
	score += 1
	$UI.set_score(score)
	
	_check_win_condition()


func _check_win_condition():
	if score == max_score:
		get_tree().change_scene_to_file(menu)

#TODO: Add a expert_var for fish object to spawn
#TODO: Add a class property for score


#if score is at max - return to main page
#if not at max - spawn a new fish
