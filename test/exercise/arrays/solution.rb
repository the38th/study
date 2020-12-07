module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        array.map { |el| el.positive? ? max : el }
      end

      def find_max(array)
        max = array.first
        array.each { |el| max = el if el > max }
        max
      end

      def search(array, query)
        binary_search(array, query, 0, array.size)
      end

      def binary_search(array, query, left, right)
        mid = (left + right) / 2
        return mid if array[mid] == query
        return -1 if left == right
        return binary_search(array, query, mid + 1, right) if array[mid] < query

        binary_search(array, query, left, mid)
      end
    end
  end
end
