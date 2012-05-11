require 'mount_doc'
require 'coderay'

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
        fn.sub(%r{^#{doc_dir}/},'').force_encoding('utf-8')
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

    def routes_for(controller, action)
      puts "#{controller}##{action}"
      _routes = routes.dup.select{ |route|
        route[:controller].to_s.to_sym == controller.to_s.to_sym && route[:action].to_s.to_sym == action.to_s.to_sym
      }
      _routes
    end

    def controllers
      @controllers ||= begin
        Dir[File.join(::Rails.application.root, 'app/controllers/**/*_controller.rb')].map { |cn|
          cn.sub(%r{_controller\.rb$}, '').sub(%r{^#{::Rails.application.root}/app/controllers/}, '')
        }
      end
    end

    def models
      @models ||= begin
        Dir[File.join(::Rails.application.root, 'app/models/**/*.rb')].map { |cn|
          cn.sub(%r{\.rb$}, '').sub(%r{^#{::Rails.application.root}/app/models/}, '')
        }
      end
    end

    def actions(class_doc)
      class_doc.meths.select{ |meth|
        meth.scope == :instance
      }.map{ |meth|
        { method: meth,
          routes: routes_for(@controller_name.gsub('::', '/'), meth.name)
        }
      }.select { |hash|
        hash[:routes].size > 0
      }
    end

    def markup(text)
      case MountDoc::Config.markup
      when :markdown
        markdown(text)
      else
        rdoc(text)
      end
    end

    def markdown(text)
      GitHub::Markup.render('tmp.markdown', text)
    end

    def rdoc(text)
      RDoc::Markup::ToHtml.new.convert(text)
    end

    def syntaxhighlight(lang, text)
      CodeRay.scan(text, lang.to_s.downcase.to_sym).html({
        css: :style,
        line_numbers: :inline
      })
    end
  end
end
