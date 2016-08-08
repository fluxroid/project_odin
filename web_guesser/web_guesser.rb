require 'sinatra'
require 'sinatra/reloader'

num = rand(101)

get '/' do
  "the secret number is #{num}".upcase
end