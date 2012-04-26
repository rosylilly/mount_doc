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

  describe :auto_mount_path do
    subject { MountDoc::Config.auto_mount_path }

    it("default: /doc"){ should == '/doc' }

    it('writable string'){
      MountDoc::Config.auto_mount_path = 1
      should == '1'
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

  describe :doc_file_path do
    subject{ MountDoc::Config.doc_file_path }
    
    it("default: 'doc'"){ should == 'doc' }
  end

  describe :defaults! do
    subject{ MountDoc::Config }

    it("set default"){ 
      subject.visible_protected_methods = true
      subject.defaults!
      subject.visible_protected_methods.should be_false
    }
  end
end
