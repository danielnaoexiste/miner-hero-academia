extends CanvasLayer


onready var animation_player = $AnimationPlayer;
onready var black = $Control/CanvasModulate;

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout");
	animation_player.play("fade");
	yield(animation_player, "animation_finished")
#	yield(get_tree().create_timer(1.5), "timeout");
	globals.reset_globals();
	get_tree().change_scene(path)
	animation_player.play_backwards("fade")
