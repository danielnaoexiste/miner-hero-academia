extends StaticBody2D

var is_selected = false;
export (NodePath) var player_path;

func _ready():
	player_path = get_node(player_path)

func _on_Block_mouse_entered():
	print('a')
	if position.distance_to(player_path.position) < 128:
		print("sdasdasd")
		is_selected = true;

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and is_selected and globals.on_mining:
			print("sdasdasd")
			queue_free()
			is_selected = false;
			globals.on_mining = false;


func _on_Block_mouse_exited():
	if globals.on_mining:
		is_selected = false;
