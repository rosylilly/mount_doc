require 'mount_doc'

module MountDoc::Config
  mattr_reader :auto_mount
  def auto_mount=(bool)
    @@auto_mount = !!bool
  end
  module_function :auto_mount=
  def auto_mount?; @@auto_mount; end
  module_function :auto_mount?
  mattr_reader :auto_mount_path
  def auto_mount_path=(path)
    @@auto_mount_path = path.to_s
  end
  module_function :auto_mount_path=

  mattr_reader :visible_private_methods
  def visible_private_methods=(visible)
    @@visible_private_methods = !!visible
  end
  module_function :visible_private_methods=
  def visible_private_methods?; @@visible_private_methods; end
  module_function :visible_private_methods?

  mattr_reader :visible_protected_methods
  def visible_protected_methods=(visible)
    @@visible_protected_methods = !!visible
  end
  module_function :visible_protected_methods=
  def visible_protected_methods?; @@visible_protected_methods; end
  module_function :visible_protected_methods?

  Components = [
    :files,
    :urls,
    :controllers,
    :models
  ]
  mattr_reader :visible_components
  def visible_components=(components)
    components.select!{|component| Components.include?(component) }
    @@visible_components = components
  end
  module_function :visible_components=

  mattr_reader :doc_file_path
  def doc_file_path=(path)
    @@doc_file_path = path.to_s
  end
  module_function :doc_file_path=

  mattr_reader :markup
  def markup=(path)
    @@markup = path.to_s
  end
  module_function :markup=

  DefaultSettings = {
    auto_mount: false,
    auto_mount_path: '/doc',
    visible_private_methods: false,
    visible_protected_methods: false,
    visible_components: Components,
    doc_file_path: 'doc',
    markup: :rdoc
  }
  def defaults!
    DefaultSettings.each_pair do | name, val |
      self.send("#{name}=", val)
    end
  end
  module_function :defaults!

  self.defaults!
end
