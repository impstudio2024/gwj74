extends Area2D

var fading = "unfading"
var delta_x5 = 0
#ive tried to do something, that is not bound to process(), but all ways exccept this was buggy

func _ready():
	pass

func _process(delta):
	if delta_x5 < 5:
		delta_x5 += 1
	else:
		delta_x5 = 0
	if fading == "fading" and $Sprite.modulate[3] > 0 and delta_x5 == 5:
		$Sprite.modulate[3] -= 0.25
	if fading == "unfading" and $Sprite.modulate[3] < 1 and delta_x5 == 5:
		$Sprite.modulate[3] += 0.25

func _on_area_entered(area):
	if area.name == "PlayerTransparencyController":
		fading = "fading"


func _on_area_exited(area):
	if area.name == "PlayerTransparencyController":
		fading = "unfading"
