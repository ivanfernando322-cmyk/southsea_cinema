import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:flutter/services.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });
  group('App smoke tests', () {
    testWidgets('App displays HomeView with the cinema title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Home page displays a movie card for each film',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.byType(MovieCard), findsNWidgets(2));
      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('The Lion King'), findsOneWidget);
    });

    testWidgets('Home page displays prices and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text('£7.50'), findsNWidgets(2));
      expect(find.text('Book tickets'), findsNWidgets(2));
    });
  });
}
