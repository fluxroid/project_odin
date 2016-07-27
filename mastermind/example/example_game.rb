require_relative "../lib/mastermind.rb"

puts "Welcome to the MasterMind"
Steven = MasterMind::Player.new("Steven")
MasterMind::Game.new(Steven).play