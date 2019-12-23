from collections import deque

template = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

template_2 = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15}

number_1 = deque(input("Первое число: ").upper())
number_2 = deque(input("Второе число: ").upper())

# Сумма
result = deque()


def hex_sum(a, b):
    len_1 = len(a)
    len_2 = len(b)
    while len_1 < len_2:
        a.appendleft('0')
        len_1 += 1
    while len_1 > len_2:
        b.appenleft('0')
        len_2 += 1

    overflow = 0
    for i in list(range(len(a)))[::-1]:         #Складываем, начиная с последнего символа
        digit_sum = template_2.get(a[i]) + template_2.get(b[i]) + overflow
        if digit_sum > 15:
            overflow = 1
            digit_sum -= 16
        else:
            overflow = 0
        result.appendleft(template[digit_sum])
    if overflow == 1:
        result.appendleft(template[1])
    return result


print(hex_sum(number_1, number_2))
