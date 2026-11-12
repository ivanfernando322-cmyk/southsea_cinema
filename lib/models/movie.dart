class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double ticketPrice;
  final String posterImagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.ticketPrice,
    required this.posterImagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String synopsis = json['synopsis'] as String;
    final String ageRating = json['ageRating'] as String;
    final String screeningTime = json['screeningTime'] as String;
    final num priceNumber = json['ticketPrice'] as num;
    final double ticketPrice = priceNumber.toDouble();
    final String posterImagePath = json['posterImagePath'] as String;

    return Movie(
      id: id,
      title: title,
      synopsis: synopsis,
      ageRating: ageRating,
      screeningTime: screeningTime,
      ticketPrice: ticketPrice,
      posterImagePath: posterImagePath,
    );
  }

  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'screeningTime': screeningTime,
      'ticketPrice': ticketPrice,
      'posterImagePath': posterImagePath,
    };
    return data;
  }

}
