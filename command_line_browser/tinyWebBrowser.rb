require 'socket'

host = "localhost"
port = 2000
request = "GET /index.html HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
puts headers =~ (/200 OK/) ? body : headers
socket.close

