# Нахождение самого частовстречающегося числа

from timeit import timeit
import cProfile

# Вариант 1 (Словарь)

func_1 = """
import random

def dict_amount_of_number(SIZE):
    SIZE = 400
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

    for key in amount_of_number.keys():
        if amount_of_number[key] > max_item:
            index_max_item = key
            max_item = amount_of_number[key]
    return index_max_item
    
dict_amount_of_number(400)
"""

# Исследования по 1-му варианту (number = 100):
# 0.021808400000000002 size = 100
# 0.03787839999999999 size = 200
# 0.06422399999999999 size = 400

# Вариант 2 (массив)
func_2 = """
import random

def list_amount_of_number(SIZE):
    SIZE = 400
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
    return num
list_amount_of_number(400)
"""
# Исследования по 2-му варианту (number = 100):
# 0.0827822 size = 100
# 0.2710034 size = 200
# 1.1120713 size = 400

# Вариант 3 (словарь, сразу находим максимум при обходе)
func_3 = """
import random

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
    return max_item
dict_amount_of_number_inplace(400)
"""
# Исследования по 3-му варианту (number = 100):
# 0.022038100000000005 size = 100
# 0.0386382 size = 200
# 0.0679358 size = 400

# Самый оптимальный 1-ый вариант. Выполняется чу-чуть быстрее 3-его. Не понятно почему, так как в 3-ем варианте
# вычисление самого частовстречающегося элемента выполняется "inplace", а в 1-ом находится еще 1 внешний цикл для
# нахождения самого частовтсречающегося элемента.

# -------------------------------------------------------


print(timeit(func_3, number=100))
cProfile.run(func_3)
