class MovieModel {
  final String name;
  final String? year;
  final String? rating;
  final String imageUrl;

  MovieModel({
    required this.name,
    required this.imageUrl,
    this.year,
    this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['name'] ?? 'N/A',
      year: json['premiered'] != null ? json['premiered'].split('-')[0] : 'N/A',
      rating: json['rating']['average']?.toString() ?? 'N/A',
      imageUrl: json['image'] != null ? json['image']['medium'] : 'https://via.placeholder.com/150',
    );
  }
}
