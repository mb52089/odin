#!/ usr/ bin/ env ruby

module Promptable
  def prompt(message = "Just the facts, ma'am.", symbol = ':> ')
      print message
      print symbol
      gets.chomp
  end
end

class Board
  attr_accessor :bd_hash, :player, :win
  def initialize
    @bd_hash = {[1,1]=>"*",[1,2]=>"*",[1,3]=>"*",[2,1]=>"*",[2,2]=>"*",[2,3]=>"*",[3,1]=>"*",[3,2]=>"*",[3,3]=>"*"}
    @player = "X"
    @win = false
  end

  def change_player
    case
    when self.player == "X"
      self.player = "O"
    when self.player == "O"
      self.player = "X"
    end  
  end

  def change_board(row, column)
    if self.bd_hash[[row.to_i, column.to_i]] == "*"
      @bd_hash[[row.to_i,column.to_i]] = self.player
      self.show_board
      self.change_player
    else
      prompt("Fat fingered it. Try again.  Press Enter to continue",'')
    end
  end

  def show_board
    puts " "
    puts " #{self.bd_hash[[1,1]]} | #{self.bd_hash[[1,2]]} | #{self.bd_hash[[1,3]]}"
    puts "___________"
    puts " #{self.bd_hash[[2,1]]} | #{self.bd_hash[[2,2]]} | #{self.bd_hash[[2,3]]}"
    puts "___________"
    puts " #{self.bd_hash[[3,1]]} | #{self.bd_hash[[3,2]]} | #{self.bd_hash[[3,3]]}"
  end

  def winner
    case
    when self.bd_hash[[1,1]] == self.bd_hash[[1,2]] && self.bd_hash[[1,2]] == self.bd_hash[[1,3]]
      if self.bd_hash[[1,1]] == "*" or self.bd_hash[[1,2]] == "*" or self.bd_hash[[1,3]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[2,1]] == self.bd_hash[[2,2]] && self.bd_hash[[2,2]] == self.bd_hash[[2,3]] 
      if self.bd_hash[[2,1]] == "*" or self.bd_hash[[2,2]] == "*" or self.bd_hash[[2,3]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[3,1]] == self.bd_hash[[3,2]] && self.bd_hash[[3,2]] == self.bd_hash[[3,3]] 
      if self.bd_hash[[3,1]] == "*" or self.bd_hash[[3,2]] == "*" or self.bd_hash[[3,3]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end 
    when self.bd_hash[[1,1]] == self.bd_hash[[2,1]] && self.bd_hash[[2,1]] == self.bd_hash[[3,1]] 
      if self.bd_hash[[1,1]] == "*" or self.bd_hash[[2,1]] == "*" or self.bd_hash[[3,1]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[1,2]] == self.bd_hash[[2,2]] && self.bd_hash[[2,2]] == self.bd_hash[[3,2]] 
      if self.bd_hash[[1,2]] == "*" or self.bd_hash[[2,2]] == "*" or self.bd_hash[[3,2]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[1,3]] == self.bd_hash[[2,3]] && self.bd_hash[[2,3]] == self.bd_hash[[3,3]]
      if self.bd_hash[[1,3]] == "*" or self.bd_hash[[2,3]] == "*" or self.bd_hash[[3,3]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[1,1]] == self.bd_hash[[2,2]] && self.bd_hash[[2,2]] == self.bd_hash[[3,3]]
      if self.bd_hash[[1,1]] == "*" or self.bd_hash[[2,2]] == "*" or self.bd_hash[[3,3]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    when self.bd_hash[[1,3]] == self.bd_hash[[2,2]] && self.bd_hash[[2,2]] == self.bd_hash[[3,1]]
      if self.bd_hash[[1,3]] == "*" or self.bd_hash[[2,2]] == "*" or self.bd_hash[[3,1]] == "*" then
        self.win = false
      else
        self.win = true
        self.change_player
      end
    end
  end

end

include Promptable
bd = Board.new()
until ['q'].include?(prompt("\nReady Player One? Press 'q' to quit, Enter to continue"))
  bd.show_board
  while bd.win == false 
    puts "\n#{bd.player} player's turn."
    row = prompt("\n Enter the row")
    column = prompt("\n Enter the column")
    bd.change_board(row, column)
    bd.winner
  end
  puts "\nPlayer #{bd.player} won!!!"
  bd = Board.new()
end
puts "\nGAME OVER"
puts " "








