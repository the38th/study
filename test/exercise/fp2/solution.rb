module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&blk)
        return self if empty?

        head, *tail = self
        tail = MyArray.new(tail)
        blk.call(head)
        tail.my_each(&blk)
        self
      end

      # Написать свою функцию my_map
      def my_map(&blk)
        new_arr = MyArray.new
        my_reduce(new_arr) { |acc, el| acc << blk.call(el) }
        new_arr
      end

      # Написать свою функцию my_compact
      def my_compact
        new_arr = MyArray.new
        my_reduce(new_arr) do |acc, el|
          acc << el unless el.nil?
          acc
        end
        new_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &blk)
        return acc if empty?

        if acc.nil?
          acc, *tail = self
        else
          tail = self
        end
        tail = MyArray.new(tail)
        tail.my_each { |el| acc = blk.call(acc, el) }
        acc
      end
    end
  end
end
