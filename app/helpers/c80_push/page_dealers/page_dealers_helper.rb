module C80Push
  module PageDealers
    module PageDealersHelper

      # Выдать список Дилеров (включая Офисы),
      # разложенный по Регионам.
      # Список выводится слева от карты.
      #
      # * Регион
      #     * Дилер
      #         * Офис 1
      #             * адрес офиса
      #             * телефон офиса
      #         * Офис 2
      #             * адрес офиса
      #             * телефон офиса
      #         * сайт дилера
      #         * email дилера
      #
      def render_dealers_list

        res = ''

        Region.includes(dealers: :offices).each do |region|
          r = region.title
          r += ul_region_dealers(region)
          res += "<li id='region_#{region.id}'>#{r}</li>"
        end

        "<ul>#{res}</ul>".html_safe

      end

      private

      # используется только в render_dealers_list
      def ul_region_dealers(region)
        res = ''
        # noinspection RubyResolve
        region.dealers.each do |dealer|
          d = dealer.title
          d += ul_dealer_offices(dealer)
          res += "<li id='dealer_#{dealer.id}'>#{d}</li>"
        end
        "<ul class='ul_region_dealers'>#{res}</ul>"#.html_safe
      end

      # используется только в ul_region_dealers
      def ul_dealer_offices(dealer)
        res = ''
        # noinspection RubyResolve
        dealer.offices.each do |office|
          o = office.title
          o += ul_office_props(office)
          res += "<li id='office_#{office.id}'>#{o}</li>"
        end
        res += "<li>#{dealer.email}</li>"
        res += "<li>#{dealer.site}</li>"
        "<ul class='ul_dealer_offices'>#{res}</ul>"#.html_safe
      end

      # используется только в ul_dealer_offices
      def ul_office_props(office)
        res = ''
        res += "<li>#{office.addr}</li>"
        res += "<li>#{office.tel}</li>"
        "<ul class='ul_office_props'>#{res}</ul>"#.html_safe
      end

    end
  end
end