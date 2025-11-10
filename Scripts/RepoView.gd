extends Control
class_name RepoView

@onready var repo_path: Label = $VBoxContainer/RepoPath
@onready var commit_history: Tree = $VBoxContainer/HBoxContainer/Panel2/VBoxContainer/CommitHistory

var root

func set_repo_path(path: String):
	repo_path.text = path
	
	var repo_log := get_log()
	print(repo_log)
	
	commit_history.set_column_title(0, "Branch")
	commit_history.set_column_title(1, "Graph")
	commit_history.set_column_title(2, "Commit Message")
	
	root = commit_history.create_item()
	
	var commits = repo_log[0].split("\n\n")
	for commit in commits:
		var row := commit_history.create_item(root)
		row.set_text(0, commit)
		

func get_status() -> Array[String]:
	var output = GitService.execute_command(repo_path.text, "status", [])
	return output
	
func get_log() -> Array[String]:
	var output = GitService.execute_command(repo_path.text, "log", [])
	return output
