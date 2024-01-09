extends CharacterBody2D

# This variable defines the speed of the player
const SPEED = 300.0

# This variable loads the ranged attack
const fireBallPath = preload("res://Nodes/FireBall.tscn")


@onready var timer = $Timer

func _physics_process(delta):
	# Stores the movement input on the X axis
	var xDir = Input.get_axis("moveLeft", "moveRight")
	# Stores the movement input on the Y axis
	var yDir = Input.get_axis("moveUp", "moveDown")
	
	# A 2D Vector is created to store the player's movement inputs
	var directions = Vector2(xDir,yDir)
	
	# Is the direction stored in the 2D vector different from "0"?
	if directions!=Vector2.ZERO: # Yes it is
		# The velocity of the player is now their direction in the 2D Vector, multiplied by the movement speed
		velocity = directions * SPEED
	else: # No it isn't
		# The player will brake smoothly until stopped
		velocity = velocity.move_toward(Vector2(0,0), SPEED)
	
	move_and_slide()
	
func _ready():
	timer.connect("timeout", self._on_timer_timeout)
	timer.start()
	

func _on_timer_timeout():
	fireBall()

func fireBall():
	var enemy = get_tree().get_first_node_in_group("enemy")
	# Are there enemies alive?
	if enemy != null: # Yes there are
		# Instantiate a fireball
		var fireball = fireBallPath.instantiate() as RigidBody2D
		# Get the nearest enemy direction
		var enemyDirection = global_position.direction_to(enemy.global_position)
		var fireballSpeed = 500.0
		fireball.linear_velocity = enemyDirection.normalized()*fireballSpeed
		get_parent().add_child.call_deferred(fireball)
	else:
		print("This is a debug message, there are no more enemies")
