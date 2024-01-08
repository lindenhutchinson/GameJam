extends CharacterBody2D


const SPEED = 300.0
const fireBallPath = preload("res://Nodes/FireBall.tscn")

func _physics_process(delta):
	var xDir = Input.get_axis("moveLeft", "moveRight")
	var yDir = Input.get_axis("moveUp", "moveDown")
	
	var directions = Vector2(xDir,yDir)
	if directions!=Vector2.ZERO:
		fireBall()
		velocity = directions * SPEED
	else:
		fireBall()		
		velocity = velocity.move_toward(Vector2(0,0), SPEED)
		
	move_and_slide()
	
func fireBall():
	if ( Input.is_action_just_pressed("FireBall") ) :
		var fireball = fireBallPath.instantiate() as RigidBody2D
		fireball.linear_velocity = Vector2(200,200)*get_local_mouse_position().normalized()
		get_parent().add_child(fireball)
