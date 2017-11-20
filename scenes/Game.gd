extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var dialog = get_node("dialog")
var current_info

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	dialog.connect("dialog_control",self,"dialog_control")
	dialog.connect("finished",self,"finished")
	dialog.show_text("Dia1","Intro")
	
	pass
	
	
func finished():
#	print("cabou")
	pass

func dialog_control(info):
#	print(dialog.language.Dia1.Intro_1)
#	print("passo")
#	print(info)
	if (info.dialog == "Intro"):
		if(info.answer == 0):
			dialog.stop()
			yield(get_tree(), "idle_frame")
			dialog.show_text("Day1","Intro_1")
#			print(current_info)
		if(info.answer == 1):
			dialog.stop()
			yield(get_tree(), "idle_frame")
			dialog.show_text("Day1","Intro_2")
#			print(current_info)
#	elif (info.dialog == "Intro-1"):
#		if(info.answer == 0):
#			dialog.stop()
#			yield(get_tree(), "idle_frame")
#			dialog.show_text("Day1","Intro-1")
#			print(current_info)
#		if(info.answer == 1):
#			dialog.stop()
#			yield(get_tree(), "idle_frame")
#			dialog.show_text("Day1","Intro-2")
#			print(current_info)