require File.expand_path(File.dirname(__FILE__) + '/config/boot')
require 'logger'

log_file = File.new("log/#{ENV['RACK_ENV']}.log", 'a+')
log_file.sync = true

use Rack::CommonLogger, log_file

run JayGeo::App
