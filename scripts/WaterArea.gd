extends Area2D

func _on_body_shape_entered(body_rid, body: CharacterBody2D, body_shape_index, local_shape_index):
	if (body.name != 'Player'):
		return;
		
	$WaterSplash.play();
