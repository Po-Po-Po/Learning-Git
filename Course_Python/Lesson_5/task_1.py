from collections import namedtuple

amount_enterprise = int(input("Количество предприятий:"))

dict_enterprise = namedtuple('dict_enterprise', 'name, season_1, season_2, season_3, season_4, average_')
list_of_enterprise = []
average_sum = 0
for i in range(amount_enterprise):
    income = []
    name = input("Наименование предприятия: ")
    for j in range(1, 5):
        income.append(int(input(f"Доход предприятия за {j} сезон =")))
    list_of_enterprise.append(dict_enterprise(name, *income, sum(income)/4))
    average_sum += list_of_enterprise[i].average_

average_sum = average_sum/amount_enterprise
print(list_of_enterprise)
print(f"Средняя прибыль всех предприятий: {average_sum}")
print("Предприятия, чья прибыль ниже среднего: ")
for i in range(amount_enterprise):
    if list_of_enterprise[i].average_ < average_sum:
        print(list_of_enterprise[i].name)

print("Предприятия, чья прибыль выше среднего: ")
for i in range(amount_enterprise):
    if list_of_enterprise[i].average_ > average_sum:
        print(list_of_enterprise[i].name)
