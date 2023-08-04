extends CanvasLayer

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func pad_number(num: int):
	if (num <= 9):
		return str("0") + str(num);
		
	return str(num);

func update_timer():
	var minutes = floor(GameState.timer / 60000);
	var seconds = round_to_dec(floor((GameState.timer % 60000) / 1000), 0);
	$Timer.text = str(pad_number(minutes)) + ":" + str(pad_number(seconds));

func update_cookies():
	$CookieCounter.text = str("Cookies ") + str(GameState.cookies)

func _physics_process(delta):
	update_timer();
	update_cookies();
