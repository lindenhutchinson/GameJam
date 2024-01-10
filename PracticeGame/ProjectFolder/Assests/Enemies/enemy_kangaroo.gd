extends CharacterBody2D

# This variable dictates the movement speed of the enemy. Right now it's ridiculously high on purpose.
@export var movement_speed = 180.0

# Checks the group Player and gets the first thing on it.
@onready var player = get_tree().get_first_node_in_group("player")

# Applies the 2D sprite into a variable
@onready var sprite = $Sprite2D

# Applies the walking animation into a variable
@onready var walkAnimation = $AnimationPlayer

func _physics_process(_delta):
	movement()

func _ready():
	# Makes the walking animation play forever
	walkAnimation.play("walkCycle")

func movement():
	
	# Gets the player's current position as a direction
	var direction = global_position.direction_to(player.global_position)
	
	# The enemy's velocity is calculated with where the player is, multiplied by the enemy's movement speed
	velocity = direction.normalized() * movement_speed
	move_and_slide()
	
	# Is the enemy moving towards the right?
	if direction.x > 0.1: # Yes it is
		sprite.flip_h = true
	elif direction.x < -0.1: # No it isn't
		sprite.flip_h = false
