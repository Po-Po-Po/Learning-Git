# Во втором массиве сохранить индексы четных элементов первого массива.
import random

SIZE = 10
MIN_ITEM = 0
MAX_ITEM = 100
test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
array_of_index = []

print(test_array)

for i in range(SIZE):
    if test_array[i] % 2 == 0:
        array_of_index.append(i)

print(array_of_index)
