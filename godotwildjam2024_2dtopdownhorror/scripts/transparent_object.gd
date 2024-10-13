extends Area2D

var fading = "unfading"

#ive tried to do something, that is not bound to process(), but all ways exccept this was buggy

func _ready():
	pass

func _process(delta):
	if fading == "fading" and $Sprite.modulate[3] > 0:
		$Sprite.modulate[3] -= 0.05
	if fading == "unfading" and $Sprite.modulate[3] < 1:
		$Sprite.modulate[3] += 0.05

func _on_area_entered(area):
	if area.name == "PlayerTransparencyController":
		fading = "fading"


func _on_area_exited(area):
	if area.name == "PlayerTransparencyController":
		fading = "unfading"
