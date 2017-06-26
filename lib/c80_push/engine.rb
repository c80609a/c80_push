module C80Push
  class Engine < ::Rails::Engine
    config.i18n.load_path += Dir[config.root.join('config', 'locales', '*','*.{yml}').to_s]
    isolate_namespace C80Push

    initializer :c80_push_engine do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths += Dir["#{config.root}/app/helpers/**/"]
        ActiveAdmin.application.load_paths += Dir["#{config.root}/app/models/**/"]
        #ActiveAdmin.application.load_paths += Dir["#{config.root}/app/models/concerns/**/"]
        ActiveAdmin.application.load_paths += Dir["#{config.root}/app/admin/c80_push/**/"]
        # ActiveAdmin.application.load_paths += Dir["#{config.root}/app/jobs/**/"]
      end
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end    
    
  end
end
