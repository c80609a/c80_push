module C80Push

  # Предоставляет внешний интерфейс -
  # методы, которыми можно пользоваться
  # в host приложении
  module ApplicationHelper

    def c80_push_render_page_dealers

      # список регионов, включая дилеры и офисы
      region_dealer_office_list = Region.includes(dealers: :offices)

      render partial: 'c80_push/shared/page_dealers',
             locals: {
                 rdo_list: region_dealer_office_list
             }
    end

  end
end
