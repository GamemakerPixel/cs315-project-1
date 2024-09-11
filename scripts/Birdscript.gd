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
			
			
			#set gravity_scale to 1
	
			
			#apply a force in the kickDr direction * 300
		
			


