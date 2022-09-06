extends Node2D

signal attack
signal idle
# mobs that are within the tower's range of detection
# are stored in this array
var targets_within_range = []

signal shoot_projectile

func _on_detection_area_area_entered(area):
	if "mob" in area.name:
		targets_within_range.append(area)
		_on_tower_attack()
	elif "mob" in area.name and targets_within_range.size() <= 0:
		_on_tower_idle()

func _on_detection_area_area_exited(area):
	if "mob" in area.name and targets_within_range.size() > 0:
		targets_within_range.erase(area)
		_on_tower_idle()
	elif targets_within_range.size() <= 0:
		_on_tower_idle()

func _on_attack_speed_timeout():
	if targets_within_range.size() > 0:
		var projectile_origin_pos = position  # middle of the tower
		emit_signal("shoot_projectile", projectile_origin_pos, targets_within_range[0].position)
		_on_tower_attack()

func _on_tower_attack():
	$AnimatedSprite.animation = "attack"

func _on_tower_idle():
	$AnimatedSprite.animation = "idle"
