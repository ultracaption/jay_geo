$:.unshift(File.join(File.dirname(__FILE__), '../app'))
ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

Dir['./app/**/*.rb'].each { |f| require f }

require File.join(File.dirname(__FILE__), 'application')
