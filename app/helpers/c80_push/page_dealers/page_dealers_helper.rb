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
          res += "<li>#{r}</li>"
        end

        "<ul>#{res}</ul>".html_safe

      end

      private

      def ul_region_dealers(region)
        res = ''
        region.dealers.each do |dealer|
          d = dealer.title
          d += ul_dealer_offices(dealer)
          res += "<li>#{d}</li>"
        end
        "<ul>#{res}</ul>"#.html_safe
      end

      def ul_dealer_offices(dealer)
        res = ''
        dealer.offices.each do |office|
          o = office.title
          o += ul_office_props(office)
          res += "<li>#{o}</li>"
        end
        res += "<li>#{dealer.email}</li>"
        res += "<li>#{dealer.site}</li>"
        "<ul>#{res}</ul>"#.html_safe
      end

      def ul_office_props(office)
        res = ''
        res += "<li>#{office.addr}</li>"
        res += "<li>#{office.tel}</li>"
        "<ul>#{res}</ul>"#.html_safe
      end

    end
  end
end