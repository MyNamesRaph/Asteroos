extends Node

export(PackedScene) var title
export(PackedScene) var game
var t
var g

func _ready():
	t = title.instance()
	g = game.instance()
	add_child(t)
	
func _process(delta):
	var start = Input.is_action_just_pressed("start")
	
	if start :
		remove_child(t)
		add_child(g)
		
		
func resetGame() :
	remove_child(g)
	g.queue_free()
	g = game.instance()
	add_child(t)
