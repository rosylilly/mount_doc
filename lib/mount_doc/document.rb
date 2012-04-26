require 'mount_doc'
require 'yard'

YARD::Tags::Library.define_tag "Response", :response, :with_title_and_text

class MountDoc::Document
  attr_reader :type, :name, :doc_object

  def initialize(type, name)
    @type = type
    @name = name

    load_file
  end

  def load_file(type = @type, name = @name)
    case type
    when :controller
      load_controller(name)
    when :model
      load_model(name)
    end
  end

  def load_controller(name)
    controller_name = name.gsub('::', '/').camelize + 'Controller'
    file_path = File.join(::Rails.root, 'app/controllers', "#{controller_name.underscore}.rb")
    YARD.parse(file_path)
    @doc_object = P(controller_name)
  end

  def load_model(name)
    model_name = name.gsub('::', '/').camelize
    file_path = File.join(::Rails.root, 'app/models', "#{model_name.underscore}.rb")
    YARD.parse(file_path)
    @doc_object = P(model_name)
  end
end
