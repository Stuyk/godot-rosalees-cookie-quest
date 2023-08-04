extends Control


func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func pad_number(num: int):
	if (num <= 9):
		return str("0") + str(num);
		
	return str(num);

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn");

func _ready():
	if ($FinalTime):
		var minutes = floor(GameState.final_time / 60000);
		var seconds = round_to_dec(floor((GameState.final_time % 60000) / 1000), 0);
		$FinalTime.text = str("Final Time: ") + str(pad_number(minutes)) + ":" + str(pad_number(seconds));
