#!/ usr/ bin/ env ruby

require 'colorize'
require 'colorized_string'

module Promptable
  def prompt(message = "Just the facts, ma'am.", symbol = ':> ')
      print message
      print symbol
      gets.chomp
  end
end

module Menu
  def menu
      puts "Select a peg color:"
      puts "1) Red".colorize(:red)
      puts "2) Blue".colorize(:blue)
      puts "3) Green".colorize(:green)
      puts "4) Cyan".colorize(:cyan)
      puts "5) Purple".colorize(:magenta)
      puts "6) Yellow".colorize(:yellow)
  end

  def show
    menu
  end
end

class Game
  attr_accessor :pick, :guesses
  def initialize
    @pick = []
    @guesses = Hash.new
    @win = false
    @colors = {1 => "R", 2 => "B", 3 => "G", 4 => "C", 5 => "P", 6 => "Y"}
    @color_codes = {1 =>:red, 2 => :blue, 3 => :green, 4 => :cyan, 5 => :magenta, 6 => :yellow}
    @valid_input = ["1","2","3","4","5","6"]
  end

  # the computer picks 4 colored pegs in a specific order, for the player to guess
  def make_pick
    while @pick.length < 4
      try_pick = (rand(6) + 1)
      unless @pick.include?(try_pick.to_s)
        @pick.push(try_pick.to_s)
      end
    end
  end

  # the guesses array is used to build the board, and to store guesses for display
  def initialize_guesses_array
    (1..12).each do |row|
      (1..4).each do |column|
        @guesses["#{row},#{column}"] = "*"
      end
    end
  end

  # show the 12-row board, with any guesses made and scoring information
  def show_board
    puts ""
    (1..12).each do |row|
      board_row = ""
      (1..4).each do |column|
        key = "#{row},#{column}"
        board_row += "#{guesses[key]} "
      end
      board_row += "#{@pick_report[row].split(//).sort_by{rand}.join}"
      puts board_row
    end
  end

  # a game consists of a maximum of 12 guesses
  def twelve_tries
    r = 1
    while r < 13 && winner? == false
      this_turn = turn(r)
      winner?(this_turn)
      correct_guesses?(this_turn, r.to_s)
      r += 1
    end
  end

  # this method allows game play by calling the other methods in correct order
  def play_games
    play_again = "Y"
    while play_again != "N"
      initialize_guesses_array
      @pick_report = {1=>'', 2=>'', 3=>'', 4=>'', 5=>'', 6=>'', 7=>'', 8=>'', 9=>'', 10=>'', 11=>'', 12=>''}
      make_pick
      twelve_tries
      win_result = (@win == true ? "You won" : "You Lost")
      puts win_result
      play_again = prompt("play again?  Y or N").upcase
      if ["Y", "N"].include?(play_again)
        if play_again == "Y"
          @pick = []
          @win = false
          @guesses = {}
        else
          puts "Thanks for playing!"
        end
      else
        puts "\nInvalid Input.  Try again"
      end
    end
  end

  # this method represents what happens during a single turn (one row)
  def turn(row, column = 1)
    this_guess = Array.new
    show_board
    while column < 5
      key = "#{row},#{column}"
      puts "\n Enter the color for row #{row} column #{column}:"
      peg = prompt(menu)
      if @valid_input.include?(peg)
        @guesses[key] = peg
        this_guess.push(peg)
        column +=1
      else
        puts "\ninvalid input. try again"
      end  
    end
    return this_guess
  end

  # did you win with this guess?
  def winner?(this_guess=[])
    if @pick == this_guess
      @win = true
    end
    @win
  end

  # keep track of correct color and correct position, and display colors of guesses
  def correct_guesses?(this_guess=[], row)
    print @pick
    print this_guess
    this_guess.each_with_index do |x, i|
      position = (i + 1).to_s
      @guesses["#{row},#{position}"] = @colors[x.to_i].colorize(@color_codes[x.to_i])
      if @pick.include?(x)
        if @pick.index(x) == this_guess.index(x) 
          @pick_report[row.to_i].concat("X")
        else
          @pick_report[row.to_i].concat("O")
        end
      end
    end
  end
end


include Promptable
include Menu
game = Game.new()
game.play_games


