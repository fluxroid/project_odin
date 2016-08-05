require 'socket'     

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)
s.puts "GET index.html HTTP/1.0"
while line = s.gets
  puts line.chop
end
s.close              