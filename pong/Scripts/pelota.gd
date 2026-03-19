extends CharacterBody2D

var speed = 400.0
# Dejamos la dirección en cero, la vamos a elegir al azar al arrancar
var direction = Vector2.ZERO 

func _ready():
	# Esta función especial de Godot se ejecuta una sola vez apenas arranca el juego.
	# Acá le decimos que acomode la pelota y la tire al azar.
	reiniciar()

func _physics_process(delta):
	var colision = move_and_collide(direction * speed * delta)
	
	if colision:
		direction = direction.bounce(colision.get_normal())
		speed += 20.0

func reiniciar():
	# 1. La ponemos en el centro exacto de la pantalla
	global_position = get_viewport_rect().size / 2.0
	
	# 2. Reseteamos la velocidad por si venía rápida de un punto anterior
	speed = 400.0
	
	# 3. Elegimos X e Y al azar (1 es derecha/abajo, -1 es izquierda/arriba)
	var opciones = [1, -1]
	direction.x = opciones.pick_random()
	direction.y = opciones.pick_random()
	
	# 4. Normalizamos para que la velocidad en diagonal sea perfecta
	direction = direction.normalized()
