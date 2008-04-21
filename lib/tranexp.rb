$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

$KCODE='u'

module Tranexp; end

require "fileutils"

begin
  require 'mechanize'
rescue LoadError
  require 'rubygems'
  gem 'mechanize', '>=0.7.5'
  require 'mechanize'
end

require "tranexp/codes"
require "tranexp/http"
require "tranexp/cache"
require "tranexp/translate"