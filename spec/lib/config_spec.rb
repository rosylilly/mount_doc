require 'spec_helper'

describe MountDoc::Config do
  its(:auto_mount?){ should be_false }
end
