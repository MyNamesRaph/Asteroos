extends KinematicBody2D
var rng = RandomNumberGenerator.new()

var rotSpeed
var maxrot = 0.2
var velocity
var maxSpeed = 200
var minSpeed = -200
var numChildren = 2
var score = 2

export(PackedScene) var smallAsteroid

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
		var a = smallAsteroid.instance()
		a.create(position)
		get_parent().add_child(a)
		
	queue_free()

func create(pos) :
	if pos.x > 64 :
		pos.x = 64
		print("bruh moment")
	if pos.y > 64 :
		pos.y = 64
		print("bruh moment")
	if pos.x < 0 :
		pos.x = 0
		print("bruh moment")
	if pos.y < 7 :
		pos.y = 7
		print("bruh moment")
	position = pos

