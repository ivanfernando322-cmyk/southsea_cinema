import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
            body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interstellar (2014)',
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              '125 mins',
              style: TextStyle(color: cinemaFontMuted),
            ),
            const SizedBox(height: 8),
            const Text(
              'In a dystopian future where Earth has become near-uninhabitable,'
              'a team of astronauts embark on a mission to find a new home for humanity. ',
              style: TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print('Add to order button pressed');
              },
              child: const Text('Add to order'),
            ),
          ],
        ),
      ),
    );
  }
}
