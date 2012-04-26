require 'rails'

module MountDoc
  autoload :VERSION, "mount_doc/version"
  autoload :Config, "mount_doc/config"
  autoload :Document, "mount_doc/document"
end

require 'mount_doc/rails'
require 'mount_doc/rails/generators'
