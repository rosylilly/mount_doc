require 'rubygems'
require 'bundler/setup'
require 'spork'
require 'rails'

if RUBY_PLATFORM.downcase.include?("darwin")
  require 'growl'
end

Spork.prefork do
  ENV['RAILS_VERSION'] ||= Rails.version

  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path(
    "../mock/rails_#{ENV['RAILS_VERSION']}/config/environment",
    __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  RSpec.configure do | config |
    config.include ActiveSupport::Testing::Assertions
  end
end

Spork.each_run do
  if Spork.using_spork?
    Rails.application.reload_routes!

    ActiveSupport::DescendantsTracker.clear
    ActiveSupport::Dependencies.clear

    ActiveRecord::Base.instantiate_observers
  end
end
