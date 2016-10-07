module Some
  module Complicated
    module ThirdParty
      class Object
        attr_reader :a, :b, :c
        attr_accessor :internal_ary

        def initialize a, b ,c
          @a, @b, @c = a, b, c
          self.internal_ary = [a,b,c]
        end

        def add_values_to_internal_ary_interface values
          self.internal_ary.concat values
        end
      end
    end
  end
end

class AryAdapter < DelegateClass(Some::Complicated::ThirdParty::Object)
  def << values
    add_values_to_internal_ary_interface values
  end
end