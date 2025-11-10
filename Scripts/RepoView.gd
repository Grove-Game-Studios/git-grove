extends Control
class_name RepoView

@onready var repo_path: Label = $VBoxContainer/RepoPath

func set_repo_path(path: String):
	repo_path.text = path
