class MovieModel {
  final String? movieName;
  final String? imageUrl;
  final String? year;
  final String? movieRating;
  final List<String>? genres;
  final String? status;
  final String? summary;

  MovieModel({
    this.movieName,
    this.imageUrl,
    this.year,
    this.movieRating,
    this.genres,
    this.status,
    this.summary,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      movieName: json['name'],
      imageUrl: json['image']?['original'],
      year: json['premiered']?.substring(0, 4),
      movieRating: json['rating']?['average']?.toString(),
      genres: (json['genres'] as List<dynamic>?)?.cast<String>(),
      status: json['status'],
      summary: json['summary'] ?? '',
    );
  }
}
