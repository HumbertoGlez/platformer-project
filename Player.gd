extends KinematicBody2D

const SPEED = 60;
const GRAVITY = 10;
const JUMP_POWER = -250;
const FLOOR = Vector2(0, -1);

var velocity = Vector2();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED;
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED;
	else:
		velocity.x = 0;
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_POWER;
	
	velocity.y += GRAVITY;
	
	velocity = move_and_slide(velocity, FLOOR);