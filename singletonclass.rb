# 1
class Ender
  def naber
    puts "naber?"
  end
end

# puts Ender.new.naber

# 2
# my_class = Ender.new
# e = my_class
# puts e.naber


# 3
# puts "Öncesi #{self}"

# class Ender
#   puts "İçerisi #{self}"
#   def naber
#     puts "naber?"
#   end
# end

# puts "Sonrası #{self}"

# 4
var = class Ender
  def naber
    puts "naber?"
  end

  self
end

e = var.new
puts e.naber