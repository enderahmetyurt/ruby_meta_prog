# 1
# module HayvanModulu
#   def self.selam
#     'merhaba'
#   end
# end

# class At 
#   include HayvanModulu
# end

# puts At.selam

# 2
module HayvanModulu
  def selam
    'merhaba'
  end
end

class At
  puts self
  class << self
    include HayvanModulu
  end
end

puts At.selam
puts At.class
puts At.superclass
puts At.singleton_methods