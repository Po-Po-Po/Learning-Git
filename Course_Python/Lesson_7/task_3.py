# Массив размером 2m + 1, где m — натуральное число, заполнен случайным образом. Найдите в массиве медиану.

import numpy as np


class ShMiddle:

    def __init__(self, arr):
        self.array = list(arr)

    def Middle(self):
        for i in range(len(self.array)):
            less = 0
            more = 0
            equal = 0
            for j in range(len(self.array)):
                if self.array[i] < self.array[j]:
                    more += 1
                elif self.array[i] > self.array[j]:
                    less += 1
                elif self.array[i] == self.array[j] and i != j:
                    equal += 1
            if more == less or less == equal + more or more == equal + less:
                return self.array[i]


    def ShSort(self):
        for i in range(len(self.array)):
            for j in range(len(self.array) - 1):
                if self.array[j + 1] < self.array[j]:
                    self.array[j], self.array[j + 1] = self.array[j + 1], self.array[j]
        return self.array


M = int(input("Натуральное число: "))
Mid = ShMiddle(np.random.randint(10, 20, 2 * M + 1))
print(f'Исходный массив: {Mid.array}')
print(f'Медианой является: {Mid.Middle()}')
print(f'Отсортированный массив: {Mid.ShSort()}')
