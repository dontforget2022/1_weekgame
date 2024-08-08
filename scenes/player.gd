extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 2
	if Input.is_action_pressed("up"):
		position += Vector2(0,-speed);
	if Input.is_action_pressed("down"):
		position += Vector2(0, speed);
	if Input.is_action_pressed("left"):
		position += Vector2(-speed, 0);
	if Input.is_action_pressed("right"):
		position += Vector2(speed, 0);
