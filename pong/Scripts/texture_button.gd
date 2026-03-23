extends TextureButton

func _on_pressed():
	var esta_pausado = get_tree().paused
	
	# invertimos el valor: si era true pasa a false, y viceversa
	get_tree().paused = not esta_pausado
 
