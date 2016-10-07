class ArrayInteractor
  include Enumerable

  def self.same a, b
    [a,b].all? {|elem| elem.is_a? Array } ? (a & b) : raise(ArgumentError, 'Non array arguments')
  end

  def self.difference a, b
    [a,b].all? {|elem| elem.is_a? Array } ? a - b | b - a : raise(ArgumentError, 'Non array arguments')
  end

  def initialize
    @array = (1..10).to_a
  end

  def get_even
    @array.select {|e| e % 2 == 0 }
  end

  def get_odd
    @array.reject {|e| e % 2 == 0 }
  end

  def multiply multiplicator
    multiplicator.kind_of?(Numeric) ? @array.map {|e| e*multiplicator} : raise(ArgumentError, 'multiplicator is not a numeric')
  end

  def numeric_values?
    @array.all? {|e| e.kind_of? Numeric}
  end

end

# select {|elem| condition }
# reject {|elem| condition }

# map :name #-> new mapped array
# map! :name #-> self mapped

# reduce :name #->
# reduce {|memo, var|}

# find(value)
# fetch(index)

# all?
# any?

# each {|elem| }
# each_with_index {|elem, index|}