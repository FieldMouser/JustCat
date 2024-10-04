extends Control

func _ready() -> void:
	center_buttons()

func center_buttons() -> void:
	var screen_size = get_viewport().size
	
	# Находим центр экрана
	var center_x = screen_size.x / 2
	var center_y = screen_size.y / 2
	
	var button1 = $Play  # Замените на имя вашего узла кнопки
	var button2 = $Quit  # Замените на имя другого узла кнопки

	# Центрируем кнопку 1
	button1.position = Vector2(center_x - button1.get_size().x / 2, center_y - button1.get_size().y / 2)
	
	# Центрируем кнопку 2 (можете настроить позицию по своему усмотрению)
	button2.position = Vector2(center_x - button2.get_size().x / 2, center_y + button1.get_size().y / 2 + 10)  # С небольшим отступом

	# Выводим позиции кнопок в консоль
	print("Button1 Position: ", button1.position)
	print("Button2 Position: ", button2.position)
	print("Screen Size: ", screen_size)
