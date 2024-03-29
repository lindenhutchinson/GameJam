extends Node2D


# Path to the kangaroo's node
const kangPath =  preload("res://Assests/Enemies/enemy_kangaroo.tscn")
# Applies the 2D sprite into a variable
@onready var sprite = $SpearSprite
@onready var collision = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_tree().get_first_node_in_group("player").position
	
	#Attempt at making the spear move
	var enemy = get_tree().get_first_node_in_group("enemy")
	var enemyDirection = global_position.direction_to(enemy.global_position)
	
	# Rotates the sprite of the spear towards the enemy when attacking
	sprite.look_at(enemy.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	var enemy = get_tree().get_nodes_in_group("enemy")
	if(enemy != null):
		body.queue_free()
		# Creats instance of the kangaroo's node from the path 
		var kang = kangPath.instantiate() 
		# Adds it to the parent node/Main
		get_tree().root.add_child.call_deferred(kang)
		queue_free()
		
