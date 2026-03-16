extends CharacterBody2D

const SPEED = 400.0

# Exportamos las variables para poder elegir las teclas de cada jugador desde el Inspector
@export var tecla_arriba: String = "ui_up"
@export var tecla_abajo: String = "ui_down"

func _physics_process(delta):
	var direction = Input.get_axis(tecla_arriba, tecla_abajo)
	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
