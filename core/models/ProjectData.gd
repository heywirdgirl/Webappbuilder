# core/models/ProjectData.gd
class_name ProjectData

var id         : String
var name       : String
var components : Array[ComponentNode]

func _init(p_name: String = "Untitled") -> void:
	id         = UUIDGen.v4()
	name       = p_name
	components = []

func add_component(node: ComponentNode) -> void:
	components.append(node)

func remove_component(node_id: String) -> void:
	components = components.filter(func(c): return c.id != node_id)

func find_component(node_id: String) -> ComponentNode:
	for c in components:
		if c.id == node_id:
			return c
	return null

func to_dict() -> Dictionary:
	var comps := []
	for c in components:
		comps.append(c.to_dict())
	return { "id": id, "name": name, "components": comps }

static func from_dict(d: Dictionary) -> ProjectData:
	var proj      := ProjectData.new(d["name"])
	proj.id       = d["id"]
	for cd in d.get("components", []):
		proj.components.append(ComponentNode.from_dict(cd))
	return proj
