extends Node2D # (o el tipo de nodo que sea tu Cancha)

# Variables para llevar la cuenta
var puntos_j1: int = 0
var puntos_j2: int = 0

# Esta función será llamada por las porterías cuando la pelota entre
func anotar_punto(jugador: int):
	if jugador == 1:
		puntos_j1 += 1
		# Actualizamos el texto en la pantalla. Usamos $ para referirnos al nodo hijo.
		$Puntaje1.text = str(puntos_j1) 
	elif jugador == 2:
		puntos_j2 += 1
		$Puntaje2.text = str(puntos_j2)

	# Verificamos si alguien llegó a 5
	if puntos_j1 >= 5 or puntos_j2 >= 5:
		$fraseGanadora.text=str("Juego terminado, gano el jugador ", jugador)
		print("¡Juego Terminado! Ganó el jugador ", jugador)
		# Pausa todo el juego para que la pelota y los jugadores no se muevan más
		get_tree().paused = true 
