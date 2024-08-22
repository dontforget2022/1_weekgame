extends CharacterBody2D

@export var speed = 200
var can_shoot: bool = true
var inv_frames: bool = false
signal laser(pos)
var main_sm: LimboHSM
# Called when the node enters the scene tree for the first time.
func _ready():
	initiate_state_machine()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		




func _on_can_shoot_timeout():
	can_shoot = true

func initiate_state_machine():
	main_sm = LimboHSM.new()
	add_child(main_sm)
	var idle_state = LimboState.new().named("idle").call_on_enter(idle_start).call_on_update(idle_update)
	var move_state = LimboState.new().named("move").call_on_enter(move_start).call_on_update(move_update)
	main_sm.add_transition(main_sm.ANYSTATE, idle_state, &"state_ended")
	main_sm.add_child(idle_state)
	main_sm.add_child(move_state)
	main_sm.initial_state = move_state
	main_sm.initialize(self)
	main_sm.set_active(true)
func idle_start():
	pass
func idle_update(delta: float):
	print("idle")
func move_start():
	pass
func move_update(delta: float):
	main_sm.dispatch(&"state_ended")
	var	direction = Input.get_vector("left", "right","up","down");#getting directions
	
	velocity = direction*speed;
	if Input.is_action_just_pressed("shoot") and can_shoot: 
		
		laser.emit($laser_start_pos.global_position)
		can_shoot = false;
		$can_shoot.start()
	move_and_slide() 
	if inv_frames:
		$spr_player.play("default")

	





func _on_inv_frames_timer_timeout():
	$spr_player.stop()
	inv_frames = false
