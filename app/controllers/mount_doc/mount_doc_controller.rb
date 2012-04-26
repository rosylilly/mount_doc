require 'mount_doc'
require 'slim'
require 'github/markup'

module MountDoc
  class MountDocController < ApplicationController
    include MountDocHelper

    layout 'mount_doc'
    
    def index
      @page_title = 'Index'

      readme_file = Dir[File.join(::Rails.root, '/README.*')].first

      render text: GitHub::Markup.render(readme_file), layout: true
    end

    def controller_doc
      @controller_name = params[:id]

      file_name = File.join(::Rails.root, 'app/controllers', "#{@controller_name.gsub('::', '/')}_controller.rb")
      unless File.exists?(file_name)
        not_found
        return
      end

      @document = MountDoc::Document.new(:controller, @controller_name).doc_object
    end

    def action_doc
      @controller_name = params[:ctrl_id]
      @action_name = params[:id]

      file_name = File.join(::Rails.root, 'app/controllers', "#{@controller_name.gsub('::', '/')}_controller.rb")
      unless File.exists?(file_name)
        not_found
        return
      end

      @controller_document = MountDoc::Document.new(:controller, @controller_name).doc_object
      @document = @controller_document.meths.select{|meth| meth.name.to_s == @action_name.to_s }.first

      unless @document
        not_found
        return
      end
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
        not_found
        return
      end

    end

    private
    def not_found
      render :not_found, status: 404
    end
  end
end
