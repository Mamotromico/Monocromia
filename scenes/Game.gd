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
	
#	var jsonTest = {}
#	jsonTest["Hi"] = "Hello, how are you"
#	jsonTest["Bye"] = {}
#	jsonTest["Bye"]["Huh"] = "Cya"
#	jsonTest["Test"] = ",,,,,,"
#	print(jsonTest.to_json())
#	print(pretty_json(jsonTest.to_json()))
	
	pass
	
	
func finished():
#	print("cabou")
	pass

func dialog_control(info):
	pass
	
func pretty_json(string):
	
	print ("RAW STR : "+string.c_escape())
	
	var ex1 = RegEx.new()
	var stt1 = 0
	ex1.compile("(\\{)|(\\()|(\\[)",-1)
	while ex1.find(string, stt1) >= 0 :
		string = string.insert(ex1.find(string, stt1)+1,'\n')
		string = string.insert(ex1.find(string, stt1),'\n')
		stt1 = ex1.find(string, stt1)+1
		
	print ("AFTER EX1 : "+string.c_escape())
	
	var ex2 = RegEx.new()
	var stt2 = 0
	ex2.compile("(\\})|(\\))|(\\])",-1)
	while ex2.find(string, stt2) >= 0 :
		string = string.insert(ex2.find(string, stt2),'\n')
		stt2 = ex2.find(string, stt2)+1
	
	print ("AFTER EX2 : "+string.c_escape())
	
	var ex3 = RegEx.new()
	var stt3 = 0
	var compileResult = ex3.compile("(?!Bye)",-1)
	print ("REGEX COMPILED")
	while ex3.find(string, stt3) >= 0 :
		print("Achou String")
		string = string.insert(ex3.find(string, stt3)+1,'\n')
		print("inseriu n")
		stt3 = ex3.find(string, stt3)+1
		
	print ("AFTER EX3 : "+string.c_escape())
	
	var tokens = string.split('\n',false)
	print ("AFTER SPLIT : "+str(tokens).c_escape())
	var offsets = []
	var index=0
	for token in tokens:
		var tabs = ""
		if token.match('{') == true :
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			index += 1
			print("CURRENT INDEX: "+str(index))
		elif token.match('(') == true :
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			index += 1
			print("CURRENT INDEX: "+str(index))
		elif token.match('[') == true :
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			index += 1
			print("CURRENT INDEX: "+str(index))
		elif token.match('},') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			print("CURRENT INDEX: "+str(index))
		elif token.match('}') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			print("CURRENT INDEX: "+str(index))
		elif token.match('),') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			print("CURRENT INDEX: "+str(index))
		elif token.match(')') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			print("CURRENT INDEX: "+str(index))
		elif token.match('],') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
			print("CURRENT INDEX: "+str(index))
			print("CURRENT INDEX: "+str(index))
		elif token.match(']') == true :
			index -= 1
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
		else :
			for mult in range(0,index):
				tabs+="\t"
			offsets.append(tabs+token)
	print ("AFTER TOKENS : "+str(offsets).c_escape())
	var prettyJson = ""
	for line in offsets:
		prettyJson+=line+"\n"
	print ("AFTER JOIN : "+prettyJson.c_escape())
	return prettyJson