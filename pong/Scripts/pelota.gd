extends CharacterBody2D

# Velocidad a la que se mueve la pelota
var speed: float = 400.0
# Dirección inicial (Vector2(1, 1) significa diagonal hacia abajo y a la derecha)
var direction: Vector2 = Vector2(1, 1).normalized()

func _physics_process(delta):
	# move_and_collide mueve la pelota y guarda la información si detecta un choque
	#se multiplica por delta para que la velocidad sea igual en todas las computadoras
	var colision = move_and_collide(direction * speed * delta)
	
	# Si la variable tiene información (es decir, chocamos con el Techo, Suelo o Tabla)...
	if colision:
		# Calculamos el rebote perfecto usando la física matemática (bounce)
		# 'get_normal()' detecta desde qué ángulo golpeó la superficie
		direction = direction.bounce(colision.get_normal())
		
		# (Opcional) Aumentamos un poquito la velocidad con cada rebote para subir la dificultad
		speed += 20.0
		

func reiniciar():
	# 1. Calculamos el centro exacto sin importar el tamaño de tu pantalla.
	# get_viewport_rect().size obtiene el ancho y alto total, y lo dividimos a la mitad (/ 2.0)
	global_position = get_viewport_rect().size / 2.0
	
	# 2. Creamos una lista con las opciones: 1 (positivo) y -1 (negativo)
	var opciones = [1, -1]
	
	# 3. Godot elige al azar para X y para Y
	var direccion_x_al_azar = opciones.pick_random()
	var direccion_y_al_azar = opciones.pick_random()
	
	# 4. Aplicamos la nueva dirección y la velocidad original
	direction = Vector2(direccion_x_al_azar, direccion_y_al_azar).normalized()
	speed = 400.0
