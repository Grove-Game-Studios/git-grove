extends Node

func _ready() -> void:
	print("GitService running")

func execute_command(path: String, command: String, flags: Array[String]) -> Array[String]:
	var args = []

	args.append("-C")
	args.append(path)
	args.append(command)
	
	for flag in flags:
		args.append(flag)
		
	var output: Array[String] = []
	
	OS.execute("git", args, output)
	
	return output
