# draw.io
#

# Написать программу, которая будет складывать, вычитать, умножать или делить два числа
while True:
    num_1 = int(input('Введите первое число: '))
    num_2 = int(input('Введите второе число: '))
    operation = str(input('Введите тип операции (*,/,+,-): '))
    if operation == '0':
        break
    elif operation == '*':
        result = num_1 * num_2
        print(result)
    elif operation == '+':
        result = num_1 + num_2
        print(result)
    elif operation == '-':
        result = num_1 - num_2
        print(result)
    elif operation == '/':
        if num_2 == 0:
            print('На ноль делить нельзя!')
            break
        else:
            result = num_1 / num_2
            print(result)
    else:
        print('Введена неверная операция!')
