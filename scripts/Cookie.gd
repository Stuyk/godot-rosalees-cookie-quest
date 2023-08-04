extends Area2D

var is_grabbed = false;

func _physics_process(delta):
	if (is_grabbed):
		if (visible):
			visible = false;
		return;
	
	rotation_degrees = lerpf(rotation_degrees, 360, 0.02);
	
	if (rotation_degrees >= 350):
		rotation_degrees = 0;

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (is_grabbed):
		return;
		
	is_grabbed = true;
	visible = false;
	GameState.add_cookie();
	$Cookie.play();
	await $Cookie.finished;
	queue_free();
