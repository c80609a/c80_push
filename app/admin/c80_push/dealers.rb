ActiveAdmin.register C80Push::Dealer, as: 'Dealer' do

  menu :label => proc{ I18n.t('c80_push.active_admin.menu.dealer')},
       :parent => 'x_c80_push',
       :priority => 1

  permit_params :title,
                :region_ids => [],
                :offices_attributes => [
                    :id,
                    :title,
                    :addr,
                    :gps,
                    :tel,
                    :site,
                    :_destroy,
                    :region_ids => []
                ]

  config.batch_actions = false
  config.sort_order = 'id_asc'
  before_filter :skip_sidebar!, :only => :index

  index do
    id_column
    column :title
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

      f.has_many :offices,
                 :allow_destroy => true,
                 :heading => I18n.t('activerecord.models.office.other') do |office|
        office.input :title
        office.input :addr
        office.input :gps
        office.input :tel
        office.input :site
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