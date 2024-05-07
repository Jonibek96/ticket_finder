class Offer {
  final int id;
  final String title;
  final String town;
  final Price price;

  Offer({required this.id, required this.title, required this.town, required this.price});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      town: json['town'],
      price: Price.fromJson(json['price']),
    );
  }
}

class Price {
  final int value;

  Price({required this.value});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      value: json['value'] ?? 0,
    );
  }
}