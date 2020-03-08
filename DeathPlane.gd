extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies();
	for body in bodies:
		if body.name == "Player" and body.current_sprite == body.miner_sprite:
			SceneChanger.change_scene(get_tree().current_scene.filename, 0)
