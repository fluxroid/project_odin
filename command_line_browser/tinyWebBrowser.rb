require 'socket'
require 'json'

host = "localhost"
port = 2000

puts "Welcome to the tinyWebBrowser!"
printf "What would you like to do POST or GET? "
input = gets.upcase.chomp
until input == "GET" or input == "POST"
  printf "Would you like to POST or GET?"
  input = gets.upcase.chomp
end

case input
when "GET" then
  request = "GET /index.html HTTP/1.0\r\n\r\n"
when "POST" then
  printf "Enter a name: "
  name = gets.chomp
  printf "Enter an email: "
  email = gets.chomp

  hash = {viking: {name: name, email=>email}}
  hash_json = hash.to_json

  request = %{
POST /thanks.html HTTP/1.0
From: #{email}
Content-Type: application/json
Content-Length: #{hash_json.length}
\r\n\r\n#{hash_json}\r\n\r\n
  }
end

socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
puts headers =~ (/200 OK/) ? body : headers
socket.close

