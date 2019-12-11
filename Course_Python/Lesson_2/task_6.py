#  В программе генерируется случайное целое число от 0 до 100. Пользователь должен его отгадать не более чем за 10 попыток.

import random

target = random.randint(0, 100)
count = 0
while True:
    user_number = int(input("Ваше число: "))
    if user_number < target:
        count += 1
        print(f"Загаданное число больше. Попыток осталось: {10 - count}")
    elif user_number > target:
        count += 1
        print(f"Загаданное число меньше. Попыток осталось: {10 - count}")
    else:
        print("Вы угадали число!")
        break
    if count == 10:
        print(f"Загаданное число: {target}")
        break
