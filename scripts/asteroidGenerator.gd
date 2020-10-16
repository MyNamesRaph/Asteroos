extends Node2D

var rng = RandomNumberGenerator.new()
export var level = 0
export(PackedScene) var asteroid
onready var ship = get_parent().get_node("Ship")

func _ready():
	rng.randomize()

func _process(delta):
	if get_child_count() == 0 :
		level = level+1
		gen()

func gen() :
	var shipX = ship.position.x
	var shipY = ship.position.y
	
	var amount = level;
	
	for i in range (0,amount) :
		var posOk = false
		var x
		var y
		while posOk == false :
			posOk = true
			var dzone = 15
			x = rng.randf_range(2.0,64.0)
			y = rng.randf_range(9.0,64.0)
			
			if (x + dzone > shipX && x - dzone < shipX) :
				if (y + dzone > shipY && y - 10 < shipY) :
					posOk = false
			if (y + 10 > shipY && x - 10 < shipY) :
				if (x + 10 > shipX && x - 10 < shipX) :
					posOk = false
		
		var a = asteroid.instance()
		a.create(Vector2(x,y))
		add_child(a)
	
	
	
	
