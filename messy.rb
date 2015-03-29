# Paolo Perrotta, Metaprogramming Ruby 2 s.46,53,54

class DS
  def initialize
  end

  def get_cpu_info(workstation_id)
    "2.9 Ghz quad-core"
  end

  def get_cpu_price(workstation_id)
    120
  end
  
  def get_mouse_info(workstation_id)
    "Wireless Touch"
  end
  
  def get_mouse_price(workstation_id)
    60
  end
  
  def get_keyboard_info(workstation_id)
    "Standard US"
  end
  
  def get_keyboard_price(workstation_id)
    20
  end

  def get_display_info(workstation_id)
    "LED 1980x1024"
  end

  def get_display_price(workstation_id)
    150
  end
end

# Messy

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
  
  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_mouse_price(@id)
    result = "Mouse: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
  
  def cpu
    info = @data_source.get_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    result = "Cpu: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
  
  def keyboard
    info = @data_source.get_keyboard_info(@id)
    price = @data_source.get_keyboard_price(@id)
    result = "Keyboard: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end

my_computer = Computer.new(42, DS.new)
puts my_computer.cpu


# Dynamic

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
  
  def mouse
    component :mouse
  end 
 
  def cpu
    component :cpu
  end 
 
  def keyboard
    component :keyboard
  end 
 
  def component(name)
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end

my_computer = Computer.new(42, DS.new)
puts my_computer.cpu


# More Dynamic

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end
  
  define_component :mouse
  define_component :cpu
  define_component :keyboard
end

my_computer = Computer.new(42, DS.new)
puts my_computer.cpu