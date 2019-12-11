#  Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран


def reverse(number):
    result = ''
    for i in number[::-1]:
        result += i
    return result


number = str(input("Введите число: "))
print(int(reverse(number)))
