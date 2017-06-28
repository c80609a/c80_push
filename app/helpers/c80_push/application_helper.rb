module C80Push

  # Предоставляет внешний интерфейс -
  # методы, которыми можно пользоваться
  # в host приложении
  module ApplicationHelper

    def c80_push_render_page_dealers
      render partial: 'c80_push/shared/page_dealers',
             locals: {
             }
    end

  end
end
