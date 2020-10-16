extends Sprite

var numbers = [0,0,0,0,0]
onready var tiles = $TileMap

func _ready():
	GlobalData.score = 0
	
func _process(delta):
	get_score()
	var i = 0
	for num in numbers :
		tiles.set_cell(i,0,0,false,false,false,Vector2(num,0))
		i = i+1

func get_score():
	var score = GlobalData.score
	
	if score < 99999 :
		score = str(score)
		var zeros = 5-score.length()
		for i in range (0,zeros) :
			score = "0" + score
	else :
		score = "99999"
	
	var i = 0
	for num in score :
		numbers[i] = num
		i = i+1
