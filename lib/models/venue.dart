/// A bookable venue. Static mock data for now, until there is a backend.
class Venue {
  const Venue({
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.price,
    this.promo,
  });

  final String image;
  final String name;
  final String rating;
  final String location;
  final String price;

  /// Optional offer text, e.g. "30% off this Friday night".
  final String? promo;
}
