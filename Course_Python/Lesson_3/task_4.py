# Определить, какое число в массиве встречается чаще всего.

import random

SIZE = 100
MIN_ITEM = 0
MAX_ITEM = 50
test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(test_array)

amount_of_number = dict()
max_item = 0
for index, value in enumerate(test_array):
    if value not in amount_of_number:
        amount_of_number[value] = 0
    else:
        amount_of_number[value] += 1

print(amount_of_number)

for key in amount_of_number.keys():
    if amount_of_number[key] > max_item:
        index_max_item = key
        max_item = amount_of_number[key]

print(index_max_item)
