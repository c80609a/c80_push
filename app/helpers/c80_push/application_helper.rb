module C80Push

  # Предоставляет внешний интерфейс -
  # методы, которыми можно пользоваться
  # в host приложении
  module ApplicationHelper

    def c80_push_render_page_dealers

      # список регионов, включая дилеры и офисы
      region_dealer_office_list = Region.includes(dealers: :offices)

      # хэш для построения точек на Yandex карте
      ymap_hash = prepare_ymap_hash(region_dealer_office_list)

      # список регионов для select-а "Выберите регион"
      r = prepare_regions_hash(region_dealer_office_list)

      render partial: 'c80_push/shared/page_dealers',
             locals: {
                 rdo_list: region_dealer_office_list,
                 regions_list: r,
                 ymap_hash: ymap_hash
             }
    end

    private

    # специально для яваскрипта, работающего с yandex картой,
    # на основе +rdo+ собираем координаты всех офисов
    # в хеше вида:
    #
    # {
    #   all: {          - здесь собираем все офисы всех регионов (для лаконичности js)
    #       coords: [],
    #       props: []
    #   }
    #   <region_id>: [  - данные офисов разложены по регионам
    #       coords: [],
    #       props: []
    #   ]
    # }
    #
    # noinspection RubyResolve
    def prepare_ymap_hash(rdo)
      res = {
          all: {
              coords: [],
              props: []
          }
      }

      rdo.each do |region|
        region.dealers.each do |dealer|
          dealer.offices.each do |office|
            res[region.id] = { coords:[], props:[] } if res[region.id].nil?

            # координаты точки (это массив двух точек)
            gps = office.gps_arr

            # соберём свойства офиса для балуна
            props = {
                balloonContentHeader: t = "#{office.title} (#{dealer.title})",
                balloonContentBody:   b = "#{office.addr}<br>#{office.tel}<br>GPS: #{office.gps}",
                hintContent:          "#{t}<br>#{b}"
            }

            # фиксируем в хэше региона
            res[region.id][:coords] << gps
            res[region.id][:props] << props

            # фиксируем в all-хэше
            res[:all][:coords] << gps
            res[:all][:props] << props

          end
        # для удобства в js: зафиксируем кол-во офисов региона
        res[region.id][:count] = res[region.id][:coords].size
        end
      end

      # для удобства в js: зафиксируем кол-во всех офисов
      res[:all][:count] = res[:all][:coords].size

      res
    end

    # соберёт хэш только тех регионов, в которых есть офисы
    # например: {4=>{:id=>4, :title=>"Санкт-Петербург"}}
    def prepare_regions_hash(rdo)
      res = {}
      rdo.each do |region|
        region.dealers.each do |dealer|
          dealer.offices.each do |office|
            if res[region.id].nil?
              res[region.id] = { id:region.id, title:region.title }
            else
              break
            end
          end
        end
      end
      res
    end

  end
end
