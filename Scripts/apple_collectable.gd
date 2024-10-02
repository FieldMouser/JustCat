extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fall_from_tree()
	
func fall_from_tree():
	$AnimationPlayer.play("falling_from_tree") # запускается анимация падения
	await get_tree().create_timer(1.5).timeout # создается таймер на полторы секунды
	$AnimationPlayer.play("fade") # запускается анимация исчезновения
	await get_tree().create_timer(0.3).timeout # создается таймер на 0.3 секунды
	queue_free() # объект удаляется
