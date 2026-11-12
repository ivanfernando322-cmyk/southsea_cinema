import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-film',
        title: 'Test Film',
        synopsis: 'A film used for testing.',
        ageRating: 'PG',
        screeningTime: 'Monday 1 Jan 2027, 18:00',
        ticketPrice: 7.5,
        posterImagePath: 'assets/images/interstellar.jpg',
      );

      expect(movie.id, 'test-film');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A film used for testing.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Monday 1 Jan 2027, 18:00');
      expect(movie.ticketPrice, 7.5);
      expect(movie.posterImagePath, 'assets/images/interstellar.jpg');
    });

    test('formattedPrice shows two decimal places for pence', () {
      const movie = Movie(
        id: 'pence-film',
        title: 'Pence Film',
        synopsis: 'A film with pence in the price.',
        ageRating: 'PG',
        screeningTime: 'Monday 1 Jan 2027, 18:00',
        ticketPrice: 7.5,
        posterImagePath: 'assets/images/interstellar.jpg',
      );

      expect(movie.formattedPrice, '£7.50');
    });

    test('formattedPrice shows two decimal places for whole pounds', () {
      const movie = Movie(
        id: 'pound-film',
        title: 'Pound Film',
        synopsis: 'A film with a whole-pound price.',
        ageRating: 'PG',
        screeningTime: 'Monday 1 Jan 2027, 18:00',
        ticketPrice: 8,
        posterImagePath: 'assets/images/interstellar.jpg',
      );

      expect(movie.formattedPrice, '£8.00');
    });
    test('fromJson and toJson convert all fields', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'json-film',
        'title': 'Json Film',
        'synopsis': 'A film created from JSON.',
        'ageRating': 'PG',
        'screeningTime': 'Monday 1 Jan 2027, 18:00',
        'ticketPrice': 7.5,
        'posterImagePath': 'assets/images/interstellar.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.id, 'json-film');
      expect(movie.title, 'Json Film');
      expect(movie.synopsis, 'A film created from JSON.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Monday 1 Jan 2027, 18:00');
      expect(movie.ticketPrice, 7.5);
      expect(movie.posterImagePath, 'assets/images/interstellar.jpg');
      expect(movie.toJson(), json);
    });

    test('fromJson converts a whole-number price to a double', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'whole-price-film',
        'title': 'Whole Price Film',
        'synopsis': 'A film with a whole-pound price.',
        'ageRating': 'U',
        'screeningTime': 'Tuesday 2 Jan 2027, 15:00',
        'ticketPrice': 8,
        'posterImagePath': 'assets/images/lionking.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.ticketPrice, isA<double>());
      expect(movie.ticketPrice, 8.0);
      expect(movie.formattedPrice, '£8.00');
    });
  });
}
