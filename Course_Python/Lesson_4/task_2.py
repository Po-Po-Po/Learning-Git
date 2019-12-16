# Написать два алгоритма нахождения i-го по счёту простого числа
import cProfile
from timeit import timeit

# 1)Решето Эратосфена

func_1 = """
def Eratosthenes(position):
    size = 400
    list_of_number = [x for x in range(size + 1)]
    list_of_number[1] = 0
    i = 2
    while i <= size:
        if list_of_number[i] != 0:
            j = i + i
            while j <= size:
                list_of_number[j] = 0
                j = j + i
        i += 1

    uniq_number = [x for x in list_of_number if x != 0]
    return uniq_number[position - 1]
Eratosthenes(10)
"""
# number = 100.
# 0.003057299999999999 Eratosthenes(10), size = 100
# 0.006210400000000001 Eratosthenes(10), size = 200
# 0.014182499999999997 Eratosthenes(10), size = 400

# 2) Без решета

func_2 = """
import math

def without_Eratosthenes(position):
    size = 400
    list_of_number = [x for x in range(size + 1)]
    list_of_number[1] = 0
    array_of_primes = list()
    for i in range(2, len(list_of_number)):
        flag = True
        for j in range(2, math.floor(math.sqrt(list_of_number[size]))):
            if list_of_number[i] == j:
                continue
            if list_of_number[i] % j == 0:
                flag = False                              # метка, что число не простое
        if flag:
            array_of_primes.append(list_of_number[i])
    return array_of_primes[position - 1]

without_Eratosthenes(10)
"""
# number = 100.
# 0.0195772 Eratosthenes(10), size = 100
# 0.059971399999999994 Eratosthenes(10), size = 200
# 0.1407756 Eratosthenes(10), size = 400

# 2-ой вариант, выполняется в 10 раз дольше, из-за вложенного цикла.
# ----------------------------------------------------------

print(timeit(func_2, number=100))
