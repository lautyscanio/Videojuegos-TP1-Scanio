extends CharacterBody2D

@export var tecla_arriba: String = "ui_up"
@export var tecla_abajo: String = "ui_down"

var speed = 400.0
# Creamos una variable para guardar dónde tiene que estar anclada
var posicion_x_fija: float

func _ready():
	# Apenas arranca el juego, guardamos su posición horizontal original
	posicion_x_fija = global_position.x

func _physics_process(delta):
	var current_velocity = Vector2.ZERO
	
	if Input.is_action_pressed(tecla_arriba):
		current_velocity.y = -speed
	elif Input.is_action_pressed(tecla_abajo):
		current_velocity.y = speed
		
	move_and_collide(current_velocity * delta)
	
	# --- LA MAGIA PARA ARREGLAR EL BUG ---
	# Forzamos a la paleta a volver a su coordenada X original y a no girar, 
	# sin importar cuánto la empuje la pelota.
	global_position.x = posicion_x_fija
	rotation = 0
