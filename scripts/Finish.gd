extends Area2D

var entered = false;

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body);
	
	if (body.name != "Player"):
		return;
	
	if (entered):
		return;
		
	entered = true;
	GameState.stop_timer();
	$Win.play();
	await $Win.finished
	get_tree().change_scene_to_file("res://scenes/final_menu.tscn");
