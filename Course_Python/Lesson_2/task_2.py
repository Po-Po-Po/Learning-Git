# Посчитать четные и нечетные цифры введенного натурального числа.


def sum(number):
    even = 0
    not_even = 0
    for _ in number:
        if int(_) % 2 == 0:
            even += 1
        else:
            not_even += 1
    return f'Количетсво четных цифр: {even}, количество нечетных цифр: {not_even}'


number = str(input('Введите число: '))
print(sum(number))
