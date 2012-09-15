require 'rails/generators/base'

module MountDoc
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "create initializer file for mount_doc."
      def copy_initializer
        template "initializer.rb", "config/initializers/mount_doc.rb"
      end
    end
  end
end
