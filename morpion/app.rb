require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'application.rb'

Application.new.perform