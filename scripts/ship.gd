extends KinematicBody2D

var speed = 200
var rotSpeed = 0.1
var slowdownSpeed = 1
var velocity = Vector2()
export(PackedScene) var bullet
onready var bulletOut = $bulletOut
var lives = 3
var iframes = 1 #seconds
var invincible = false
var timer = Timer.new()

func _ready():
	add_to_group("ship")

func _physics_process(delta):
	var x = velocity.x
	var y = velocity.y
	if x > 0 :
		if slowdownSpeed < x :
			velocity.x -= slowdownSpeed
		else :
			velocity.x = 0
	if x < 0 :
		if slowdownSpeed < abs(x) :
			velocity.x += slowdownSpeed
			
	if y > 0 :
		if slowdownSpeed < y :
			velocity.y -= slowdownSpeed
		else :
			velocity.y = 0
	if y < 0 :
		if slowdownSpeed < abs(y) :
			velocity.y += slowdownSpeed

	get_input()
	
	var collision = move_and_collide(velocity*delta)


func get_input():
	var forward = Input.is_action_pressed("move")
	var shoot = Input.is_action_just_pressed("shoot")
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	
	if forward :
		velocity = Vector2(speed, 0).rotated(rotation)
	if shoot :
		var b = bullet.instance()
		b.create(bulletOut.global_position /10, rotation)
		get_parent().add_child(b)
		print("shot a bullet at " + str(bulletOut.global_position.x) + ", " + str(bulletOut.global_position.y))
	if right :
		rotation -= rotSpeed
	if left :
		rotation += rotSpeed

func hurt() :
	if !invincible :
		
		if lives == 0 :
			queue_free()
			get_parent().get_node("gameover").show()
			get_parent().get_node("gameover").isGameOver = true
		else :
			get_parent().get_node("GUI").removeLife()
			lives = lives-1
			resetPos()

func resetPos() :
	startIframes()
	position.x = 32
	position.y = 32
	
func startIframes() :
	add_child(timer)
	timer.set_wait_time(iframes)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()
	invincible = true
	modulate.a = 0.5
	$collider.set_disabled(true)
	velocity = Vector2()

	
func _on_Timer_timeout() :
	remove_child(timer)
	invincible = false
	modulate.a = 1
	$collider.set_disabled(false)
	

