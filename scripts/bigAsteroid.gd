extends KinematicBody2D
var rng = RandomNumberGenerator.new()

var rotSpeed
var maxrot = 0.2
var velocity
var maxSpeed = 150
var minSpeed = -150
var numChildren = 2
var score = 3

export(PackedScene) var medAsteroid

func _ready():
	add_to_group("asteroid")
	rng.randomize()
	rotSpeed = rng.randf_range(0-maxrot, maxrot)
	velocity = Vector2(rng.randi_range(minSpeed,maxSpeed),rng.randi_range(minSpeed,maxSpeed))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation += rotSpeed
	var collision = move_and_collide(velocity*delta)
	if collision :
		if collision.collider.is_in_group("ship") :
			collision.collider.hurt()
			explode()
	

func explode() :
	GlobalData.score += score
	for i in range (0,numChildren) :
		var a = medAsteroid.instance()
		a.create(position)
		get_parent().add_child(a)
		
	queue_free()

func create(pos) :
	position = pos
