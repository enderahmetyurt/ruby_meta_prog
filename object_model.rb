# Class
class Sport
end

# Subclass of Sport
class Football < Sport
end

# Object of Football
besiktas = Football.new

# Football < Sport < Object < BasicObject

# Class < Module < Object < BasicObject


# > number = 1
# => 1
# > 1.class
# => Fixnum
# > 1.class.class
# => Class
# > 1.class.superclass
# => Integer
# > 1.class.superclass.class
# => Class
# > 1.class.superclass.superclass
# => Numeric
# > 1.class.superclass.superclass.superclass
# => Object
# > 1.class.superclass.superclass.superclass.superclass
# => BasicObject
# > 1.class.superclass.superclass.superclass.superclass.superclass
# => nil