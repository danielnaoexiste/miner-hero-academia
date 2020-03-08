extends Area2D

var was_called = false
export (String, FILE, "*.tscn") var next_scene;

func _physics_process(delta):
	var bodies = get_overlapping_bodies();
	for body in bodies:
		if body.name == "Player" and !was_called:
			SceneChanger.change_scene(next_scene);
			was_called = true
