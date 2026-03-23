extends Node2D

var puntos_j1 = 0
var puntos_j2 = 0

func _ready():
	$fraseGanadora.text = ""

func _on_arco_izquierdo_body_entered(body):
	if body.name == "Pelota":
		puntos_j2 += 1
		$Puntaje2.text = str(puntos_j2)
		chequear_ganador(2)
		body.reiniciar()

func _on_arco_derecho_body_entered(body):
	if body.name == "Pelota":
		puntos_j1 += 1
		$Puntaje1.text = str(puntos_j1)
		chequear_ganador(1)
		body.reiniciar()

func chequear_ganador(jugador):
	if puntos_j1 >= 5 or puntos_j2 >= 5:
		$fraseGanadora.text = "Juego terminado, gano el jugador " + str(jugador)
		get_tree().paused = true
