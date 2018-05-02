if __FILE__ == $PROGRAM_NAME
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  phrase = "Howdy partner, sit down! How's it going?"
  result = Hash.new(0)
  word = phrase.downcase.split(" ").to_a
  dictionary.each do |dc|
    word.each do |wd|
      result[dc] += 1 if wd.include?(dc)
    end
  end
  puts result
end
