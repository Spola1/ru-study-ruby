module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        films = _array.select { |film| !film['country'].nil? && film['country'].split(',').length >= 2 && film['rating_kinopoisk'].to_f.positive? }
        rating = films.reduce(0) { |total, film| total += film['rating_kinopoisk'].to_f }
        rating / films.length
      end

      def chars_count(_films, _threshold)
        films_rait_sel = _films.select { |film| film['rating_kinopoisk'].to_f >= _threshold }
        films_rait_sel.map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
