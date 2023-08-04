extends Node

var cookies: int = 0;
var timer: int = 0;
var is_timer_running = false;
var start_time: int = Time.get_ticks_msec();
var final_time: int;

func add_cookie():
	cookies += 1;

func reset_timer():
	is_timer_running = true;
	start_time = Time.get_ticks_msec();
	timer = 0;
	cookies = 0;
	
func stop_timer():
	is_timer_running = false;
	final_time = timer;

func _physics_process(delta):
	if (is_timer_running):
		timer = Time.get_ticks_msec() - start_time;

