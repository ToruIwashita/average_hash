# coding: utf-8
if ENV['CI']
  require 'coveralls'
  Coveralls.wear!

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[Coveralls::SimpleCov::Formatter]
  SimpleCov.start 'test_frameworks'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'average_hash'

def fixture_file_path(file)
  File.join(File.dirname(__FILE__), 'fixtures', file)
end
