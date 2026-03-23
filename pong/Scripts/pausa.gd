extends CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var esta_pausado = get_tree().paused
		
		get_tree().paused = not esta_pausado
		$MenuPausa.visible = not esta_pausado

func _on_boton_reanudar_pressed():
	get_tree().paused = false
	$MenuPausa.visible = false
