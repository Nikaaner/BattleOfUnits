BattleOfUnits
=============
###### Виконано:
1. Створено клас Unit з необхідними характеристиками та поведінкою.
2. Створено три підкласи класу Unit з особливими характеристиками та відповідними особливостями поведінки:
 - Hunter: має можливість ухилитися від атаки (імовірність вказана у відсотках); при вбивстві ворога збільшує свою силу відповідно до вказаного коефіцієнту досвіду.
 - Vampire: відновлює свої пункти здоров’я в залежності від нанесеного урону (кількість вказана у відсотках); при критично малій кількості здоров’я входить в стан "ненаситного голоду" в якому замість безкорисної атаки трупа відновлює певну кількість пунктів здоров’я, після чого виходить зі стану "ненаситного голоду".
 - Warrior: має можливість зробити критичне попадання (імовірність вказана у відсотках) яке завдасть подвійного урону; має пункти броні завдяки яким отримує менший урон від ворогів.
3. Створено клас BattleSimulator, який має наступні види симуляції битви:
 - Всі проти всіх: всі юніти роблять ходи у довільному порядку, де випадковий юніт атакує випадкового юніта; у вибірці атакуючого вбиті юніти не беруть участі, але їхні тіла беруть участь у вибірці цілі атакуючого, їх можна пробувати атакувати; в кінці кожного ходу є імовірність що подує "цілющий вітер" на довільного юніта і збільшить його здоров’я на довільну кількість (вказано діапазон).
 - Один проти одного: два юніти почергово атакують один одного; на початку кожного ходу визначається випадковим чином хто буде атакувати першим; в кінці кожного ходу є імовірність що подує "цілющий вітер" на довільного юніта і збільшить його здоров’я на довільну кількість (вказано діапазон).


###### Тестовое задание 2:
> Реализовать несколько типов юнитов (3-5), которые наследуют общего предка. Каждый тип юнит обладает следующими характеристиками:
- максимальный запас здоровья
- текущее количество очков здоровья
- сила атаки
- имя(название) юнита
- уникальные характеристики юнита (3-5 собственных поля)

> Каждому юниту можно нанести урон или восстановить какое-то количество очков здоровья. При этом текущее количество очков здоровья не может становиться отрицательным. Юнит считается мертвым, когда текущее количество очков здоровья равно нулю.

> Восстановить юниту можно не больше его максимального запаса здоровья.

> Юнит может атаковать другого юнита, отняв у него количество жизненных сил, соответствующее его силе атаки. Если противник не был убит при атаке, то он проводит контратаку (сила атаки/2) и наносит урон нападавшему юниту.

> Ограничения:
- мертвых юнитов невозможно атаковать
- мертвым юнитам невозможно восстановить очки здоровья

> Написать программу для демонстрации работы описанной модели. Количество юнитов выставляете сами. Задача предусматривает демонстрацию знаний ООП + логика.

> P.S. Не ограничивайтесь только шаблоном поставленных заданий. Расширение каждой задачи (дополнительные операции, возможности) будут учтены.
