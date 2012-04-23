require 'spec_helper'

describe MountDoc do
  it "defined Rails" do
    subject.const_defined?(:Rails).should be_true
  end

  describe MountDoc::Rails do
    subject { MountDoc::Rails }

    it "defined Engine of Rails::Engine subclass" do
      subject.const_get(:Engine).should be_kind_of Class
      MountDoc::Rails::Engine.superclass.should == ::Rails::Engine
    end
  end
end
