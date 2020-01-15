# 1)Отсортируйте по убыванию методом пузырька одномерный целочисленный массив, заданный случайными числами на промежутке [-100; 100)


import numpy as np


def my_sort(array):
    for i in range(len(array)):
        for j in range(len(array) - 1):
            if array[j + 1] > array[j]:
                array[j], array[j + 1] = array[j + 1], array[j]
    return array


SIZE = 15
random_arr = list(np.random.randint(-100, 100, SIZE))
print(f'Исходный массив: {random_arr}')
print(f'Отсортированный массив: {my_sort(random_arr)}')


