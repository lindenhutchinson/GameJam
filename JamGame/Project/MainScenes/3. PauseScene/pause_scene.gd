extends Control

# visibility of this node
var isVisible = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# if escape button pressed
	if ( Input.is_action_just_pressed("esc") ) :
		# if this node not visible it shows it and pauses the process of whole game/tree
		# it doesn't pause the prosses of this node because i have set the process of this node to 'Always' 
		if (!isVisible) :
			show()
			get_tree().paused = true
			isVisible = !isVisible
		else :
			# if visible it hides it
			hide()
			get_tree().paused = false			
			isVisible = !isVisible
	


func _on_resume_button_pressed():
	get_tree().paused = false
	hide()
	isVisible = !isVisible


func _on_exit_button_pressed():
	get_tree().quit()

