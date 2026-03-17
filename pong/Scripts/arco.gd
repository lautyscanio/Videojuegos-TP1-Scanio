extends Area2D

# Esta es la función que Godot creó y conectó automáticamente	

func _on_arco_body_entered(body: Node2D) -> void:
	if body.name == "Pelota":
		
		# Le suma el punto al jugador correspondiente (asegúrate de que diga 1 o 2 según la portería)
		get_parent().anotar_punto(2) 
		
		# Le damos la orden a la pelota para que ejecute su nueva función
		body.reiniciar()

func _on_arco_derecho_body_entered(body: Node2D) -> void:
	if body.name == "Pelota":
		
		# Le suma el punto al jugador correspondiente (asegúrate de que diga 1 o 2 según la portería)
		get_parent().anotar_punto(1) 
		
		# Le damos la orden a la pelota para que ejecute su nueva función
		body.reiniciar()
