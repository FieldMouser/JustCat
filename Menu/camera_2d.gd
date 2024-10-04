extends Camera2D

var initial_position: Vector2 = Vector2(1000, 620)
var follow_speed: float = 1.0

func _ready() -> void:
	position = initial_position
	print("Camera starting position:", position)
	
	# Отключаем обработку кадров
	set_process(false)
	
	# Запускаем задержку перед активацией функции
	await get_tree().create_timer(3.0).timeout  # Задержка 5 секунд
	
	print("5 seconds have passed, starting to follow mouse.")
	start_following_mouse()  # Запускаем функцию после задержки

func start_following_mouse():
	# Включаем логику следования за мышью
	set_process(true)

func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	position = position.lerp(mouse_position, follow_speed * delta)
