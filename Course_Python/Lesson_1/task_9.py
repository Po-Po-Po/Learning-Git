# Вводятся три разных числа. Найти, какое из них является средним (больше одного, но меньше другого).

num_1 = float(input("Введите первое число: "))
num_2 = float(input("Введите второе число: "))
num_3 = float(input("Введите третье число: "))

if ((num_1 < num_2) | (num_1 < num_3)) & ((num_1 > num_2) | (num_1 > num_3)):
    print(f"Средним числов является: {num_1}")
elif ((num_2 < num_1) | (num_2 < num_3)) & ((num_2 > num_1) | (num_2 > num_3)):
    print(f"Средним числов является: {num_2}")
else:
    print(f"Средним числов является: {num_3}")
