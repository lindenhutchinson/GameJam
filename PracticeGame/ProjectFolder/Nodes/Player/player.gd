extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta):

	var xDir = Input.get_axis("ui_left", "ui_right")
	var yDir = Input.get_axis("ui_up", "ui_down")
	var directions = Vector2(xDir,yDir)
	if directions:
		velocity = directions * SPEED
	else:
		velocity = velocity.move_toward(Vector2(0,0), SPEED)


	move_and_slide()
