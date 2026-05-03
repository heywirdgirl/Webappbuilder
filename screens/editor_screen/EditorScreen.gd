# screens/editor_screen/EditorScreen.gd
extends Control

func _ready() -> void:
	_apply_theme()
	_test_data()

func _apply_theme() -> void:
	$MainLayout/TopBar.self_modulate          = UIConstants.COLOR_SURFACE
	$MainLayout/WorkArea/Canvas.self_modulate = UIConstants.COLOR_BG
	$MainLayout/BottomPalette.self_modulate   = UIConstants.COLOR_SURFACE

func _test_data() -> void:
	# Tạo 2 node thử
	var btn := ComponentNode.new(ComponentNode.Type.BUTTON, Vector2(50, 50))
	var card := ComponentNode.new(ComponentNode.Type.CARD, Vector2(50, 150), Vector2(200, 100))

	ProjectStore.add_component(btn)
	ProjectStore.add_component(card)

	# In ra verify
	var proj := ProjectStore.current_project
	print("Project: ", proj.name, " | id: ", proj.id)
	for c in proj.components:
		print("  Component: ", c.id, " | type: ", c.type, " | props: ", c.props)
