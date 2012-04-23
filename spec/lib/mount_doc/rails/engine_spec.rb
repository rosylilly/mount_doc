require 'spec_helper'

describe MountDoc::Rails::Engine do
  it('config.mount_doc == MountDoc::Config'){
    MountDoc::Rails::Engine.config.mount_doc.should == MountDoc::Config
  }
end
