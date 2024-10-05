@tool
extends CollisionShape2D

@export var width: float = 32 : set = _set_width
@export var segment_height: float = 16 : set = _set_segment_height

var segments = 2 : set = _set_segments


func _set_segments(new_segments: int) -> void:
	segments = new_segments
	_generate_collision()


func _set_width(new_width: float) -> void:
	width = new_width
	_generate_collision()


func _set_segment_height(new_segment_height: float) -> void:
	segment_height = new_segment_height
	_generate_collision()


func _generate_collision() -> void:
	var collision_shape := RectangleShape2D.new()
	collision_shape.size.x = width
	collision_shape.size.y = segments * segment_height
	shape = collision_shape
