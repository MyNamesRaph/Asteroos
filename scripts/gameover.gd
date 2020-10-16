extends Sprite


var isGameOver = false

func _process(delta):
	if isGameOver :
		var start = Input.is_action_just_pressed("start")
	
		if start :
			get_parent().get_parent().resetGame()
