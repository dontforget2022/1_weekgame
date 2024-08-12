extends CharacterBody2D

@export var speed = 200
var can_shoot: bool = true

signal laser(pos)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var	direction = Input.get_vector("left", "right","up","down");#getting directions

	velocity = direction*speed;
	if Input.is_action_just_pressed("shoot") and can_shoot: 
		laser.emit($laser_start_pos.global_position)
		can_shoot = false;
		$can_shoot.start()
	move_and_slide() 
	





func _on_can_shoot_timeout():
	can_shoot = true
