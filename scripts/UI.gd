extends CanvasLayer

signal win_screen_shown

const WIN_ANIMATION = "win_screen"

const SCORE_TEXT_PREFIX = "Score: "


func set_score(score: int) -> void:
	$Margin/Header/Label.text = SCORE_TEXT_PREFIX + str(score)


func trigger_win() -> void:
	$AnimationPlayer.play(WIN_ANIMATION)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == WIN_ANIMATION:
		win_screen_shown.emit()
