extends Area2D
var speed: int
var rotation_speed: int
var direction_x: float
var ran_meteor: int 
var size: int
signal collision

func _ready():
	#sprite
	# random number
	#RandomNumberGenerator provides methods for generating pseudo-random numbers
	var rng := RandomNumberGenerator.new()
	ran_meteor = rng.randi_range(1,3)
	
	#path to our sprites
	var path: String = "res://sprites/meteors/spr_meteor_" + str(ran_meteor) + ".png"
	$spr_meteor.texture = load(path)
	
		

	#getting room's width and height
	var width = 320
	var height = 240
	#generating random number
	var random_x = rng.randi_range(0,width)
	#not using full value because it will look weird
	var random_y = rng.randi_range(0,10)
	#assigning position
	position = Vector2(random_x,random_y);
	#speed/direction
	speed = rng.randi_range(50, 150)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40, 50)
	
func _process(delta):
	#basic movement
	position += Vector2(direction_x, 1.0) * speed * delta 
	#rotation
	rotation_degrees += rotation_speed * delta
	
func _on_body_entered(body):
	collision.emit()
