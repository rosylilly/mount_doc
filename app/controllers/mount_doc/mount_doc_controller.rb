require 'mount_doc'
require 'slim'

module MountDoc
  class MountDocController < ApplicationController
    layout 'mount_doc'
    
    def index
      @page_title = 'Index'
    end

    def controller_doc

    end

    def model_doc

    end

    def file_doc
      
    end
  end
end
