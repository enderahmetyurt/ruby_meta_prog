str = "just a regular string"

def str.title?
  self.upcase == self
end

puts str.title? # => false
puts str.methods.grep(/title?/) # => [:title?]
puts str.singleton_methods # => [:title?]
