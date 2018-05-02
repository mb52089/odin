module Caesar
  def cipher(str,n)
    (str.chars.map do |char|
      # n.times { char.next! } if /[A-Za-z]/.match(char)
      char.match(/[A-Za-z]/) {n.times {char.next!}}
      char
    end).join
  end
end