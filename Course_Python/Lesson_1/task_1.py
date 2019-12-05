# Ссылка на draw.io
# https://drive.google.com/file/d/1CNsUuajnYEpA3LDAl1IhK-uaLQqG-OJ6/view?usp=sharing

# Найти сумму и произведение цифр трехзначного числа, которое вводит пользователь.

entered_number = int(input("Введите трехзначное число: "))
numeral_1 = entered_number % 10
diff = (entered_number - numeral_1)/10
numeral_2 = diff % 10
numeral_3 = diff // 10
numeral_sum = int(numeral_1 + numeral_2 + numeral_3)
compos = int(numeral_1 * numeral_2 * numeral_3)

print(f"Сумма цифр: {numeral_sum}, произведение цифр: {compos}")
