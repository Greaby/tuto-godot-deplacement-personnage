extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = 600
export (int) var gravity = 20

var velocity = Vector2()

func _physics_process(delta):
	velocity.x = (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * speed
	
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = -jump_speed
		
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))