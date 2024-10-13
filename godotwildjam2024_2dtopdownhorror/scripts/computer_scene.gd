extends TextureRect
@onready var player = Global.get_grandparent(self,2).get_node("Player")

func _ready():
	player.controllable = false

func close():
	player.controllable = true
