extends CharacterBody2D

var speed = 400.0

func reiniciar():
	#deja la pelots en el centro
	global_position = get_viewport_rect().size / 2.0
	
	speed = 400.0 
	
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1

	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
		
	velocity = velocity * speed

func _ready():
	reiniciar()

func _physics_process(delta):
	var colision = move_and_collide(velocity * delta)
	
	if colision:
		velocity = velocity.bounce(colision.get_normal())
		
		speed += 20.0
		velocity = velocity.normalized() * speed
