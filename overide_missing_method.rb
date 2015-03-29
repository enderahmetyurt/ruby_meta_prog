# Overriding

class Rubyist
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

ender = Rubyist.new
ender.is_elegan?('a', 'b') do; end
