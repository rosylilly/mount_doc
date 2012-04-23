require 'rubygems'
require 'bundler/setup'
require 'rails'

ENV['RAILS_VERSION'] ||= Rails.version

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path(
  "../mock/rails_#{ENV['RAILS_VERSION']}/config/environment",
  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do | config |
end
