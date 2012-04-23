require 'mount_doc'

module MountDoc::Config
  mattr_reader :auto_mount
  @@auto_mount = false

  def self.auto_mount=(bool)
    @@auto_mount = !!bool
  end
  def self.auto_mount?; @@auto_mount; end

  mattr_reader :visible_private_methods
  @@visible_private_methods = false

  def self.visible_private_methods=(visible)
    @@visible_private_methods = !!visible
  end
  def self.visible_private_methods?; @@visible_private_methods; end

  mattr_reader :visible_protected_methods
  @@visible_protected_methods = false

  def self.visible_protected_methods=(visible)
    @@visible_protected_methods = !!visible
  end
  def self.visible_protected_methods?; @@visible_protected_methods; end

  Components = [
    :files,
    :urls,
    :controllers,
    :models
  ]
  mattr_reader :visible_components
  @@visible_components = Components
  def self.visible_components=(components)
    components.select!{|component| Components.include?(component) }
    @@visible_components = components
  end
end
