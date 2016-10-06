module Graphics
  module Conversions
    
    #функция конвертер объектов в класс Point
    def Point *args
      first_arg = args.first
      convertible_to_point = Proc.new {|arg| arg.respond_to? :to_point}

      case first_arg
        when convertible_to_point then first_arg.to_point 
        when Point then first_arg
        when Array then Point.new(*first_arg.to_a)
        when String
          if first_arg.match /^\d+:\d+$/
            Point.new(*first_arg.split(':').map(&:to_i))
          else
            raise ArgumentError, "No implicit conversion for #{args.first} to Point"
          end
        when Hash
          x = first_arg[:x].to_i if first_arg.key? :x
          y = first_arg[:y].to_i if first_arg.key? :y
          Point.new(x,y)
        else
          raise ArgumentError, "No implicit conversion for #{args.first} to Point"
      end
    end

    Point = Struct.new(:x,:y) do
      def inspect
        "#{x}:#{y}"
      end
    end

    class ColoredPoint < Point
      def initialize x, y, color
        super x, y
        @color = color
      end

      def to_point
        Point.new(self.x,self.y)
      end
    end
  end
end

include Graphics
include Graphics::Conversions

p Point([21,22])
p Point("21:34")
p Point(Point.new(10,20))
p Point({x:1, y:2})
p Point(ColoredPoint.new(15,25,:red))
p Point('x-1,y-2')
