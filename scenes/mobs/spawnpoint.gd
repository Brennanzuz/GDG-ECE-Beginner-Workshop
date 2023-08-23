extends Marker2D

@export var Mob : PackedScene

func _on_spawntime_timeout():
	spawn()

func spawn():
	var mob = Mob.instantiate()
	get_parent().add_child(mob)
	mob.global_position = global_position
