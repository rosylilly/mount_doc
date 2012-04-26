require 'spec_helper'

describe MountDoc::Engine do
  it('config.mount_doc == MountDoc::Config'){
    MountDoc::Engine.config.mount_doc.should == MountDoc::Config
  }
end
