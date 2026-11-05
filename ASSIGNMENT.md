# Лабораторна робота №1

**Тема: Знайомство з Ruby на базі тестування коду**

**Мета: вивчити мову Ruby, синтаксис, структуру та деякі загальні речі функції та бібліотеки. А також вивчити можливості тестування коду.**

## 0. Ідея

У репозиторії знаходяться файли, кожен з яких описує певну частину мови Ruby з використанням функцій тестування коду.
Наприклад, поняття Хеш-обʼєктів описано у файлі `about_hashes.rb`, а модулі описані у файлі `about_modules.rb`.
Вони представлені у порядку визначеному у файлі `path_to_enlightenment.rb`.

Запускаючи на виконання (процес запуску буде описано далі) процес буде зупинений на першому місці, яке необхідно виправити.
Деякі тести просто потребують заміни правильної відповіді на неправильну.
Однак деякі, вимагають від вас власної відповіді.
Якщо ви бачите метод `__` (подвійне підкреслення), це підказка для того, що необхідно надати власний код, щоб змусити тест працювати правильно.

## 1. Встановлення Ruby

Якщо у вас немає Ruby, відвідайте http://ruby-lang.org/en/downloads/ для інструкцій зі встановлення.
Щоб запустити тести, вам потрібні `ruby` і `rake` пакети.
Щоб перевірити свої установки, просто введіть:

***nix** платформи з будь-якого вікна терміналу:
```sh
$ ruby --version
$ rake --version
```

**Windows** із командного рядка (`cmd.exe`):
```sh
$ ruby --version
$ rake --version
```

Якщо у вас не встановлено `rake`, просто запустіть `gem install rake`

## 2. Запуск тестів

Ви можете запускати тести через команду `rake` або викликаючи сам файл (`rake` — це рекомендований спосіб їх запуску у даній лабораторній роботі):

```sh
$ rake
```

АБО

```sh
$ ruby path_to_enlightenment.rb
```

## 3. Процес виконання або "_Red, Green, Refactor_"

У [керованій тестами розробці](https://uk.wikipedia.org/wiki/%D0%9A%D0%B5%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B0_%D1%82%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8_%D1%80%D0%BE%D0%B7%D1%80%D0%BE%D0%B1%D0%BA%D0%B0) мантрою завжди було _червоний, зелений, рефакторинг_:
> Напишіть невдалий тест і запустіть його (_червоний_), зробіть тест успішним (_зелений_), потім перегляньте код і подумайте, чи можете ви покращити його (_рефакторинг_).

Такий самий підхід необхідно застосувати виконуючи цю лабораторну роботу.

У перший раз, коли ви запускаєте тести, ви побачите такий результат:

```sh
$ rake                         
~/.rbenv/versions/3.3.0/bin/ruby path_to_enlightenment.rb
AboutAsserts#test_assert_truth has damaged your karma.

The Master says:
  You have not yet reached enlightenment.
  Do not lose hope.

The answers you seek...
  Failed assertion.

Please meditate on the following code:
  ~/lab1/about_asserts.rb:10:in `test_assert_truth'

mountains are merely mountains
your path thus far [X_________________________________________________] 0/284 (0%)
```

**Ви підійшли до свого першого етапу.** Зверніть увагу, що тест говорить вам, де шукати перше рішення:

```
Please meditate on the following code:
  ~/lab1/about_asserts.rb:10:in `test_assert_truth'
```

Відкрийте файл `about_asserts.rb` і подивіться на перший тест:

```ruby
# We shall contemplate truth by testing reality, via asserts.
def test_assert_truth
  assert false                # This should be true
end
```

Змініть `false` на `true` і повторно запустіть тест.
Після цього, подумайте про те, що ви це вчить.
У цьому випадку ігноруйте все, крім назву методу (`test_assert_truth`) і частини всередині методу (все перед `end`)

У цьому випадку мета полягала в тому, щоб ви побачили, що якщо ви передаєте значення в `assert` метод, він або переконається, що він `true`, і продовжить роботу, або завершиться помилкою, якщо передається `false`.

## 4. Рекомендавана література

* [The Ruby Language FAQ](https://www.ruby-lang.org/en/documentation/faq)
* [Learn to Program](https://pine.fm/LearnToProgram)
* [The Ruby Programming Wikibook](https://en.wikibooks.org/wiki/Ruby_Programming)
* [Try Ruby in your browser](https://try.ruby-lang.org)
* [Programming Ruby. The Pragmatic Programmer's Guide](https://ruby-doc.com/docs/ProgrammingRuby)
