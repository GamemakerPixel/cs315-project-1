extends RigidBody2D

signal enemy_defeated


func _on_body_entered(_body):
	set_deferred("freeze", true)
	$CollisionShape2D.set_deferred("disabled", true)
	$Animation.play("death")
	# Add score


func _on_particles_finished() -> void:
	enemy_defeated.emit()
	queue_free()
