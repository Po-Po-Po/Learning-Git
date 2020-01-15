# 2)Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный случайными числами на промежутке [0; 50).

import numpy as np


def merge_sort(array):
    mid_split = len(array) // 2
    if mid_split != 0:
        left_array = array[:mid_split]
        right_array = array[mid_split:]
        merge_sort(left_array)
        merge_sort(right_array)
        left_index = 0
        right_index = 0
        index = 0
        while left_index < len(left_array) and right_index < len(right_array):
            if left_array[left_index] > right_array[right_index]:
                array[index] = right_array[right_index]
                right_index += 1
            else:
                array[index] = left_array[left_index]
                left_index += 1
            index += 1
        while left_index < len(left_array):
            array[index] = left_array[left_index]
            left_index += 1
            index += 1
        while right_index < len(right_array):
            array[index] = right_array[right_index]
            right_index += 1
            index += 1
    return array

SIZE = 11
random_arr = [round(i, 2) for i in
              np.random.random(SIZE) * 50]  # рандомные числа в диапазоне [0:50), округленные до 2 знаков
print(f'Исходный массив: {random_arr}')
print(f'Отсортированный массив: {merge_sort(random_arr)}')
