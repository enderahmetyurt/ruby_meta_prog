class Example
  def self.replace(array, original, replacement)
    array.map {|e| e == original ? replacement : e }
  end
end

array = [ "a", "b", "c", "d", "e" ]
puts Example.replace(array, 'a', 'c') # => ['c', 'b', 'c', 'd', 'e']


class Array
  def replace(original, replacement)
    self.map {|e| e == original ? replacement : e }
  end 
end

puts array.replace('a', 'c') # => ['c', 'b', 'c', 'd', 'e']