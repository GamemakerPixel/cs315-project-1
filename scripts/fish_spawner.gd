extends Node2D

@export var fish_scene: PackedScene


func _ready() -> void:
	_spawn_fish()


func _spawn_fish() -> void:
	var fish = fish_scene.instantiate()
	fish.stopped.connect(_on_fish_stopped)
	add_child(fish)


func _on_fish_stopped() -> void:
	_spawn_fish()
