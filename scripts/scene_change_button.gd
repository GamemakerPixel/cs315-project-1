extends Button

@export_file var game_scene_path: String


func _ready() -> void:
	connect("pressed", _on_pressed)


func _on_pressed():
	get_tree().change_scene_to_file(game_scene_path)
