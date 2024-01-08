extends CharacterBody2D

# This variable dictates the movement speed of the enemy. Right now it's ridiculously high on purpose.
@export var movement_speed = 180.0

# Checks the group Player and gets the first thing on it.
@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var walkAnimation = $AnimationPlayer

func _physics_process(_delta):
	movement()

func _ready():
	walkAnimation.play("walkCycle")

func movement():
	
	# Gets the player's current position as a direction
	var direction = global_position.direction_to(player.global_position)
	
	# Moves towards the player
	velocity = direction.normalized()*movement_speed
	move_and_slide()

	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false
