@tool
extends Node

@export_range(2, 30) var segments: int = 2 : set = _set_segments


func _set_segments(new_segments: int) -> void:
	segments = new_segments
	$Sprites.segments = segments
	$Collision.segments = segments
