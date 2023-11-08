extends Node

var events:Dictionary = {}

func addListener(eventName, listener):
	if events.has(eventName):
		events[eventName].add(listener)
		#print("为`" + eventName + "`添加监听器")
	else:
		events[eventName] = [listener]
		#print("为`" + eventName + "`添加第一个监听器")
		
	return events[eventName]

func remove(eventName):
	#print("清空处理器:", eventName)
	events.erase(eventName)

func clear():
	#print("清空事件处理器")
	events.clear()
	
func emit(eventName):
	#print("触发事件：", eventName)
	var handlers:Array = events[eventName]
	for handler in handlers:
		handler.call()
