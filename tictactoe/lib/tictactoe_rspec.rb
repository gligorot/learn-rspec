class Board
  attr_accessor :one, :two, :board, :filler

  def initialize(one, two, *filler) #tested
    @one = Player.new(one, "X")
    @two = Player.new(two, "O")


    @board = Array.new(3) {Array.new(3){Cell.new(filler)}}
  end

  class Player #tested indirectly
    attr_reader :name, :color

    def initialize(name, color)
      @name = name
      @color = color #add only X/0 later
    end
  end

  class Cell #tested indirectly
    attr_accessor :symbol #basic symbol, make it empty when generating board later #change later to reader unless needed
    def initialize(symbol="")
      @symbol = symbol
    end
  end

  def print_board #tested
    @board.each do |row|
      puts row.map { |cell| cell.symbol.empty? ? "_": cell.symbol }.join(" ")
      #if it was called value, it would be cell.value
    end
  end

  def print_legend
    puts "LEGEND"
    puts "1 2 3"
    puts "4 5 6"
    puts "7 8 9"
    puts "------"
  end

  def pick_cell(row, col) #tested indirectly
    @board[row][col]
  end

  def set_cell(row, col, color) #tested
    pick_cell(row, col).symbol = color
  end

  def check_full(row, col) #tested
    raise ArgumentError if pick_cell(row, col).symbol == @two.color || pick_cell(row, col).symbol == @one.color
  end

  def win_check #tested
    win_terms = [
      #horizontal
      ["1","2","3"],
      ["4","5","6"],
      ["7","8","9"],
      #vertical
      ["1","4","7"],
      ["2","5","8"],
      ["3","6","9"],
      #diagonal
      ["1","5","9"],
      ["3","5","7"]
    ]

    win_terms.any? do |term|

      result = term.map do |x|
        row, col = get_move(x)
        pick_cell(row, col).symbol
      end

      result.all? {|x| x == result[0] && (x == @one.color || x == @two.color)}
    end

  end

  def draw_check #tested
    @board.all? do |row|
      row.all? {|cell| cell.symbol.empty? != true}
    end
  end


  def switch_players
    @one, @two = @two, @one
  end

  def next_move
    puts "#{one.name}, it's your turn with color #{one.color}. Enter a number from 1-9!"
  end

  def get_move(move = gets.chomp)
    move_to_coor(move)
  end

  def move_to_coor(move)
    mapping = {
    "1" => [0, 0],
    "2" => [0, 1],
    "3" => [0, 2],
    "4" => [1, 0],
    "5" => [1, 1],
    "6" => [1, 2],
    "7" => [2, 0],
    "8" => [2, 1],
    "9" => [2, 2]
    }
    mapping[move]
  end

  def play
    print_legend
    puts "START"
    while true
      print_board
      if win_check == true
        puts "GAME OVER, #{@two.name.upcase} WINS!!!"
        return
      elsif win_check == false && draw_check == true
        puts "DRAW, NO WINNERS :("
        return
      end
      puts next_move
      begin
        row, col = get_move
        check_full(row, col)
      rescue
        puts "The position is full or the input is not valid, please try again!"
        retry
      end
      set_cell(row, col, @one.color)
      switch_players
    end
  end

end

#board  = Board.new("Gligor", "Evgenija")

#board.play
