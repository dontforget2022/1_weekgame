extends CanvasLayer
@onready var color_rect = $ColorRect
@onready var animation_player = $ColorRect/AnimationPlayer
func _ready():
	color_rect.visible = false
func load_scene(target_scene: String):
	color_rect.visible = true
	animation_player.play("trans")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target_scene)
	animation_player.play_backwards("trans")
func reload_scene():
	animation_player.play("trans")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("trans")
