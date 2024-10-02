extends Node2D

var state = false # состояние дерева (я яблоками или нет)
var player_in_area = false # проверка наличия игрока в радиусе packable_area

var apple = preload("res://Characters/apple_collectable.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	# Если нет яблок, то при сосздании сцены запустит таймер 
	if state == false: 
		$growth_timer.start()

func _process(delta):
	# Если state = false, запустит анимацию с отсутствием яблок
	if state == false:
		$AnimatedSprite2D.play("no apples")
	else:
		$AnimatedSprite2D.play("apples") # Запускает анимацию с яблоками
		if player_in_area: # Если player_in_area == true, при нажатии f сделает то, что ниже
			if Input.is_action_just_pressed("f"):
				state = false
				drop_apple() 


func _on_packable_area_body_entered(body: Node2D) -> void: # Когда игрок входит в область 
	if body.has_method("player"):
		player_in_area = true

func _on_packable_area_body_exited(body: Node2D) -> void: # Когда игрок выходит из области
	if body.has_method("player"):
		player_in_area = false

func _on_growth_timer_timeout() -> void: # Когда таймер прошел
	if !state:
		state = true

func drop_apple():
	var apple_instance = apple.instantiate()
	apple_instance.global_position = $Marker2D.global_position
	get_parent().add_child(apple_instance)  
	
	await get_tree().create_timer(3).timeout 
	$growth_timer.start()
	
	# Создание экземпляра яблока: var apple_instance = apple.instantiate() создает новый экземпляр объекта apple, который, скорее всего, представляет собой сцену или префаб яблока.
	# Установка позиции: apple_instance.global_position = $Marker2D.global_position устанавливает глобальную позицию созданного экземпляра яблока на позицию узла Marker2D. Это значит, что яблоко появится в той же точке, где находится этот узел.
	# Добавление в сцену: get_parent().add_child(apple_instance) добавляет экземпляр яблока в родительский узел текущего скрипта, делая его частью иерархии сцены.
	# Ожидание 3 секунды: await get_tree().create_timer(3).timeout создает таймер на 3 секунды и ожидает его завершения. Это значит, что выполнение кода временно приостанавливается на это время.
	# Запуск таймера роста: После истечения 3 секунд вызывается $growth_timer.start(), который, вероятно, запускает какой-то процесс роста (например, увеличивает размер яблока или инициирует его созревание).
