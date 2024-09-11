extends RigidBody2D

var tracking = false
var startPos = Vector2()

func _input(evt):
	if( evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT):
		if(evt.is_pressed()):
			tracking = true
			startPos = evt.position
		else:
			tracking = false
			
			#TODO:
			#set a varible kickDir to the difference between startPos and evt.position
			var kickDir = startPos - evt.position
			
			#set gravity_scale to 1
			gravity_scale = 1.0
			
			#apply a force in the kickDr direction * 300
			apply_force(300 * kickDir)
			
