@tool
extends Node2D

@export var body_texture: Texture2D

var segments: int = 2 : set = _set_segments


func _set_segments(new_segments: int) -> void:
	segments = new_segments
	_move_head_and_tail()
	_create_body_segments()


func _move_head_and_tail() -> void:
	var segment_length := body_texture.get_height()
	
	$Head.position.y = -segment_length * (segments - 1) / 2
	$Tail.position.y = segment_length * (segments - 1) / 2


func _create_body_segments() -> void:
	var body_segments = segments - 2
	var segment_length := body_texture.get_height()
	
	for segment in $Body.get_children():
		segment.queue_free()
	
	var start_position: float = -segment_length * (body_segments - 1) / 2.0
	var end_position: float = segment_length * (body_segments - 1) / 2.0
	
	for index in range(body_segments):
		var time: float
		if body_segments > 1:
			time = float(index) / (body_segments - 1)
		else:
			time = 0.5
		var segment_position = lerp(start_position, end_position, time)
		
		var segment_sprite = Sprite2D.new()
		segment_sprite.texture = body_texture
		segment_sprite.position.y = segment_position
		$Body.add_child(segment_sprite)
