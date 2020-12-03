module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.first
        array.each { |el| max = el if el > max }
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        binnary_search(array, query, 0, array.size)
      end

      def binnary_search(array, query, left, right)
        mid = (left + right) / 2
        return mid if array[mid] == query
        return -1 if left == right
        return binnary_search(array, query, mid + 1, right) if array[mid] < query

        binnary_search(array, query, left, mid)
      end
    end
  end
end
