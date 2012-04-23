require 'mount_doc'

module MountDoc::Config
  mattr_accessor :auto_mount
  @@auto_mount = false
  def self.auto_mount?; !!@@auto_mount; end
end
