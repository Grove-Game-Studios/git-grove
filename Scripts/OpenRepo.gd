extends Control

@onready var path: LineEdit = $VBoxContainer/HBoxContainer/Path
@onready var file_dialog: FileDialog = $VBoxContainer/HBoxContainer/FileDialog
@onready var message: Label = $VBoxContainer/Message

func _ready() -> void:
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR

func _on_browse_button_button_down() -> void:
	file_dialog.popup_centered_ratio(0.8)


func _on_file_dialog_dir_selected(dir: String) -> void:
	path.text = dir


func _on_open_button_button_down() -> void:
	if (is_git_repo(path.text)):
		message.text = "It is a git repo"
	else:
		message.text = "It is not a git repo"
	

func is_git_repo(dir_path: String) -> bool:
	var git_dir := dir_path.path_join(".git")
	return DirAccess.dir_exists_absolute(git_dir)
