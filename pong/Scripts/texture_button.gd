extends TextureButton

func _on_pressed():
	# get_tree().paused nos dice si el juego está frenado (true) o andando (false)
	var esta_pausado = get_tree().paused
	
	# Invertimos el valor: si era true pasa a false, y viceversa
	get_tree().paused = not esta_pausado
