@tool
extends CollisionShape2D

@export var radius: float = 16 : set = _set_radius
@export var segment_height: float = 16 : set = _set_segment_height

var segments = 2 : set = _set_segments


func _set_segments(new_segments: int) -> void:
	segments = new_segments
	_generate_collision()


func _set_radius(new_radius: float) -> void:
	radius = new_radius
	_generate_collision()


func _set_segment_height(new_segment_height: float) -> void:
	segment_height = new_segment_height
	_generate_collision()


func _generate_collision() -> void:
	var collision_shape := CapsuleShape2D.new()
	collision_shape.radius = radius
	collision_shape.height = segments * segment_height
	shape = collision_shape
