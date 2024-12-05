class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
    @current_player = "X"
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board

    until game_over?
      take_turn
      display_board
      switch_player
    end

    if winner
      puts "Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end

  private

  def display_board
    puts "\n"
    @board.each_with_index do |row, i|
      puts row.map { |cell| cell.empty? ? " " : cell }.join(" | ")
      puts "---+---+---" unless i == 2
    end
    puts "\n"
  end

  def take_turn
    puts "Player #{@current_player}, it's your turn."
    row, col = nil, nil

    loop do
      print "Enter your move as 'row,col' (e.g., 1,2): "
      input = gets.chomp
      row, col = input.split(",").map(&:to_i)

      if valid_move?(row, col)
        @board[row][col] = @current_player
        break
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == " "
  end

  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
  end

  def game_over?
    winner || draw?
  end

  def winner
    # Check rows, columns, and diagonals
    lines = @board + @board.transpose + diagonals
    lines.each do |line|
      return "X" if line.all? { |cell| cell == "X" }
      return "O" if line.all? { |cell| cell == "O" }
    end
    nil
  end

  def diagonals
    [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[0][2], @board[1][1], @board[2][0]],
    ]
  end

  def draw?
    @board.flatten.none? { |cell| cell == " " }
  end
end

# Start the game
TicTacToe.new.play

