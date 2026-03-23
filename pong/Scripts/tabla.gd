extends CharacterBody2D

@export var tecla_arriba: String = "ui_up"
@export var tecla_abajo: String = "ui_down"

var velocidad = 400.0

var posicion_x_fija: float

func _ready():
	posicion_x_fija = global_position.x

func _physics_process(delta):
	var velocidad_actual = Vector2.ZERO
	
	if Input.is_action_pressed(tecla_arriba):
		velocidad_actual.y = -velocidad
	elif Input.is_action_pressed(tecla_abajo):
		velocidad_actual.y = velocidad
		
	move_and_collide(velocidad_actual * delta)
	

	#esto es para arreglar el bug que si la pelota pega abajo de la paleta no se mueva la paleta
	global_position.x = posicion_x_fija
	rotation = 0
