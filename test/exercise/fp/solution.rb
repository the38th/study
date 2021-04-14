module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def film_rated?(film)
        return false if film['rating_kinopoisk'].nil?

        film['rating_kinopoisk'].to_f.positive?
      end

      def film_multicountry?(film)
        return false if film['country'].nil?

        film['country'].split(',').size >= 2
      end

      def rating(array)
        multicountry_rated_films = array.select { |film| film_rated?(film) && film_multicountry?(film) }
        multicountry_rated_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / multicountry_rated_films.size
      end

      def film_rated_enough?(film, threshold)
        return false if film['rating_kinopoisk'].nil?

        film['rating_kinopoisk'].to_f > threshold
      end

      def count_of_i_letter(film_name)
        sum = 0
        film_name.each_char { |char| sum += 1 if char == 'и' }
        sum
      end

      def chars_count(films, threshold)
        top_rated_films = films.select { |film| film_rated_enough?(film, threshold) }
        top_rated_films.reduce(0) { |sum, film| sum + count_of_i_letter(film['name']) }
      end
    end
  end
end
