import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'With Earth becoming uninhabitable, a team of astronauts '
            'travels through a wormhole to search for a new home for humanity.',
        ageRating: '12A',
        screeningTime: 'Thursday 29 Oct 2026, 18:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/interstellar.jpg',
      ),
      const Movie(
        id: 'lion-king',
        title: 'The Lion King',
        synopsis:
            'A young lion prince flees his kingdom after his father\'s death, '
            'then must return to take his place as king.',
        ageRating: 'PG',
        screeningTime: 'Friday 30 Oct 2026, 15:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/lionking.jpg',
      ),
    ];
  }
}
