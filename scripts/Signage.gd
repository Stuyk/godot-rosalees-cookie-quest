extends Area2D

@export var text: String;

func _ready():
	$Label.text = text;
	$Label.visible = false;

func toggleSign(value: bool):
	$Label.visible = value;
	
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.name != 'Player'):
		return;

	toggleSign(true);


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.name != 'Player'):
		return;
		
	toggleSign(false);
