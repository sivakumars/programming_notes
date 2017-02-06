require 'socket'

def parse_request(request_line)
  http_method, path_params, http = request_line.split(" ")
  path, params = path_params.split("?")

  params_hash = (params || "").split("&").each_with_object({}) do |param, hash|
    key, value = param.split("=")
    hash[key] = value
  end
  [http_method, path, params_hash, path_params]
end

host = "localhost"
port = 3003

server = TCPServer.new(host, port)
loop do
  client = server.accept
  request_line = client.gets
  puts request_line

  next unless request_line

  http_method, path, params, path_params = parse_request(request_line)

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i

  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  client.puts "</body>"
  client.puts "</html>"

  client.close
end
