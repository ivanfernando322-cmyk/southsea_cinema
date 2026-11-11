import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

const Movie testMovie = Movie(
  id: 'test-film',
  title: 'Test Film',
  synopsis: 'A film used for testing.',
  ageRating: 'PG',
  screeningTime: 'Monday 1 Jan 2027, 18:00',
  ticketPrice: 10.0,
  posterImagePath: 'assets/images/interstellar.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketScreen widget tests', () {
    testWidgets('displays empty message when basket has no items',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

      expect(find.text('Your basket is empty'), findsOneWidget);
      expect(find.text('Checkout'), findsNothing);
    });

    testWidgets('renders items and totals', (WidgetTester tester) async {
      BasketRepository.instance.addItem(
        const BasketItem(movie: testMovie, quantity: 2),
      );

      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

      expect(find.text('Your basket'), findsOneWidget);
      expect(find.text('2 x Test Film'), findsOneWidget);
      expect(find.text('£20.00'), findsWidgets);
      expect(find.text('Checkout'), findsOneWidget);
    });

    testWidgets('removes an item when delete is pressed',
        (WidgetTester tester) async {
      BasketRepository.instance.addItem(
        const BasketItem(movie: testMovie, quantity: 2),
      );

      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
      expect(BasketRepository.instance.getItems(), isEmpty);
    });

    testWidgets('checkout clears the basket and shows confirmation',
        (WidgetTester tester) async {
      BasketRepository.instance.addItem(
        const BasketItem(movie: testMovie, quantity: 1),
      );

      await tester.pumpWidget(const MaterialApp(home: BasketScreen()));

      await tester.tap(find.text('Checkout'));
      await tester.pump();

      expect(find.text('Thanks, your booking is confirmed'), findsOneWidget);
      expect(BasketRepository.instance.getItems(), isEmpty);
    });
  });
}
