require 'spec_helper'

describe MountDoc do
  it "defined Rails" do
    subject.const_defined?(:Rails).should be_true
  end

  describe MountDoc::Rails do
  end
end
