require 'socket'               # Get sockets from stdlib

server = TCPServer.new(2000)

loop do                          
  client = server.accept
  
  header = ""
  while line = client.gets
    header << line
    break if header =~ /\r\n\r\n$/
  end

  method = header.split[0]
  path = header.split[1][1..-1]

  if File.exist?(path)
    if method == "GET"
      response_body = (File.open(path, 'r')).read
      response_head = "HTTP/1.0 200 OK\n#{Time.now.ctime}\nContent-Length: #{response_body.length}\r\n\r\n"
    end
  else
    response_head = ("HTTP/1.0 404 Not Found\r\n\r\n")
    response_body = ("Sorry, file not found.")
  end

  client.puts(response_head)
  client.puts(response_body)
  client.close                 # Disconnect from the client
end