extends Area2D

var fading = ""
func _ready():
	pass # Replace with function body.

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
