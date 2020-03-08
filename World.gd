extends Node2D

onready var mine_cursor = $Cursors/MineCursor;
onready var cursor = $Cursors/Cursor;


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	print(get_tree().current_scene.get_path())
	pass
	
func _process(delta):
	cursor.position = get_global_mouse_position();
	mine_cursor.position = get_global_mouse_position();
	
	if globals.on_mining:
		cursor.visible = false;
		mine_cursor.visible = true;
	else:
		cursor.visible = true;
		mine_cursor.visible = false;
