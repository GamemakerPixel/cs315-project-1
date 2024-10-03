extends RigidBody2D

signal stopped

const STOPPED_SPEED_THRESHOLD = 5.0

var tracking := false
var start_position: Vector2

var fired = false : set = _set_fired
var check_for_stop := false


func _ready() -> void:
	# I chose to use freeze instead of disabling gravity.
	freeze = true


func _physics_process(_delta: float) -> void:
	if check_for_stop:
		_wait_for_stop()


func _unhandled_input(event: InputEvent) -> void:
	if fired:
		return
	if event.is_action_pressed("launch"):
		_begin_tracking(event.position)
	elif event.is_action_released("launch"):
		_launch(event.position)


func _wait_for_stop():
	if linear_velocity.length() <= STOPPED_SPEED_THRESHOLD:
		$WaitAfterStop.start()
		check_for_stop = false


func _stop():
	stopped.emit()
	queue_free()


func _begin_tracking(mouse_start_position: Vector2) -> void:
	tracking = true
	start_position = mouse_start_position


func _launch(mouse_end_position: Vector2) -> void:
	tracking = false
	freeze = false
	var kick_direction = start_position - mouse_end_position
	apply_force(300 * kick_direction)
	set_deferred("fired", true)


func _set_fired(new_fired: bool) -> void:
	fired = new_fired
	if fired:
		check_for_stop = true
