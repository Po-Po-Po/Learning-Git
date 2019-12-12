# В массиве случайных челых чисел поменять местами минимальный и максимальный элементы.

import random

SIZE = 10
MIN_ITEM = 0
MAX_ITEM = 100
test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]

print(test_array)

min_test_array = MIN_ITEM
max_test_array = MAX_ITEM
for i in range(SIZE):
    if test_array[i] < max_test_array:
        max_test_array = test_array[i]
        index_min = i
    if test_array[i] > min_test_array:
        min_test_array = test_array[i]
        index_max = i

test_array[index_min], test_array[index_max] = test_array[index_max], test_array[index_min]
print(test_array)
