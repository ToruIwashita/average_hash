# coding: utf-8
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'average_hash'

def fixture_file_path(file)
  File.join(File.dirname(__FILE__), 'fixtures', file)
end
