extends Control

func _ready() -> void:
	print("EditorScreen ready")
	
	# Apply màu
	$MainLayout/TopBar.self_modulate         = UiConstants.COLOR_SURFACE
	$MainLayout/WorkArea/Canvas.self_modulate = UiConstants.COLOR_BG
	$MainLayout/BottomPalette.self_modulate  = UiConstants.COLOR_SURFACE
