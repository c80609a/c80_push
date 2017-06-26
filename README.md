# C80Push

Добавляет функционал дилеров и офисов продаж. 
Это ActiveAdmin plugin.

## Usage


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_push'
```

And then execute:

```bash
$ bundle
```

## Цитата из ТЗ

> Данный раздел представляет собой список компаний, у которых указаны
> адреса офисов продаж и другие контактные данные.
> 
> Эти данные пользователь видит на интерактивной карте
> (от GoogleMaps или Яндекс. Карты - на выбор).
> 
> Попадая на данную страницу, пользователь сначала видит интерактивную
> карту (на которой отмечены все адреса офисов продаж и дилеров) и
> селект, с помощью которого можно выбрать один из регионов.
> 
> Выбрав тот или иной регион, пользователь видит слева от
> интерактивной карты список компаний, а также адреса их офисов продаж.
> 
> Офисы продаж ORIMA и копании-дилеры (и адреса их офисов продаж)
> разграничены на интерактивной карте маркерами разного цвета.
> 
> В списке слева от интерактивной карты сначала отображаются офисы
> продаж компании ORIMA, а затем список компаний-дилеров
> (и адресов их офисов продаж).
> 
> С помощью инструментов панели управления сайтом можно создавать
> редактировать и удалять компании, задавать/изменять/удалять
> адреса офисов продаж и другие характеристики характеристики:
> 
> - Название (обязательно для заполнения)
> - Офис продаж (как минимум один)
> - Название офиса продаж (как минимум одного)
> - Адрес каждого офиса продаж (обязательно для заполнения)
> - Точные gps-координаты каждого офиса продаж (обязательно для заполнения).
> - Телефон (обязательно для заполнения)
> - Сайт для каждого офиса продаж (не обязательно для заполнения)
> - Принадлежность к региону
> 
> По клику на один из пунктов в списке слева пользователю на
> карте демонстрируется только один маркер, который соответствует
> данному пункту.
> 
> На странице присутсвует возможность фильтрации по региону.
> Выбрав регион пользователь видит в списке слева и на
> интерактивной карте только те офисы продаж/склады и дилеров,
> которые соответствую данному региону.
> Каждая компания имеет заранее предопределенное свойство "id".
