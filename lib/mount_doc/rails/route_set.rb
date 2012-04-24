require 'mount_doc'
require 'action_dispatch/routing/route_set'

class ActionDispatch::Routing::RouteSet
  def finalize_with_mount_doc!
    result = finalize_without_mount_doc!

    begin
      self.eval_block(lambda{
        mount MountDoc::Rails::Engine => MountDoc::Config.auto_mount_path
      }) if MountDoc::Config.auto_mount? && self.named_routes.get(:mount_doc_rails_engine).nil?

      true
    end

    result
  end
  alias_method_chain :finalize!, :mount_doc
end
