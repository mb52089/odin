module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i+=1
    end
    self
  end

  def my_select
    array = []
    self.my_each {|x| array.push(x) if yield(x)}
    array
  end

  def my_all?
    result = true
    self.my_each {|x| result = false unless yield(x)}
    result
  end

  def my_any?
    result = false
    self.my_each {|x| result = true unless yield(x) == (false || nil)}
    result
  end

  def my_none?
    if block_given?
      result = true
      self.my_each {|x| result = false unless yield(x) == (false || nil)}
      result
    else
      result = true
      self.my_each {|x| result = false unless x == (false || nil)}
      result
    end
  end

  def my_count
    result = 0
    if block_given?
      self.my_each {|x| result+=1 if yield(x)}
    else
      result = self.length
    end
    result
  end

  def my_map
    i = 0
    new_array = []
    while i < self.size
      new_array << yield(self[i])
      i+=1
    end
    return new_array
  end

  def my_inject(arg = 0)
    if block_given?
      self.my_each {|x| arg = yield(arg, x)}
      arg
    else
      "I don't know how to handle a symbol here"
    end
  end

  def multiply_els arr
    arr.my_inject {|product, n| product * n }
  end


end
