require 'socket'

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = socket.gets.chomp

while they_said != "quit"
  socket.puts "You said: #{they_said}."
  they_said = socket.gets.chomp
end

socket.close
