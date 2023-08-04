extends CharacterBody2D

const SPEED = 150;
const JUMP_FORCE = 300;
const GRAVITY = 15;

var movement = Vector2.ZERO;
var is_walking_sound_playing = false;

func play_walking_sound(value: bool):
	if (value && !is_walking_sound_playing):
		is_walking_sound_playing = true;
		$WalkingSound.play();
		return;
	
	if (!value):
		is_walking_sound_playing = false;
		$WalkingSound.stop();

func handle_controls():
	var direction = 0;
	if (Input.is_action_pressed("move_left")):
		direction -= 1;
	
	if (Input.is_action_pressed("move_right")):
		direction += 1;
		
	if (direction == 0):
		movement.x = 0;
	else:
		movement.x = direction * SPEED;
		
	if (direction == 1):
		$Sprite.play("walk")
		$Sprite.flip_h = true
		play_walking_sound(true);
		
	if (direction == -1):
		$Sprite.play("walk")
		$Sprite.flip_h = false;
		play_walking_sound(true);
		
	if (direction == 0):
		$Sprite.play("stand");
		play_walking_sound(false);
		
	if (is_on_floor()):
		movement.y = 0;

	if (Input.is_action_just_pressed("jump") && is_on_floor()):
		$JumpSound.play();
		movement.y = -JUMP_FORCE;
	
func _ready():
	GameState.reset_timer();

func _physics_process(delta):
	handle_controls();
	movement.y += GRAVITY;
	velocity = movement;
	move_and_slide();
