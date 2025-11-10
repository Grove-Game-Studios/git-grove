extends Control

@onready var open_repo: OpenRepo = $OpenRepo
@onready var repo_view: RepoView = $RepoView

func _on_open_repo_open_repo(path: String) -> void:
	print("here")
	repo_view.set_repo_path(path)
	
	open_repo.hide()
	repo_view.show()
