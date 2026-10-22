import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains the expected films', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie firstMovie = movies[0];
      expect(firstMovie.id, 'interstellar');
      expect(firstMovie.title, 'Interstellar');
      expect(firstMovie.ticketPrice, 7.50);
      expect(firstMovie.posterImagePath, isNotEmpty);

      final Movie secondMovie = movies[1];
      expect(secondMovie.id, 'lion-king');
      expect(secondMovie.title, 'The Lion King');
      expect(secondMovie.ticketPrice, 7.50);
      expect(secondMovie.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('interstellar');

      expect(movie, isNotNull);
      expect(movie?.title, 'Interstellar');
      expect(movie?.ticketPrice, 7.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
