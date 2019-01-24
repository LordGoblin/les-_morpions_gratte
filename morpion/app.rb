require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'application.rb'

#author = "max"
#content = "blabla"

#my_gossip = Gossip.new("max", "blabla")
#puts "lol"
#my_gossip.save


Application.new.perform





#require 'scrapper.rb'
#allVille = Ville.new
#puts allVille.mairie


