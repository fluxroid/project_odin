require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
Sally = TicTacToe::Player.new({color: "X", name: "Sally"})
Carl = TicTacToe::Player.new({color: "O", name: "Carl"})
players = [Sally, Carl]
TicTacToe::Game.new(players).play