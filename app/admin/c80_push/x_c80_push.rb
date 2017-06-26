ActiveAdmin.register_page 'x_c80_push' do
  menu :label => proc{ I18n.t("c80_push.active_admin.menu.core_item") },
       :priority => 3,
       :url => '#'
end