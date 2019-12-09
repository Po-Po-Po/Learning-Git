# Найти сумму n элементов следующего ряда чисел
def infinity_row(start_number, amount, sum):
    if amount != 0:
        sum += start_number
        return infinity_row(-start_number / 2, amount - 1, sum)
    else:
        return sum


amount_numbers = int(input("Количество чисел ряда: "))
start_row_number = 1
sum = 0
print(infinity_row(start_row_number, amount_numbers, sum))
