#  диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9.

int_array = [x for x in range(2, 100)]
count = [0 for _ in range(2, 10)]

for i in range(len(int_array)):
    for j in range(2, 10):
        if int_array[i] % j == 0:
            count[j - 2] += 1

for i in range(2, 10):
    print(f"Количество чисел кратных {i}: {count[i - 2]}")
