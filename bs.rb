#!/ usr/ bin/ env ruby

def bs(a)
  return a if a.length < 2
  swapped = true
  while swapped do
    swapped = false
    for counter in 0..a.length-2
      if a[counter] > a[counter + 1]
        a[counter], a[counter + 1] = a[counter + 1], a[counter]
        swapped = true
      end
    end
  end 
  return a  
end


a = [4,3,78,2,0,2]
p bs(a)
