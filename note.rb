
class NoteList

    attr_reader :list

  def initialize
  @list = []
  end

  def add_note(message)
    @list << message
  end

  def view
    socket.puts @list
  end

end
