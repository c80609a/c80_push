ActiveAdmin.register C80Push::Region, as: 'Region' do

  menu :label => proc{ I18n.t('c80_push.active_admin.menu.region')},
       :parent => 'x_c80_push',
       :priority => 2

  permit_params :title,
                :ord,
                :office_ids => [],
                :dealer_ids => []

  config.batch_actions = false
  config.sort_order = 'ord_asc'
  before_filter :skip_sidebar!, :only => :index

  index do
    id_column
    column :title
    column :ord
    column :offices do |region|
      ul_offices(region)
    end
    column :dealers do |region|
      ul_dealers(region)
    end

    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do
      f.input :title
      f.input :ord
      f.input :offices, :as => :check_boxes
      f.input :dealers, :as => :check_boxes
    end

    f.actions
  end

end