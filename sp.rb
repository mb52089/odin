def stock_picker(a=array)
  i1 = 0
  max = 0
  days = []
  a[(0..(a.length - 1))].each do |v1|
    i1 += 1
    i2 = i1 + 1
    a[(i1..a.length )].each do |v2|
      if (v2 - v1) > max then
        days = [(i1 - 1),(i2 - 1)] 
        max = (v2 - v1)
        puts "current max is #{max}"
        puts "current days are #{days}"
        puts 
      end
      i2 += 1
    end
  end
  return days
end

