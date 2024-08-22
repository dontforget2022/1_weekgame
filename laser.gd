extends Area2D
var particles_scene: PackedScene = load("res://particles.tscn")
@export var speed = 500
signal music
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed*delta

func _on_area_entered(area):
	GlobalData.score += 10
	music.emit()
	area.queue_free()
	queue_free()
	
