require 'mount_doc'

class MountDoc::Engine < ::Rails::Engine
  isolate_namespace MountDoc

  config.mount_doc = MountDoc::Config

  initializer "config.mount" do
  end
end
