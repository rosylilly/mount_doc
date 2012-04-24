# -*- coding: utf-8 -*-
require 'mount_doc/rails/generators'

class MountDoc::Generators::InitializeGenerator < Rails::Generators::Base
end if Rails.const_defined?(:Generators)
