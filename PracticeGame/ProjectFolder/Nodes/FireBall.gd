extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_tree().get_first_node_in_group("player").position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	var enemy = get_tree().get_nodes_in_group("enemy")
	if(enemy != null):
		body.queue_free()
		queue_free()
