extends TileMap

class_name Floor

export(String, FILE, "*.tscn") var next_floor

var count_platform_complete := 0
var count_platform := 0
	
func _ready() -> void:
	for child in get_children():
		if child is GridBox:
			child.initialize(self)
		if child is Player:
			child.initialize(self)
		if child is RedPlatform:
			child.initialize(self)
			count_platform += 1
	print(count_platform)

func _on_RedPlatform_pressed():
	count_platform_complete += 1
	

	
func _on_RedPlatform_unpressed():
	count_platform_complete -= 1
	
func check_complete_level() -> bool:
	return count_platform_complete == count_platform

