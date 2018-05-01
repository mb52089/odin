#!/ usr/ bin/ env ruby

def bubble_sort_by(a)
  return a if a.length < 2
  swapped = true
  while swapped do
    swapped = false
    for counter in 0..a.length-2
      if yield(a[counter], a[counter + 1]) > 0
        a[counter], a[counter + 1] = a[counter + 1], a[counter]
        swapped = true
      end
    end
  end 
  return a 
end

a = ["hi", "hello", "hey"]
print bubble_sort_by(a) {|left, right| left.length - right.length}
# print bubble_sort_by(a) {|x,y| x <=> y}
