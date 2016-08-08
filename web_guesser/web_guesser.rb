require 'sinatra'
require 'sinatra/reloader'

number = rand(101)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess, number)
  if number - guess < 5 && number - guess > 0
    "Too low"
  elsif guess - number < 5 && guess - number > 0
    "Too high"
  elsif guess > number
    "Way too high!"
  elsif guess < number
    "Way too low!"
  else
    "You got it right!\nThe SECRET NUMBER is #{number}"
  end
end
    