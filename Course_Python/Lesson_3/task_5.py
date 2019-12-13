# В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.

import random

CONST_ZERO = 0
SIZE = 10
MIN_ITEM = -50
MAX_ITEM = 50
test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
diff = 50
print(test_array)

for i in range(SIZE):
    if test_array[i] < 0 and abs(CONST_ZERO + test_array[i]) < diff:
        diff = abs(CONST_ZERO + test_array[i])
        index = i

print(f'Индекс: {index}, значение: {test_array[index]}')
