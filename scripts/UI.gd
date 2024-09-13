extends CanvasLayer

const SCORE_TEXT_PREFIX = "Score: "


func set_score(score: int) -> void:
	$Margin/Header/Label.text = SCORE_TEXT_PREFIX + str(score)
