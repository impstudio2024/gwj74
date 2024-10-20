extends TextureRect
@onready var player = Global.get_grandparent(self,2).get_node("Player")
var message_printed = false
var add_underscore = false
var message_is_printing = false
var text = "Another day passed away..."
func _ready():
	if !Global.pump_completed:
		text += "\n\n Pump in heating building is not working. I should repair it"
	if !Global.batteries_completed:
		text += "\n\n Batteries next to antenn must be sorted"
	if !Global.balance_completed:
		text += "\n\n Valve in the storage is broken again. I must open it as soon as possible"
	player.controllable = false
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		close()
	
	if modulate[3] >= 1 and !message_is_printing:
		print_message(text)
	
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
