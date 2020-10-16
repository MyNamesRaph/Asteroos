extends Sprite

var timeout = 50
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i = i+1
	if i == timeout :
		i = 0
		visible = !visible

