extends Button


func _pressed() -> void:
	$"../..".visible = false
	$"../../../title".visible = false
	
	$"../../../difculty-menu".visible = true
	$"../../../difficulty-title".visible = true
