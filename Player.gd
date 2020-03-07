extends KinematicBody2D


# Movement Variables
const UP = Vector2.UP;
const ACCELERATION = 15;
const MAX_SPEED = 80;
const JUMP_HEIGHT = -150;
const PUSH_SPEED = 45;

var motion = Vector2();
var GRAVITY = 5;
var glide = false;

onready var screen_size = get_viewport_rect().size
onready var miner_sprite = $MinerSprite; 
onready var hero_sprite = $HeroSprite; 
onready var current_sprite = miner_sprite;

func _physics_process(delta):
	# Gravity
	motion.y += GRAVITY;
	
	get_input();
	
	if current_sprite == hero_sprite:
		warp_screen();
	
	motion = move_and_slide(motion, UP);

func get_input():
	# Movement
	if (Input.is_action_pressed("move_right")):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED);
		current_sprite.flip_h = false;
	elif (Input.is_action_pressed("move_left")):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED);
		current_sprite.flip_h = true;
	
	# Jump and Glide
	if is_on_floor():
		if (Input.is_action_just_pressed("jump")):
			motion.y = JUMP_HEIGHT;
			if current_sprite == hero_sprite:
				glide = true;
	
	if glide and motion.y > 1:
		motion.y = 30;
	
	if (Input.is_action_just_released("jump")):
		glide = false; 
		
	if (Input.is_action_just_pressed("change_state")):
		if current_sprite == miner_sprite:
			change_sprite(hero_sprite);
		else:
			change_sprite(miner_sprite);

func warp_screen():
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func change_sprite(new_sprite):
	current_sprite = new_sprite;
	if new_sprite == miner_sprite:
		miner_sprite.visible = true;
		hero_sprite.visible = false;
	else:
		miner_sprite.visible = false;
		hero_sprite.visible = true;
		
