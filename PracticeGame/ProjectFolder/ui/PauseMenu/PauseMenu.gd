extends Control


var isVisible = false;
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ( Input.is_action_just_pressed("esc") ) :
		if (!isVisible) :
			show()
			get_tree().paused = true
			isVisible = !isVisible
		else :
			hide()
			get_tree().paused = false			
			isVisible = !isVisible
	


func _on_resume_button_pressed():
	get_tree().paused = false
	hide()
	isVisible = !isVisible


func _on_exit_button_pressed():
	get_tree().quit()
