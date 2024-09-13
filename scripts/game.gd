extends Node2D

# Can later be calculated by counting enemies.
@export var max_score: int = 1

var score := 0


func _on_enemy_defeated() -> void:
	score += 1
	$UI.set_score(score)

#TODO: Add a expert_var for fish object to spawn
#TODO: Add a class property for score


#if score is at max - return to main page
#if not at max - spawn a new fish
