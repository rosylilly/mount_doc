require 'mount_doc'
require 'slim'
require 'github/markup'

module MountDoc
  class MountDocController < ApplicationController
    layout 'mount_doc'
    
    def index
      @page_title = 'Index'

      readme_file = Dir[File.join(::Rails.root, '/README.*')].first

      render text: GitHub::Markup.render(readme_file), layout: true
    end

    def controller_doc

    end

    def model_doc

    end

    def file_doc
      file_name = params[:id]
      file_name += '.' + params[:format] if params.has_key?(:format)
      file_name = File.join(::Rails.root, MountDoc::Config.doc_file_path, file_name)

      if File.exists?(file_name)
        @page_title = File.basename(file_name)
        render text: GitHub::Markup.render(file_name), layout: true
      else
        render status: 404, nothing: true
      end

    end
  end
end
