require 'mount_doc'

class MountDoc::Rails::Engine < ::Rails::Engine
  config.mount_doc = MountDoc::Config
end
