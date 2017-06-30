ActiveAdmin.register C80Push::Dealer, as: 'Dealer' do

  menu :label => proc{ I18n.t('c80_push.active_admin.menu.dealer')},
       :parent => 'x_c80_push',
       :priority => 1

  permit_params :title,
                :ord,
                :site,
                :email,
                :preset_ids => [],
                :region_ids => [],
                :offices_attributes => [
                    :id,
                    :ord,
                    :title,
                    :addr,
                    :gps,
                    :tel,
                    :site,
                    :email,
                    :_destroy,
                    :region_ids => []
                ]

  config.batch_actions = false
  config.sort_order = 'ord_asc'
  before_filter :skip_sidebar!, :only => :index

  index do
    id_column
    column :ord
    column :title do |dealer|
      dealer_col_title(dealer)
    end
    # column :site
    # column :email
    column :regions do |dealer|
      first_region(dealer)
    end
    column :offices do |dealer|
      ul_offices(dealer)
    end

    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do
      f.input :title
      f.input :ord
      f.input :site, hint: I18n.t('c80_push.active_admin.hints.dealer.site')
      f.input :email, hint: I18n.t('c80_push.active_admin.hints.dealer.email')
      f.input :regions,
              :as => :select,
              :input_html => {
                  :title => '',
                  :class => 'selectpicker',
                  :data => {
                      :size => 10,
                      :width => '600px'
                  },
                  :multiple => false
              },
              :include_blank => true
      f.input :presets,
              :as => :select,
              :collection => C80Push::Preset.all.map {|p| [p.title, p.id]},
              # :collection => C80Push::Preset.all.map { |p|
              #   "<option value='#{p.id}'>#{p.title}</option>".html_safe
              # },
              # :collection => "<option></option>",
              :input_html => {
                  :title => '',
                  :class => 'selectpicker',
                  :data => {
                      :size => 10,
                      :width => '600px'
                  },
                  :multiple => false
              },
              :include_blank => true,
              :hint => "<a href='https://tech.yandex.ru/maps/doc/jsapi/2.1/ref/reference/option.presetStorage-docpage/' target='_blank'>Справка по цветам</a>".html_safe

      f.has_many :offices,
                 :allow_destroy => true,
                 :heading => I18n.t('activerecord.models.office.other') do |office|
        office.input :title
        office.input :ord
        office.input :addr
        office.input :gps
        office.input :tel, hint: I18n.t('c80_push.active_admin.hints.office.tel')
        office.input :site, hint: I18n.t('c80_push.active_admin.hints.office.site')
        office.input :email, hint: I18n.t('c80_push.active_admin.hints.office.email')
        office.input :regions,
                :as => :select,
                :input_html => {
                    :title => '',
                    :class => 'selectpicker',
                    :data => {
                        :size => 10,
                        :width => '600px'
                    },
                    :multiple => false
                },
                :include_blank => true
      end

    end

    f.actions
  end

end