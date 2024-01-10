extends CharacterBody2D

# This variable defines the speed of the player
const SPEED = 300.0

# This variable loads the spear to perform an attack
const spearPath = preload("res://Nodes/spear.tscn")

# This variable iniciates the timer for the Spear attack
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
	# This timer is used to time the spear attack. When the timer finishes, it performs the function "_on_timer_timeout()"
	timer.connect("timeout", self._on_timer_timeout)
	timer.start()


func _on_timer_timeout():
	# "The timer finished, execute the function to throw a spear"
	throwSpear()


func throwSpear():
	var enemy = get_tree().get_first_node_in_group("enemy")
	# Are there enemies alive?
	if enemy != null: # Yes there are
		# Instantiate a spear
		var spear = spearPath.instantiate() as RigidBody2D
		# Get the nearest enemy direction
		var enemyDirection = global_position.direction_to(enemy.global_position)
		# Movement speed of the spear
		var spearSpeed = 500.0
		# The linear velocity is the current location of the nearest enemy multiplied by the assigned speed of the spear
		spear.linear_velocity = enemyDirection.normalized()*spearSpeed
		# Adds the spear as a child of the player in a way where it doesn't crash.
		get_parent().add_child.call_deferred(spear)
	else: # This 'else' should be removed eventually. it's just to make sure the game recognises there are no enemies left.
		print("This is a debug message, there are no more enemies")
		


	
