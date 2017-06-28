module C80Push

  # Предоставляет внешний интерфейс -
  # методы, которыми можно пользоваться
  # в host приложении
  module ApplicationHelper

    def c80_push_render_page_dealers

      # список регионов, включая дилеры и офисы
      region_dealer_office_list = Region.includes(dealers: :offices)

      ymap_hash = prepare_ymap_hash(region_dealer_office_list)

      render partial: 'c80_push/shared/page_dealers',
             locals: {
                 rdo_list: region_dealer_office_list,
                 ymap_hash: ymap_hash
             }
    end

    private

    # специально для яваскрипта, работающего с yandex картой,
    # на основе +rdo+ собираем координаты всех офисов
    # в хеше вида:
    #
    # {
    #   all: []       - здесь собираем все офисы всех регионов
    #   region_id: [] - данные офисов разложены по регионам
    # }
    #
    def prepare_ymap_hash(rdo)
      res = {all:[]}

      rdo.each do |region|
        region.dealers.each do |dealer|
          dealer.offices.each do |office|
            res[region.id] = [] if res[region.id].nil?
            v = office.gps_arr
            res[region.id] << v
            res[:all] << v
          end
        end
      end

      res
    end

  end
end
