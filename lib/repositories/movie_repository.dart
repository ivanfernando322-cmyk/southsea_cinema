import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
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

  Movie? getMovieById(String id) {
    for (final Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}
