module Exercise
  module Fp2
    class MyArray < Array
      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?
        first, *rest = self
        yield first
        MyArray.new(rest).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) do |acc, el|
          acc << yield(el)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) do |acc, el|
          el.nil? ? acc : acc << el
        end
      end

       # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block);
        return acc if self.empty?
        if acc.nil?
          acc, first, *rest = self
        else
          first, *rest = self
        end
        acc = yield acc, first
        MyArray.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
