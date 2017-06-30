require 'rails/generators/base'
require 'rails/generators/resource_helpers'

module C80Push
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_root_folder
      #   empty_directory 'app/helpers/c80_yax'
      end

      def copy_template_file
        template 'seeds/c80_push_02_fill_presets.rb',
                 File.join('db/seeds', 'c80_push_02_fill_presets.rb')
      end

    end
  end
end