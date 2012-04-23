require 'spec_helper'

describe MountDoc::Config do
  describe :auto_mount do
    subject{ MountDoc::Config.auto_mount? }
    it("default: false"){ should be_false }

    it("writable boolean"){
      MountDoc::Config.auto_mount = 1
      should be_true
    }
  end

  describe :visible_private_methods do
    subject{ MountDoc::Config.visible_private_methods? }

    it("default: false"){ should be_false }

    it("writable boolean"){
      MountDoc::Config.visible_private_methods = 1
      should be_true
    }
  end

  describe :visible_protected_methods do
    subject{ MountDoc::Config.visible_protected_methods? }

    it("default: false"){ should be_false }

    it("writable boolean"){
      MountDoc::Config.visible_protected_methods = 1
      should be_true
    }
  end

  describe :visible_components do
    subject{ MountDoc::Config.visible_components }

    it("default: MountDoc::Config::Components"){ should == MountDoc::Config::Components }

    it("writable MountDoc::Config::Components"){
      MountDoc::Config.visible_components = [:urls, :invalid, :controllers]
      should == [:urls, :controllers]
    }
  end
end
