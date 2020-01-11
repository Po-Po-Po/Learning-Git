# Определение количества различных подстрок с использованием хеш-функции

import hashlib


def count_str(in_str):
    line_counter = 0
    char_in_str = 1
    set_of_subs = set()
    while char_in_str < len(in_str):
        for i in range(len(in_str) - char_in_str + 1):
            h_substr = hashlib.sha256(in_str[i:i + char_in_str:].encode('utf-8')).hexdigest()
            if h_substr not in set_of_subs:
                set_of_subs.add(h_substr)
                line_counter += 1
        char_in_str += 1
    return line_counter


in_str = input('Строка: ')
print(f'В строке "{in_str}" - {count_str(in_str)} подстрок')
