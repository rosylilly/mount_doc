require 'spec_helper'

describe ActionDispatch::Routing::RouteSet do
  before {
    MountDoc::Config.defaults!
    MountDoc::Config.auto_mount = true

    Rails.application.reload_routes!
  }

  it "auto mounted MountDoc" do
    route = Rails.application.routes.named_routes.get(:mount_doc_rails_engine)
    route.should_not be_nil
    route.app.should == MountDoc::Rails::Engine
  end
end
