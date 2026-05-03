# core/models/ComponentNode.gd
class_name ComponentNode

enum Type { BUTTON, CARD, CONTAINER }

var id       : String
var type     : Type
var props    : Dictionary
var children : Array[ComponentNode]
var position : Vector2
var size     : Vector2

func _init(
    p_type     : Type,
    p_position : Vector2 = Vector2.ZERO,
    p_size     : Vector2 = Vector2(120, 48)
) -> void:
    id       = UUIDGen.v4()
    type     = p_type
    props    = _default_props(p_type)
    children = []
    position = p_position
    size     = p_size

static func _default_props(t: Type) -> Dictionary:
    match t:
        Type.BUTTON:
            return {
                "label":   "Button",
                "variant": "default",   # default | outline | ghost
                "bgColor": "#6366f1",
                "textColor": "#ffffff"
            }
        Type.CARD:
            return {
                "title":       "Card Title",
                "description": "Description",
                "variant":     "default",
                "bgColor":     "#1a1a1a"
            }
        Type.CONTAINER:
            return {
                "direction": "column",  # row | column
                "gap":       "16",
                "padding":   "16",
                "align":     "start",
                "bgColor":   "#111111"
            }
    return {}

func to_dict() -> Dictionary:
    var children_arr := []
    for c in children:
        children_arr.append(c.to_dict())
    return {
        "id":       id,
        "type":     type,
        "props":    props.duplicate(),
        "children": children_arr,
        "position": { "x": position.x, "y": position.y },
        "size":     { "w": size.x, "h": size.y }
    }

static func from_dict(d: Dictionary) -> ComponentNode:
    var node        := ComponentNode.new(d["type"] as Type)
    node.id         = d["id"]
    node.props      = d["props"].duplicate()
    node.position   = Vector2(d["position"]["x"], d["position"]["y"])
    node.size       = Vector2(d["size"]["w"], d["size"]["h"])
    for child_dict in d.get("children", []):
        node.children.append(ComponentNode.from_dict(child_dict))
    return node