require 'mount_doc'

module MountDoc
  module MountDocHelper
    extend ::Rails.application.routes.url_helpers
    extend ::Rails.application.routes.mounted_helpers

    def mount_doc_config
      MountDoc::Config
    end

    def doc_dir
      @doc_dir ||= File.expand_path(mount_doc_config.doc_file_path, ::Rails.application.root)
    end

    def files
      @files ||= Dir[File.join(doc_dir, '**/*')].reject { |fn|
        File.directory?(fn)
      }.map { |fn|
        fn.sub(%r{^#{doc_dir}/},'')
      }
    end

    HTTP_Methods = [
      :GET,
      :POST,
      :PUT,
      :DELETE
    ].join("\n")
    def routes
      @routes ||= ::Rails.application.routes.routes.to_a.select { |route|
        controllers.include?(route.defaults[:controller].to_s)
      }.map {|route|
        method = HTTP_Methods.match(route.verb).to_s
        method = 'ANY' if method.empty?
        {
          method: method,
          path: route.path.spec
        }.merge(route.defaults)
      }
    end

    def controllers
      @controllers ||= begin
        Dir[File.join(::Rails.application.root, 'app/controllers/**/*_controller.rb')].map { |cn|
          File.basename(cn, '_controller.rb')
        }
      end
    end

    def models
      @models ||= begin
        Dir[File.join(::Rails.application.root, 'app/models/**/*.rb')].map { |cn|
          File.basename(cn, '.rb')
        }
      end
    end
  end
end
