extends TextureRect
@onready var player = Global.get_grandparent(self,2).get_node("Player")
var message_printed = false
func _ready():
	player.controllable = false
	print_message("aafads igdskjhgdflksd;fsdflsdkfsdf
dsgfsdgsdgsgsd
sdgsdgsdgssssssss \n ssssssssssssssssssssssssssssssssssssssssssssssssss")

func close():
	if message_printed:
		player.controllable = true
		queue_free()
	else:
		message_printed = true
		
func print_message(text):
	for character in text:
		if message_printed:
			get_node("ConsoleText").text = text
			break
		get_node("ConsoleText").text += character
		await get_tree().process_frame
		await get_tree().process_frame
	message_printed = true
