extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	# will delete the current scene from the tree and replace it with game scene.
	get_tree().change_scene_to_file("res://MainScenes/2. GameScene/game_scene.tscn")


func _on_exit_pressed():
	get_tree().quit()
