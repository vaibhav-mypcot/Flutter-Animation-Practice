class TraveModel {
  final String city;
  final String country;
  final String rating;

  TraveModel({
    required this.city,
    required this.country,
    required this.rating,
  });

  String get image => 'assets/images/${city.toLowerCase()}.jpg';
}
