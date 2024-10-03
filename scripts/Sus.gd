extends RigidBody2D

signal enemy_defeated

const DEATH_THRESHOLD_SPEED = 300


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	for collision_index in range(state.get_contact_count()):
		var contact_velocity := state.get_contact_local_velocity_at_position(collision_index)
		if contact_velocity.length() >= DEATH_THRESHOLD_SPEED:
			_die()


func _die() -> void:
	set_deferred("freeze", true)
	$CollisionShape2D.set_deferred("disabled", true)
	$Animation.play("death")


func _on_particles_finished() -> void:
	enemy_defeated.emit()
	queue_free()
