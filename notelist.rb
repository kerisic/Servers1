require 'socket'
require 'sinatra'
require_relative 'note'

server = TCPServer.new(2340)

socket = server.accept

socket.puts "Hello there! What would you like to do?"
socket.puts "For new note list, type 'list'"
socket.puts "For adding a note, type 'add'"
socket.puts "To view your note list, type 'view'"

user_input = socket.gets.chomp

while user_input != 'quit'
  if user_input == 'list'
      note = NoteList.new
  elsif user_input == 'add'
      socket.puts "Enter your message"
      message = socket.gets.chomp
      note.add_note(message)
  elsif user_input == 'view'
      socket.puts "#{note.list}"
  else
      socket.puts "that's not right, type 'quit to quit'"
  end
  socket.puts "What else do you want to do?"
  user_input = socket.gets.chomp
end

socket.close
