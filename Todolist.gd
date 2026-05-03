
Display > Window > Size > Viewport Width; 390
Display > Window > Size > Viewport Height; 844
Display > Window > Stretch > Mode; canvas_items
Display > Window > Stretch > Aspect; expand

EditorScreen

Tạo scene: `screens/editor_screen/EditorScreen.tscn`
Node tree:
EditorScreen
MainLayout
TopBar
HBoxContainer
Label
HBoxContainer
WorkArea
Canvas
BottomPalette
HBoxContainer
```
EditorScreen (Control)
└── MainLayout (VBoxContainer)
	├── TopBar (PanelContainer)       ← fixed height
	│   └── HBoxContainer
	│       ├── Label "NextGen"
	│       └── HBoxContainer (spacer + buttons sau)
	├── WorkArea (HBoxContainer)      ← expand fill
	│   └── Canvas (Panel)            ← expand fill
	└── BottomPalette (PanelContainer) ← fixed height
		└── HBoxContainer (palette items sau)
```

**Anchor/Size rules:**

- `MainLayout`: Anchors = Full Rect
- `TopBar`: Custom minimum size Y = **52**
- `BottomPalette`: Custom minimum size Y = **100**
- `WorkArea`: Size Flags Vertical = **Expand + Fill**
- `Canvas`: Size Flags Horizontal = **Expand + Fill**

---

## 5. EditorScreen.gd
EditorScreen
```gdscript
# screens/editor_screen/EditorScreen.gd
extends Control

func _ready() -> void:
	print("EditorScreen ready")
```

Attach vào `EditorScreen` node.

---

## 6. Base Theme (UIConstants.gd)
UIConstants
```gdscript
# core/constants/UIConstants.gd
extends Node

const COLOR_BG         := Color("#0f0f0f")
const COLOR_SURFACE    := Color("#1a1a1a")
const COLOR_BORDER     := Color("#2a2a2a")
const COLOR_ACCENT     := Color("#6366f1")  # indigo
const COLOR_TEXT       := Color("#f4f4f5")
const COLOR_TEXT_MUTED := Color("#71717a")

const SPACING_SM := 8
const SPACING_MD := 16
const SPACING_LG := 24

const FONT_SIZE_SM := 12
const FONT_SIZE_MD := 14
const FONT_SIZE_LG := 16
```

Autoload: `Project Settings > Autoload` → add `UIConstants.gd` as **UIConstants**.

---

## 7. Apply màu nhanh vào scene

Trong `EditorScreen.gd`:

```gdscript
func _ready() -> void:
	$MainLayout/TopBar.self_modulate         = UIConstants.COLOR_SURFACE
	$MainLayout/WorkArea/Canvas.self_modulate = UIConstants.COLOR_BG
	$MainLayout/BottomPalette.self_modulate  = UIConstants.COLOR_SURFACE
```

---

## 8. main.tscn

main

Tạo `main.tscn` ở root, node là `Node`, attach script:

```gdscript
# main.gd
extends Node

func _ready() -> void:
	get_tree().change_scene_to_file(
        "res://screens/editor_screen/EditorScreen.tscn"
	)
```

Set `main.tscn` làm **Main Scene** trong Project Settings.

---

## Deliverable check ✅

Chạy app → thấy:
- TopBar tối phía trên
- Canvas vùng giữa chiếm toàn bộ
- BottomPalette tối phía dưới
- Không crash, scale đúng trên màn hình mobile

---

**Nếu xong sớm:** thêm `Label` vào TopBar hiện tên project placeholder `"Untitled"`. Không làm gì thêm ngoài danh sách trên.
