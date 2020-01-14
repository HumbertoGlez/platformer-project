extends KinematicBody2D

const SPEED = 60;
const GRAVITY = 10;
const JUMP_POWER = -250;
const FLOOR = Vector2(0, -1);

var velocity = Vector2();

onready var animator = get_node("AnimationPlayer");
onready var sprite = get_node("Sprite");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED;
		sprite.set_flip_h(false);
		if animator.get_current_animation() != "Run" and is_on_floor():
			animator.play("Run");
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED;
		sprite.set_flip_h(true);
		if animator.get_current_animation() != "Run" and is_on_floor():
			animator.play("Run");
	else:
		velocity.x = 0;
		if animator.get_current_animation() != "Idle" and is_on_floor():
			animator.play("Idle");
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_POWER;
		if animator.get_current_animation() != "Jump":
			animator.play("Jump");
	
	velocity.y += GRAVITY;
	
	velocity = move_and_slide(velocity, FLOOR);