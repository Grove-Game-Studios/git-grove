extends Control
class_name RepoView

@onready var repo_path: Label = $VBoxContainer/RepoPath
@onready var list_of_commits: VBoxContainer = $VBoxContainer/HBoxContainer/Panel2/VBoxContainer/ScrollContainer/ListOfCommits

func set_repo_path(path: String):
	repo_path.text = path
	
	var repo_log = get_log()
	print(repo_log)
	for commit in repo_log:
		var new_label = Label.new()
		new_label.text = commit
		list_of_commits.add_child(new_label)

func get_status() -> Array[String]:
	var output = GitService.execute_command(repo_path.text, "status", [])
	return output
	
func get_log() -> Array[String]:
	var output = GitService.execute_command(repo_path.text, "log", [])
	return output
