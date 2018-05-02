
module Promptable
  def prompt(message = "Just the facts, ma'am.", symbol = ':> ')
      print message
      print symbol
      gets.chomp
  end
end

if __FILE__ == $PROGRAM_NAME
  include Promptable
  ephrase = []
  a = ('a'..'z').each.to_a
  phrase = prompt("Enter a phrase to encrypt").split("").each.to_a
  offset = prompt("Enter the offset").to_i
  (phrase.map do |l|
    if l == ' '
      ephrase << l
    elsif l == l.upcase
      ephrase << a[((a.index(l.downcase) + offset) % 26)].upcase
    else
      ephrase << a[((a.index(l) + offset) % 26)]
    end
  end).join

end