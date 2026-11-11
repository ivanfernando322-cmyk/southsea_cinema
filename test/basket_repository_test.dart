import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'test-film-1',
  title: 'Test Film One',
  synopsis: 'A film used for testing.',
  ageRating: 'PG',
  screeningTime: 'Monday 1 Jan 2027, 18:00',
  ticketPrice: 10.0,
  posterImagePath: 'assets/images/interstellar.jpg',
);

const Movie testMovie2 = Movie(
  id: 'test-film-2',
  title: 'Test Film Two',
  synopsis: 'Another film used for testing.',
  ageRating: 'U',
  screeningTime: 'Tuesday 2 Jan 2027, 15:00',
  ticketPrice: 6.0,
  posterImagePath: 'assets/images/lionking.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with an empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotalTickets(), 0);
      expect(basket.getTotalDue(), 0.0);
    });

    test('adds items and calculates totals correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const BasketItem(movie: testMovie1, quantity: 2));
      basket.addItem(const BasketItem(movie: testMovie2, quantity: 1));

      expect(basket.getItems().length, 2);
      expect(basket.getTotalTickets(), 3);
      expect(basket.getTotalDue(), 26.0);
    });

    test('removes an item correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const BasketItem(movie: testMovie1, quantity: 1));
      expect(basket.getItems().length, 1);

      basket.removeItem(0);
      expect(basket.getItems().length, 0);
      expect(basket.getTotalDue(), 0.0);
    });

    test('clear empties the basket', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const BasketItem(movie: testMovie1, quantity: 3));
      basket.addItem(const BasketItem(movie: testMovie2, quantity: 2));
      basket.clear();

      expect(basket.getItems(), isEmpty);
      expect(basket.getTotalTickets(), 0);
      expect(basket.getTotalDue(), 0.0);
    });
  });
}