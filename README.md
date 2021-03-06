# C80Push

Добавляет функционал дилеров и офисов продаж. 
Это *ActiveAdmin* plugin.
Использует *Bootstrap* и *Bootstrap Select*: как во *frontend*,
так и в *backend*.

Содержит модели: 

* *Регион* (habtm Dealers)
* *Дилер* (has_many Offices)
* *Офис* (belongs_to Dealer)

Добавляет пункт меню:

* Дилеры
    * Список дилеров
    * Регионы

## Usage

Available helpers:

* `c80_push_render_page_dealers`: отрисует js-компонент с yandex картой
и фильтруемым, кликабельным списком офисов слева.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_push'
```

And then execute:

```bash
$ bundle
$ rake db:migrate
$ rails generate c80_push:install
$ rake db:seed:c80_push_02_fill_presets
```

Add this line to host app's `application_controller.rb`:
 
```ruby
   helper C80Push::Engine.helpers
```

Add these lines to host app's `active_admin.js.coffee`:

```js
#= require bootstrap
#= require bootstrap-select
#= require c80_push_backend
```

Add these lines to host app's 'application.js.coffee':

```js
#= require bootstrap
#= require bootstrap-select
#= require c80_push
```

Add these lines to host app's 'application.scss':

```css
@import "bootstrap-sprockets";
@import "bootstrap";
@import "bootstrap-select";
@import "c80_push";
```

## Customization

Т.к. исходя из ТЗ было не ясно, есть ли у *Офисов* такие поля, как
сайт, email и регион, они были добавлены (на всякий случай), и поля
сделаны необязательными. И их можно "отключить", добавив в host app
такой файл `app/assets/stylesheets/custom/backend/c80_push/dealers.scss`:

```scss
/* у Офисов скроем неиспользуемые поля */
body.admin_dealers {
  &.edit, &.new {

    li[id*='dealer_offices_attributes_'] {
      &[id*='site_input'] {
        display: none;
      }
      &[id*='email_input'] {
        display: none;
      }
      &[id*='regions_input'] {
        display: none;
      }
    }
  }
}
```

А сам файл подключить в `active_admin.scss`:

```scss
@import "custom/backend/**/*";
```

# TODO

* [X] Добавить валидацию поля `gps` модели *Office*.

    - [ ] Попробовать подключить к `backend` *client side validation*.

* [X] Реализовать функционал цветных маркеров.

    - [ ] Внутри `bootstrap selectpicker` должны рисоваться цветные прямоугольники: 
        - Исходный код класса [/formtastic/inputs/select_input.rb](https://github.com/justinfrench/formtastic/blob/master/lib/formtastic/inputs/select_input.rb),
        - Stackoverflow просвящает по сабжу [bootstrap selectpicker: option with data-content](https://stackoverflow.com/questions/26069286/bootstrap-with-select-list-that-contains-only-images)

* [ ] ymaps: реализовать кластеризацию ([пример из документации](https://tech.yandex.ru/maps/jsbox/2.1/clusterer_create)).

* [ ] Вынести `*.rb` файлы, подлежащие кастомизации в `templates` (предварительно
определив, что может еще быть кастомизировано), наваять инсталлятор,
отметить это в `README`.

    - [X] seeds

# Процесс разработки JS функционала 

Теперь пора заняться js.

* [X] Прикрутить `selectpicker`: выводить туда только те регионы, в которых есть дилеры,
у которых есть офисы.

* [X] Вставить заголовок "Выберите Регион". 

* [X] При первом входе на карту: должны отражаться все офисы.

    - [X] Должен рассчитываться `bounding rectangle` и все точки должны быть видны
    на рабочей области (никто не должен выходить за рамки)

* [ ] При наведении/клике на точку на карте:
 
    - [X] должен появляться хинт с деталями офиса
    - [ ] слева должен подсвечиваться соответствующий `.li_office`.
       
* [X] При наведении/клике на `.li_office` - должна подсвечиваться соответствующая 
точка на карте.       
 
* [X] Реализовать функционал цветных маркеров.

* [X] Когда меняется регион:

    * [X] Должны отобразиться релевантные `.li_office`
    * [X] Должны отобразиться релевантные точки на карте.

## Процесс добавления функционала "Цвет маркеров дилеров"

* [X] добавляем таблицу `Presets` с полями `preset_name`
и `color`, причём `color` я должен забить руками с помощью color picker
со страницы докуметации Яндекс.карты (`color` используется только в админке
для иллюстрации "что такое preset").

* [X] Таблица `Presets` должна быть habtm-связана с таблицей `:dealers`

* [X] Таблицу заполнить содержимым с помощью seed файла, пункт в админке не делать.

* [X] при сборке хеша для Яндекс.карт - собираем в него свойства меток

    - [X] Если цвет не задан - по-умолчанию добавляем голубой 

* в админке:

    - [ ] в форме редактирования/создания: у каждого дилера должен быть селект, в котором видно как
    и название `preset-а`, так и его цвет

    * [X] на индексной странице: должен быть столбец, в котором выводится название
    `preset-a` и его цвет

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
> Офисы продаж компании и копании-дилеры (и адреса их офисов продаж)
> разграничены на интерактивной карте маркерами разного цвета.
> 
> В списке слева от интерактивной карты сначала отображаются офисы
> продаж компании, а затем список компаний-дилеров
> (и адресов их офисов продаж).
> 
> С помощью инструментов панели управления сайтом можно создавать
> редактировать и удалять компании, задавать/изменять/удалять
> адреса офисов продаж и другие характеристики характеристики:
> 
> - Название*
> - Офисы продаж (как минимум один):
>     - Название*
>     - Адрес*
>     - gps*
>     - Телефон*
>     - Сайт
>     - Принадлежность к региону (офиса)
> - Принадлежность к региону (дилера)
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

