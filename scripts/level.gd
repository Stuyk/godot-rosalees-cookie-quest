extends Node2D

var did_remove = false;

func check_to_unblock():
	if (did_remove):
		return;
	
	if ($Cookies.get_child_count() >= 1):
		return;
		
	did_remove = true;
	$Blocker/CollectMore.queue_free()
	$Blocker/Area2D.queue_free();

func _physics_process(delta):
	check_to_unblock();
