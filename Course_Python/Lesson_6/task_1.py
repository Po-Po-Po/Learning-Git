# Нахождение самого частовстречающегося числа
# Python 3.7.3 (default, Mar 27 2019, 17:13:21) [MSC v.1915 64 bit (AMD64)] :: Anaconda, Inc. on win32
# Разрядность x64

import random
from sys import getsizeof


def memory_count(args):
    memory_sum = 0
    if isinstance(args, list):
        for item in args:
            if hasattr(item, '__iter__') and not isinstance(item, str):
                memory_sum += getsizeof(item)
                if hasattr(item, 'items'):
                    for key, value in item.items():
                        memory_sum += memory_count([key, value])
                else:
                    for value in item:
                        memory_sum += memory_count(value)
            else:
                memory_sum += getsizeof(item)
    else:
        memory_sum += getsizeof(args)
    return memory_sum


# Вариант 1

def dict_amount_of_number_v1(SIZE):
    MIN_ITEM = 0
    MAX_ITEM = 50
    test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]

    amount_of_number = dict()
    max_item = 0
    for index, value in enumerate(test_array):
        if value not in amount_of_number:
            amount_of_number[value] = 1
        else:
            amount_of_number[value] += 1
        last_index = index  # Взял только последние значения итератора
        last_value = value

    for key in amount_of_number.keys():
        if amount_of_number[key] > max_item:
            index_max_item = key
            max_item = amount_of_number[key]
        last_key = key  # Взял только последние значения итератора

    lst_of_variable = [SIZE, MIN_ITEM, MAX_ITEM, test_array, amount_of_number, max_item, last_index, last_value,
                       index_max_item, last_key]  # Все объекты запихал в массив, чтобы все сразу посчитать
    print(f'Первый вариант. Количество занимаемой памяти- {memory_count(lst_of_variable)} байт.')
    return index_max_item


dict_amount_of_number_v1(20)


# Вариант 2

def list_amount_of_number_v2(SIZE):
    MIN_ITEM = 0
    MAX_ITEM = 50
    test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]

    num = test_array[0]
    frequency = 1
    for i in range(len(test_array)):
        spam = 1
        for j in range(i + 1, len(test_array)):
            if test_array[i] == test_array[j]:
                spam += 1
            if spam > frequency:
                frequency = spam
                num = test_array[i]
            last_index_j = j
        last_index_i = i
    lst_of_variable = [SIZE, MIN_ITEM, MAX_ITEM, test_array, num, frequency, spam, last_index_i, last_index_j]
    print(f'Второй вариант. Количество занимаемой памяти- {memory_count(lst_of_variable)} байт.')
    return num


list_amount_of_number_v2(20)


# Вариант 3

def dict_amount_of_number_inplace(SIZE):
    MIN_ITEM = 0
    MAX_ITEM = 50
    test_array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]

    amount_of_number = dict()
    max_item, freq = test_array[0], 1
    for index, value in enumerate(test_array):
        if value not in amount_of_number:
            amount_of_number[value] = 1
        else:
            amount_of_number[value] += 1
        if amount_of_number[value] > freq:
            freq = amount_of_number[value]
            max_item = value
        last_index = index
        last_value = value
    lst_of_variable = [SIZE, MIN_ITEM, MAX_ITEM, test_array, amount_of_number, max_item, freq, last_index, last_value]
    print(f'Третий вариант. Количество занимаемой памяти- {memory_count(lst_of_variable)} байт.')
    return max_item


dict_amount_of_number_inplace(20)

#   Первый вариант. Количество занимаемой памяти- 1350 байт.
#   Второй вариант. Количество занимаемой памяти- 526 байт. Самый выгодный, так как не использует словари, но медленнее работает.
#   Третий вариант. Количество занимаемой памяти- 1256 байт.
#   Значения получаются разными, из-за рандомности заполнения.
