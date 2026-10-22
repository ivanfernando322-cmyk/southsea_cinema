import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

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
            DropdownMenu<int>(
              initialSelection: _ticketQuantity,
              label: const Text('Tickets'),
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Tickets selected: $_ticketQuantity',
              style: const TextStyle(color: cinemaFontMuted),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingMessage = 'Added $_ticketQuantity tickets';
                });
                print(_bookingMessage);
              },
              child: const Text('Add to order'),
            ),
            const SizedBox(height: 8),
            Text(
              _bookingMessage,
              style: const TextStyle(color: cinemaFontWhite),
            ),
          ],
        ),
      ),
    );
  }
}
