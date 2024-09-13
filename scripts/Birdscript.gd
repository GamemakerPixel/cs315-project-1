extends RigidBody2D

# May remove this if not used
var tracking := false
var start_position: Vector2


func _ready() -> void:
	# I chose to use freeze instead of disabling gravity.
	freeze = true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("launch"):
		_begin_tracking(event.position)
	elif event.is_action_released("launch"):
		_launch(event.position)


func _begin_tracking(mouse_start_position: Vector2) -> void:
	tracking = true
	start_position = mouse_start_position


func _launch(mouse_end_position: Vector2) -> void:
	tracking = false
	freeze = false
	var kick_direction = start_position - mouse_end_position
	apply_force(300 * kick_direction)
