# state/ProjectStore.gd
extends Node

signal project_changed(project: ProjectData)
signal component_added(node: ComponentNode)
signal component_removed(node_id: String)

var current_project : ProjectData

func _ready() -> void:
    new_project()

## Tạo project mới in-memory
func new_project(p_name: String = "Untitled") -> void:
    current_project = ProjectData.new(p_name)
    project_changed.emit(current_project)

## Thêm component node
func add_component(node: ComponentNode) -> void:
    current_project.add_component(node)
    component_added.emit(node)

## Xoá component node
func remove_component(node_id: String) -> void:
    current_project.remove_component(node_id)
    component_removed.emit(node_id)