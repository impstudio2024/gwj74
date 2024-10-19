extends TextureRect
@onready var player = Global.get_grandparent(self,2).get_node("Player")
var message_printed = false
var add_underscore = false
var message_is_printing = false
func _ready():
	player.controllable = false
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		close()
	if modulate[3] >= 1 and !message_is_printing:
		print_message("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
func close():
	if message_printed:
		player.controllable = true
		get_parent().black_screen()
		queue_free()
	else:
		message_printed = true
		
func print_message(text):
	message_is_printing = true
	for character in text:
		if message_printed:
			get_node("ConsoleText").text = text
			break
		get_node("ConsoleText").text += character
		if character != " ":
			await get_tree().process_frame
			await get_tree().process_frame
			await get_tree().process_frame
			await get_tree().process_frame
	message_printed = true



func _on_timer_timeout():
	if message_printed:
		if add_underscore:
			add_underscore = false
			get_node("ConsoleText").text[len(get_node("ConsoleText").text)-1] = ""
		else:
			add_underscore = true
			get_node("ConsoleText").text += "_"
